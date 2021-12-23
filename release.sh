#!/usr/bin/env bash
set -e
my_dir="$(dirname "$0")"
yarn test
yarn build
git add .
git commit -am "chose: update release" || true
npm version patch
git push
git push --tags
cp package.json README.md LICENSE.md yarn.lock ./dist/
npm publish ./dist
