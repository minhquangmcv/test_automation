#!/bin/bash
CONFIG_PATH="./scripts/config.sh"

cd ..

. "$CONFIG_PATH"

# git checkout -f
# git clean -fd
# git pull

cd ./test_automation
melos.bat version rong_vang_dev $RONG_VANG_VERSION --yes --no-changelog
melos.bat version rong_vang_prod $RONG_VANG_VERSION --yes --no-changelog

git add ../scripts/config.sh
git add ../app/rong_vang_dev/pubspec.yaml
git add ../app/rong_vang_prod/pubspec.yaml

git commit -m 'Update version to $RONG_VANG_VERSION'

git status