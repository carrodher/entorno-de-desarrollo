#!/bin/bash

if [[ $USER_EMAIL && $USER_NAME ]]; then
  printf '[initialization] Configuring Git with email=%s and name=%s\n' "${USER_EMAIL}" "${USER_NAME}"
  git config --global user.email "${USER_EMAIL}" && git config --global user.name "${USER_NAME}"
else
  printf '[initialization] WARNING! Git not configured\n'
fi

# Execute initialization scripts
for script in /initScripts/*.sh; do
  printf '[initialization] Running %s\n' "$script";
  "$script";
done

exec "$@"