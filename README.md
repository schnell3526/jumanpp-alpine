# jumanpp-alpine

This is a Docker image for [Juman++](https://github.com/ku-nlp/jumanpp "Juman++")

## Table of Contents

- [Install](#install)
- [Usage](#usage)

## Install

```bash
$ docker pull schnell3526/jumanpp-alpine
```

## Usage

You can use jumanpp in the container.
```bash
$ docker run -it --rm -v $PWD:/workdir schnell3526/jumanpp-alpine sh
```

You can use bellow command as jumanpp.
```bash
$ docker run -it --rm schnell3526/jumanpp-alpine
```