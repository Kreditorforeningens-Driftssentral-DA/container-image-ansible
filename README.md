# container-image-ansible
[![Ansible Build and Push (Public)](https://github.com/Kreditorforeningens-Driftssentral-DA/container-image-ansible/actions/workflows/docker-public.yml/badge.svg)](https://github.com/Kreditorforeningens-Driftssentral-DA/container-image-ansible/actions/workflows/docker-public.yml)

Debian container, with python/ansible installed.


#### ENVIRONMENT VARIABLES

| VARIABLE | DEFAULT | DESCRIPTION |
| :-- | :-: |:-- |
| RUN_AS_ROOT | (Unset)  | Run container/commands as root (defaults unprivileged user) |

#### EXAMPLES

```bash
# Default (print version)
docker run --rm -it kdsda/ansible:0.1

# Map folder & start shell
docker run -v $(pwd)/playbooks:/srv/playbooks:ro --rm -it kdsda/ansible:0.1 bash

# Map folder & start shell (as root)
docker run -v $(pwd)/playbooks:/srv/playbooks:ro -e RUN_AS_ROOT=1 --rm -it kdsda/ansible:0.1 bash

```