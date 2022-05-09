#!/bin/bash

HOME_DIR=$(dirname "$0")
TARGET_DIR=${1:-.}

PATH=$PATH:/usr/local/bin

if ! which pytest &> /dev/null || ! which flake8 &> /dev/null ; then
	echo "Missing dependencies. Consider running the following command:"
	echo "  python -m pip install flake8 pytest pytest-cov"
	exit 1
fi

flake8 "$TARGET_DIR" "--config=${HOME_DIR}/pytest.ini"
pytest "$TARGET_DIR" "--cov-config=${HOME_DIR}/pytest.ini" "--cov=$TARGET_DIR" --doctest-modules --cov-report=term --cov-fail-under=100