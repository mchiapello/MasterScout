#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "main" ] && exit 0

git config --global user.email "chiapello.m@gmail.com"
git config --global user.name "Marco Chiapello"

git clone -b gh-pages https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git book-output
cd book-output
cp -r ../_book/* ./
git add --all *
git commit -m"Update the book" || true
git push -q origin gh-pages
