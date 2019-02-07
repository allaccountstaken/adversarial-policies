#!/usr/bin/env bash

SOURCE_DIRS="aprl modelfree experiments"

RET=0

echo "flake8 --version"
flake8 --version

echo "Linting code"
flake8 ${SOURCE_DIRS}
RET=$(($RET + $?))

echo "isort --version-number"
isort --version-number

echo "Checking import order using isort"
isort --recursive --diff ${SOURCE_DIRS}
isort --recursive --check-only ${SOURCE_DIRS}
RET=$(($RET + $?))

exit $RET