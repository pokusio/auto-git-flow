#!/bin/bash

# Peter Van Der Does lui-même s'exprime sur ce post : 
# https://stackoverflow.com/questions/14531243/git-flow-release-finish-non-interactively

export AUTO_GIT_FLOW_MAIN_TITLE=${AUTO_GIT_FLOW_MAIN_TITLE:-"Auto Git Flow"}
export AUTO_GIT_FLOW_WORK_HOME=$(mktemp -d -t 'auto-git-flow-XXXXXXXXXXXXXXXXXXX')
export AUTO_GIT_FLOW_INIT_COMMIT_MSG=${AUTO_GIT_FLOW_INIT_COMMIT_MSG:-'git flow init'}
export GIT_REPO_SSH_URI=${GIT_REPO_SSH_URI:-'git@github.com:pokusio/auto-git-flow.git'}
# --- 
echo "   AUTO_GIT_FLOW_MAIN_TITLE=[${AUTO_GIT_FLOW_MAIN_TITLE}]"
echo "   AUTO_GIT_FLOW_WORK_HOME=[${AUTO_GIT_FLOW_WORK_HOME}]"
echo "   AUTO_GIT_FLOW_INIT_COMMIT_MSG=[${AUTO_GIT_FLOW_INIT_COMMIT_MSG}]"
echo "   GIT_REPO_SSH_URI=[${GIT_REPO_SSH_URI}]"
# --- 

export RELEASE_MSG="New release:$releaseVersion"
export GIT_TAG=$releaseVersion
export GIT_TAG=$releaseVersion



# git flow release finish -m 'Merge Message' release_branch_name


git flow release start $releaseVersion
#
# -
# --
# --- 
# here you could run a build, and
# publish the assets like package, to
# an npm registry, a maven or python
# repository, a docker image, bump version (means to increment the version number to a new, unique value), etc...
# ---
# --
# -
#
# bump version : https://github.com/nvie/gitflow/issues/26#issuecomment-222459
# > 
# > Bumping refers to the act of increasing your version number. As far as branches are concerned, gitflow does this automatically for you. But your application (or whatever you are versioning) probably wants to know which version it currently is. This is something that you still need to do manually, of course.
# > 
# > When gitflow reports that you should "bump your version number now", it means this: update your files manually so that they reflect the correct version number.
# 
#   - If the release is a major release : increment major version, set to zero minor version, the next version is a minor version on minor version 0
#   - If the release is a minor release : the next version is a patch version on minor version 0
#   - From (develop, or) a support branch, we bump version with any git tagging and computed next version is incrementing patch version, and appended by `-SNAPSHOT`, the commit id is then very important as package metadata.
# means to increment the version number to a new, unique value.
git flow release finish -m "New release:$releaseVersion" -T
$releaseVersion -S $releaseVersion
# where :
#   '-m' sets the commit message,
#   '-T' sets the tag message
#   '-S' to squash commit.

git flow release finish -m "New release:$releaseVersion" -T $releaseVersion -S $releaseVersion

unset GIT_MERGE_AUTOEDIT


git remote add origin ${GIT_REPO_SSH_URI}
git add -A && git commit -m "${AUTO_GIT_FLOW_INIT_COMMIT_MSG}" && git push -u origin master














exit 0
echo "# ${AUTO_GIT_FLOW_MAIN_TITLE}" > ./README.md
git remote add origin ${GIT_REPO_SSH_URI}
git add -A && git commit -m "${AUTO_GIT_FLOW_INIT_COMMIT_MSG}" && git push -u origin master
git flow init --defaults
git push -u origin --all
