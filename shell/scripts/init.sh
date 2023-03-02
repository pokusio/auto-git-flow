#!/bin/bash

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
cd ${AUTO_GIT_FLOW_WORK_HOME}
ls -alh
git init
touch README.md
echo "# ${AUTO_GIT_FLOW_MAIN_TITLE}" > ./README.md
git remote add origin ${GIT_REPO_SSH_URI}
git add -A && git commit -m "${AUTO_GIT_FLOW_INIT_COMMIT_MSG}" && git push -u origin master
git flow init --defaults
git push -u origin --all
