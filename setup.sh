#!/usr/bin/env bash
#
# Setup or update pandemic-bundles with Pandemic.
#
# 1. Ensures pandemic is installed in a virtualenv, `./.env`.
# 2. Installs/updates all bundles in `pandemic-bundles` with pandemic
#

# PANDEMIC_SOURCE='git+https://github.com/jwcxz/vim-pandemic.git#egg=Pandemic'
PANDEMIC_SOURCE='git+https://github.com/fredrikhl/vim-pandemic.git#egg=Pandemic'
# MAKE_VENV='virtualenv'
MAKE_VENV='python3 -m venv'

die() { >&2 echo "ERROR: $*"; exit 1; }

[ -d .env ] || die "no virtualenv dir, check \$PWD"
if [ ! -e .env/bin/activate ]; then
    $MAKE_VENV .env || die "cannot setup virtualenv"
fi

.env/bin/pip install -U "$PANDEMIC_SOURCE" || die "Unable to install pandemic"
.env/bin/pandemic update || die "Unable to update packages"

# update helptags with pathogen
vim -c Helptags -c quit
