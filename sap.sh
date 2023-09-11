# Select Aws Profile
function sap() {
	if [ $# -eq 0 ]; then
		cat ~/.aws/config | grep profile | cut -d' ' -f 2 | tr -d ] | nl -w2 -s' '
	else
		TARGET_PROFILE=$(cat ~/.aws/config | grep profile | cut -d' ' -f 2 | tr -d ] | sed "${1}q;d")
		export AWS_PROFILE=$TARGET_PROFILE
	fi

	if [ "$2" = "-l" ]; then
		echo Logging in as ${AWS_PROFILE} && aws sso login --profile ${AWS_PROFILE}
	fi
}

alias ame="aws sts get-caller-identity"
