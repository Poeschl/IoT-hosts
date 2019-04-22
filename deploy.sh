#!/bin/bash

if [[ $TRAVIS_BRANCH == 'master' ]] ; then
  cd dist
  git init

  git config user.name "Travis CI"
  git config user.email "travis@travis-ci.org"

  git add hosts
  git commit -m "Deploy ${TRAVIS_COMMIT}"

  # We redirect any output to
  # /dev/null to hide any sensitive credential data that might otherwise be exposed.
  git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:dist > /dev/null 2>&1
  
  echo 'hosts file deployed on master'
else
  echo 'Invalid branch. You can only deploy from master branch.'
  exit 1
fi
