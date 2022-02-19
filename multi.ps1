# multi.ps1

multipass delete --all
multipass purge
multipass launch --name ubuntu-1 --cloud-init .\config\cloud-init\ubuntu-latest.yaml
multipass shell ubuntu-1
