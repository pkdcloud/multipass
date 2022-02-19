# multi.ps1

$COMMAND=$args[0]
$MACHINE_NAME=$args[1]
$CLOUD_INIT_SCRIPT=$args[2]

switch ($COMMAND)
{
    "launch" {
		multipass delete --all
		multipass purge
		multipass launch --name $MACHINE_NAME --cloud-init .\config\cloud-init\ubuntu-latest.yaml
		multipass shell $MACHINE_NAME
	}
    "shell" {
		multipass shell $MACHINE_NAME
	}
}
