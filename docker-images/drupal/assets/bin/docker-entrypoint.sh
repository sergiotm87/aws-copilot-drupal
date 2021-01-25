#!/bin/bash
set -eo pipefail
IFS=$'\n\t'
set -x

source /assets/bin/entrypoint.functions

process_templates

exec "$@"