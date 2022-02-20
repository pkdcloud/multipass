# pkdcloud/multipass

A repo to build fresh ubuntu virtual machines with cloud-init. Currently for PowerShell on Windows but I intend to extend this in the near future to support linux and macos with make targets. This should be minimal work as the bulk of the work is donein cloud init yaml configuration.

## Motivation

Working in multiple companies as a consultant and following installation documenation you often end up with a local environment loaded with software of varying versions and breaking things in the progress. In the quest to containerise everything and test build, test and deploy automation, quite often I just want a new fresh development environment with all my minimal base tooling and shell installed. 

This repository allows creation of new local Ubuntu virtual machines using multipass and cloud-init in an easy manner and bootstraps the environment with all the required tools I need to start fresh.

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
