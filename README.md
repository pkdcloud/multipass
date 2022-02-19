# pkdcloud/multipass

A repo to build fresh ubuntu virtual machines with cloud-init.

## Motivation

Quite often I just want a new fresh development environment with all my base tooling and shell installed. 

This repository allows creation of new Ubuntu Virtual Machines using multipass and cloud-init in an easy manner and bootstraps the environment with all the required tools I need to start fresh.

## Requirements

- git 		:	https://git-scm.com/
- multipass : 	https://multipass.run/

## Tools install

Take a look at the cloud-init.yaml file

### How to use

To use just clone this repo and change into the directory.

```
.\multi.ps1 [COMMAND] Args
```

#### Powershell

```ps
.\multi.ps1 ubuntu-1
```

#### Linux & MacOS (Coming Soon)

```sh
./multi.sh ubuntu-1
```
