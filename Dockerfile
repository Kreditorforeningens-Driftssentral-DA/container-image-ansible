# ===============================================
# https://docs.docker.com/engine/reference/builder/
# https://docs.docker.com/compose/compose-file/compose-file-v3/
# https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible
# ===============================================

ARG IMAGE_NAME="debian"
ARG IMAGE_VERSION="stable-slim"

FROM ${IMAGE_NAME}:${IMAGE_VERSION}

ENV ANSIBLE_VENV_PATH="/opt/venv/ansible"

# INSTALL APT-PACKAGES
RUN set -ex \
  && echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
  && apt-get update \
  && apt-get -qqy install --no-install-recommends apt-utils vim.tiny > /dev/null 2>&1 \
  && apt-get -qqy install --no-install-recommends python3-simplejson python3-pip python3-venv \
  && apt-get -qqy install --no-install-recommends dumb-init gosu openssh-client \
  && apt-get autoclean

# INSTALL PIP PACKAGES
RUN set -ex \
  && python3 -m venv ${ANSIBLE_VENV_PATH} \
  && . ${ANSIBLE_VENV_PATH}/bin/activate \
  && python3 -m pip install --upgrade pip \
  && python3 -m pip install --upgrade paramiko ansible-core

# INSTALL ANSIBLE-GALAXY COLLECTION(S)
RUN set -ex \
  && . ${ANSIBLE_VENV_PATH}/bin/activate \
  && ansible-galaxy collection install community.general

# CREATE NON-PRIVILEGED USER
RUN set -ex \
  && addgroup ansible \
  && adduser --quiet \
     --ingroup ansible \
     --gecos "Ansible User" \
     --disabled-password ansible

WORKDIR /home/ansible

COPY --chmod="755" ["docker-entrypoint.sh", "/usr/local/bin/"]
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["ansible","--version"]
