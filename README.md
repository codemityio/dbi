# ![Docker Base Images](logo.jpg)

## Table of contents

- [Summary](#summary)
- [Usage](#usage)
  - [`make`](#make)
  - [`make build`](#make-build)
  - [`make prep`](#make-prep)
- [Images](#images)
- [License](#license)

## Summary

A repository of **Docker** base images.

## Usage

### `make`

``` bash
$ make
build                          Build all images (use IMAGES env var to list specific images e.g. IMAGES=alpine make build)
buildx                         Build all images - multi-platform (use IMAGES env var to list specific images e.g. IMAGES=alpine make buildx)
diff                           Check diff to ensure this project consistency
docs-img                       Generate img docs
docs-main                      Generate main docs
docs                           Generate all docs
help                           Prints help for targets with comments
next                           Create a new version (bump prerelease or patch)
prep                           Prepare dev tools
push                           Push images
reset                          Reset the environment
version                        Print the most recent version
```

### `make build`

This will re-build the images on your machine.

### `make prep`

This will get up to speed with deps to work with the project.

## Images

- [`alpine`](img/alpine/README.md) - **Alpine** base image.
- [`golang-dev`](img/golang-dev/README.md) - **Golang** dev base image.
- [`golang`](img/golang/README.md) - **Golang** base image.
- [`graph`](img/graph/README.md) - Base image containing packages to work with diagrams
  (<https://gitlab.com/graphviz/graphviz>, <https://github.com/mermaid-js/mermaid-cli> and
  <https://github.com/plantuml/plantuml>).
- [`pandoc`](img/pandoc/README.md) - **Pandoc** universal document converter <https://github.com/jgm/pandoc>.
- [`type`](img/type/README.md) - Base image containing tools to work with types.
- [`ubuntu`](img/ubuntu/README.md) - **Ubuntu** base image.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
