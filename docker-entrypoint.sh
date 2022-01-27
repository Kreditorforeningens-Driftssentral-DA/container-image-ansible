#!/usr/bin/dumb-init /bin/bash

# Run commands as ansible user, unless env is set
if [ -z "${RUN_AS_ROOT}" ]; then
  set -- gosu ansible ${@}
fi

# (Re)Activate ansible virtual environment
# if no venv is activated
if [ -z "${VIRTUAL_ENV}" ]; then
  . ${ANSIBLE_VENV_PATH}/bin/activate
fi

exec ${@}
