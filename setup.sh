#!/usr/bin/env bash
#
# Setup or update pandemic-bundles with Pandemic.
#
# 1. Ensures pandemic is installed in a virtualenv, `./.env`.
# 2. Installs/updates all bundles in `pandemic-bundles` with pandemic
#

# PANDEMIC_SOURCE='git+https://github.com/jwcxz/vim-pandemic.git#egg=Pandemic'
PANDEMIC_SOURCE='git+https://github.com/fredrikhl/vim-pandemic.git#egg=Pandemic'

die() {
    >&2 echo "ERROR: $*"
    exit 1
}

# Common python utils for python 2 and 3
read -r -d '' PY3_UTILS << EOF
flake8
# flake8-pep257
pep8-naming
pep8
pylint
EOF

read -r -d '' PY2_UTILS << EOF
flake8
# flake8-pep257
pep8-naming ~= 0.12.1
pep8
pylint
EOF

# python 3 env
[ -d .py3-env ] || die "no py3-env dir, check \$PWD"
if [ ! -e .py3-env/bin/activate ]; then
    virtualenv -p python3 .py3-env || die "cannot setup py3 env"
fi

.py3-env/bin/pip install -U pip || die "Unable to upgrade pip - venv broken?"
.py3-env/bin/pip install -U -r <( echo "$PY3_UTILS" ) || die "Unable to install utils"


# python 2 env
[ -d .py2-env ] || die "no py2-env dir, check \$PWD"
if [ ! -e .py2-env/bin/activate ]; then
    virtualenv -p python2 .py2-env || die "cannot setup py2 env"
fi

# pip 21 will drop python 2 support
.py2-env/bin/pip install -U 'pip<21' || die "Unable to upgrade pip - venv broken?"
.py2-env/bin/pip install -U -r <( echo "$PY2_UTILS" ) || die "Unable to install utils"


# Install or upgrade pandemic
.py3-env/bin/pip install -U "$PANDEMIC_SOURCE" || die "Unable to install pandemic"
.py3-env/bin/pandemic update || die "Unable to update packages"

# update helptags with pathogen
vim -c Helptags -c quit
