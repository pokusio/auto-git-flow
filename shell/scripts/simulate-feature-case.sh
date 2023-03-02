#!/bin/bash

export AUTO_GIT_FLOW_MAIN_TITLE=${AUTO_GIT_FLOW_MAIN_TITLE:-"Auto Git Flow"}
export AUTO_GIT_FLOW_WORK_HOME=$(mktemp -d -t 'auto-git-flow-XXXXXXXXXXXXXXXXXXX')
export AUTO_GIT_FLOW_COMMIT1_MSG=${AUTO_GIT_FLOW_COMMIT1_MSG:-" [$0] simulate git flow feature [new commit1]  "}
export AUTO_GIT_FLOW_COMMIT2_MSG=${AUTO_GIT_FLOW_COMMIT2_MSG:-" [$0] simulate git flow feature [new commit2]  "}
export AUTO_GIT_FLOW_COMMIT3_MSG=${AUTO_GIT_FLOW_COMMIT3_MSG:-" [$0] simulate git flow feature [new commit3]  "}

export GIT_REPO_SSH_URI=${GIT_REPO_SSH_URI:-'git@github.com:pokusio/auto-git-flow.git'}
export FEATURE_ALIAS=${FEATURE_ALIAS:-"ccc"}
# --- 
echo "   AUTO_GIT_FLOW_MAIN_TITLE=[${AUTO_GIT_FLOW_MAIN_TITLE}]"
echo "   AUTO_GIT_FLOW_WORK_HOME=[${AUTO_GIT_FLOW_WORK_HOME}]"
echo "   AUTO_GIT_FLOW_INIT_COMMIT_MSG=[${AUTO_GIT_FLOW_INIT_COMMIT_MSG}]"
echo "   GIT_REPO_SSH_URI=[${GIT_REPO_SSH_URI}]"
# --- 
cd ${AUTO_GIT_FLOW_WORK_HOME}
git clone ${GIT_REPO_SSH_URI} .
git flow init --defaults
git flow feature start "${FEATURE_ALIAS}"
git push -u origin --all


# --- 
# doc.for.${FEATURE_ALIAS}.feature.md
echo "I was added while working on [feature/${FEATURE_ALIAS}], in first commit on branch, right after commit [$(git rev-parse --short=40 HEAD)]." > doc.for.${FEATURE_ALIAS}.feature.md
git add -A && git commit -m "${AUTO_GIT_FLOW_INIT_COMMIT_MSG}" && git push -u origin master
export GIT_SQUASH_FIRST_COMMIT=$(git rev-parse --short=40 HEAD)

echo "I was added while working on [feature/${FEATURE_ALIAS}], in second commit on branch, right after commit [$(git rev-parse --short=40 HEAD)]." > doc.for.${FEATURE_ALIAS}.feature.md
git add -A && git commit -m "${AUTO_GIT_FLOW_INIT_COMMIT_MSG}" && git push -u origin master

echo "I was added while working on [feature/${FEATURE_ALIAS}], in third commit on branch, right after commit [$(git rev-parse --short=40 HEAD)]." > doc.for.${FEATURE_ALIAS}.feature.md
git add -A && git commit -m "${AUTO_GIT_FLOW_INIT_COMMIT_MSG}" && git push -u origin master

echo ''
echo '# --- # --- # --- '
echo ''
echo " To git squash the commit on branch [feature/${FEATURE_ALIAS}], run :"
echo "    git rebase -i ${GIT_SQUASH_FIRST_COMMIT}"
echo ''
echo '# --- # --- # --- '
echo ''