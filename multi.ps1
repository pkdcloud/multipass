# multi.ps1

$COMMAND=$args[0]
$MACHINE_NAME=$args[1]
$CLOUD_INIT_SCRIPT=$args[2]

switch ($COMMAND)
{
    "launch" {
		ssh-keygen -t rsa -b 4096 -f $env:USERPROFILE/.ssh/multipass-$MACHINE_NAME -q -N '""'
		multipass launch -c 4 -m 8192M -vvvv --name $MACHINE_NAME --cloud-init .\config\cloud-init\ubuntu-latest.yaml
	}
    "shell" {
		multipass shell $MACHINE_NAME
	}
    "clean" {
		rm $env:USERPROFILE/.ssh/multipass*
		multipass delete --all
		multipass purge
	}
}
