#!/bin/bash

set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
TMP_DIR="/tmp"
TMP_SLUG="ok"
TMP_OUTPUT=${TMP_DIR}/${TMP_SLUG}

echo "> Cleaning previous attempt"
rm -rf ${TMP_OUTPUT}

echo "> Generating template"
poetry run cookiecutter ${SCRIPT_DIR}/template -o ${TMP_DIR}

echo "> Moving to output"
cd ${TMP_OUTPUT}

echo ">> Running install"
poetry install

echo ">> Running tests"
poetry run pytest

echo ">>> Setting git"
git init
git add .

echo ">> Running precommit"
poetry run pre-commit run --all-files

echo "> Showing progress"
find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf
tree
