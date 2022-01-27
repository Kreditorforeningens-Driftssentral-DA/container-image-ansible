# container-image-ansible
[![Build (Docker)](https://github.com/Kreditorforeningens-Driftssentral-DA/container-image-ansible/actions/workflows/docker-build.yml/badge.svg)](https://github.com/Kreditorforeningens-Driftssentral-DA/container-image-ansible/actions/workflows/docker-build.yml)

Debian container, with python/ansible installed.

- Source on [GitHub](https://github.com/Kreditorforeningens-Driftssentral-DA/container-image-ansible)
- Pull image from [GitHub](https://github.com/Kreditorforeningens-Driftssentral-DA/container-image-ansible/pkgs/container/container-image-ansible)
- Pull image from [Docker Hub](https://hub.docker.com/r/kdsda/ansible)


#### ENVIRONMENT VARIABLES

| VARIABLE | DEFAULT | DESCRIPTION |
| :-- | :-: | :-- |
| RUN_AS_ROOT | (Unset)  | Run container/commands as root (defaults unprivileged user) |


#### EXAMPLE USE

```bash
# Default (print version)
docker run --rm -it kdsda/ansible:0.1

# Map folder & start shell
docker run -v $(pwd)/playbooks:/srv/playbooks:ro --rm -it kdsda/ansible:0.1 bash

# Map folder & start shell (as root)
docker run -v $(pwd)/playbooks:/srv/playbooks:ro -e RUN_AS_ROOT=1 --rm -it kdsda/ansible:0.1 bash

```
