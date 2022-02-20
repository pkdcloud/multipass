# multi.ps1

$COMMAND = $args[0]
$MACHINE_NAME = $args[1]

$CLOUD_INIT_TEMPLATE = ".\config\cloud-init\ubuntu-latest.yaml"
$CLOUD_INIT_FILE = ".\config\cloud-init\cloud-init.yaml"
$SSH_PATH = "$env:USERPROFILE/.ssh"
$AWS_CONFIG_PATH = "$env:USERPROFILE/.aws/config"
$MULTIPASS_KEY_NAME = "multipass"

function Base64EncodeFile {
	param ( $FILE_PATH )
	return  [convert]::ToBase64String((Get-Content -path $FILE_PATH -Encoding byte))
}

function CloudInitStringReplace {
	param ( $SOURCE_FILE, $SOURCE_STRING, $STRING_TO_REPLACE )
	$SOURCE_FILE.replace($STRING_TO_REPLACE, $SOURCE_STRING) | Set-Content $CLOUD_INIT_FILE
}

function CreateSSHKey {
	param (	$KEY_NAME )
	ssh-keygen -t rsa -b 4096 -f $SSH_PATH/$KEY_NAME -q -N '""'
}

function DeleteSSHKey {
	param (	$KEY_NAME )
	Remove-Item $SSH_PATH/$KEY_NAME*
}

switch ($COMMAND) {
	"launch" {
		Write-Host "--- Creating Cloud Init File"
		Copy-Item $CLOUD_INIT_TEMPLATE $CLOUD_INIT_FILE

		Write-Host "--- Generating SSH key"
		CreateSSHKey $MULTIPASS_KEY_NAME

		Write-Host "--- Adding SSH Config to cloud-init.yaml"
		CloudInitStringReplace (Get-Content -path $CLOUD_INIT_FILE -Raw) (Get-Content -path $SSH_PATH/$MULTIPASS_KEY_NAME.pub -Raw) "{{ssh-public-key}}" 

		Write-Host "--- Adding AWS Config to cloud-init.yaml"
		CloudInitStringReplace (Get-Content -path $CLOUD_INIT_FILE -Raw) (Base64EncodeFile $AWS_CONFIG_PATH) "{{aws-config}}" 

		Write-Host "--- Launching Virtual Machine"
		multipass launch -c 4 -m 8192M -vvvv --name $MACHINE_NAME --cloud-init $CLOUD_INIT_FILE

		Write-Host "--- Cleaning Up"
		Remove-Item $CLOUD_INIT_FILE

		Write-Host "--- Logging into $MACHINE_NAME VM"
		multipass shell $MACHINE_NAME
	}
	"shell" {
		multipass shell $MACHINE_NAME
	}
	"clean" {
		DeleteSSHKey $MULTIPASS_KEY_NAME
		multipass delete --all
		multipass purge
	}
}
