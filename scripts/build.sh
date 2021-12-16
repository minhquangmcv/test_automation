#!/bin/bash
CONFIG_PATH="./scripts/add_github_profile.sh"
GIT_CONFIG_PATH="./scripts/config.sh"

. "$GIT_CONFIG_PATH"
. "$CONFIG_PATH"

echo
echo "================= CLEAN UP & UPDATE WORKSPACE ================="
git checkout -f
git clean -fd
git pull
echo
echo "----------------- END CLEAN UP & UPDATE WORKSPACE -----------------"
echo

echo
echo "================= UPGRADE VERSION ================="
echo
cd ./test_automation
melos.bat version rong_vang_dev $RONG_VANG_VERSION --yes --no-changelog
melos.bat version rong_vang_prod $RONG_VANG_VERSION --yes --no-changelog
echo
echo "----------------- END UPGRADE VERSION -----------------"
echo

echo
echo "================= COMMIT CHANGES ================="
echo
git add ../scripts/config.sh
git add ../app/rong_vang_dev/pubspec.yaml
git add ../app/rong_vang_prod/pubspec.yaml

git commit -m "Upgrade version to $RONG_VANG_VERSION"

git push

git status
echo
echo "----------------- END COMMIT CHANGES -----------------"
echo