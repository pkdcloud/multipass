# multi.ps1

multipass delete --all
multipass purge
multipass launch --name ubuntu-1 --cloud-init .\cloud-init.yaml
multipass shell ubuntu-1