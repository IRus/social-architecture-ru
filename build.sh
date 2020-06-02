#!/bin/bash

set -e

mkdir -p dist

echo "Building html"
docker run --rm -v "$(pwd)":/documents/ \
  asciidoctor/docker-asciidoctor asciidoctor index.adoc \
  --out-file=dist/index.html \
  -a revdate="$(date "-I")" \
  -a revnumber="#${TRAVIS_COMMIT:-$(git log --pretty=format:'%h' -n 1)}"
cp cover.png dist/cover.png

echo "Building pdf"
docker run --rm -v "$(pwd)":/documents/ \
  asciidoctor/docker-asciidoctor asciidoctor-pdf index.adoc \
  --out-file=dist/social-architecture-ru.pdf \
  -a revdate="$(date "-I")" \
  -a revnumber="#${TRAVIS_COMMIT:-$(git log --pretty=format:'%h' -n 1)}"

echo "Building epub"
docker run --rm -v "$(pwd)":/documents/ \
  asciidoctor/docker-asciidoctor asciidoctor-epub3 index.adoc \
  --out-file=dist/social-architecture-ru.epub \
  -a revdate="$(date "-I")" \
  -a revnumber="#${TRAVIS_COMMIT:-$(git log --pretty=format:'%h' -n 1)}"

echo "Building done"
