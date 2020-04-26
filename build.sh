#!/bin/bash

set -e

docker run --rm -v "$(pwd)":/documents/ \
  asciidoctor/docker-asciidoctor asciidoctor index.adoc --out-file=dist/index.html

docker run --rm -v "$(pwd)":/documents/ \
  asciidoctor/docker-asciidoctor asciidoctor-pdf index.adoc --out-file=dist/social-architecture-ru.pdf

docker run --rm -v "$(pwd)":/documents/ \
  asciidoctor/docker-asciidoctor asciidoctor-epub3 index.adoc --out-file=dist/social-architecture-ru.epub
