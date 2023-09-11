# SAP - Simplified Aws Profiles

A shell function to make working with AWS SSO Simpler.

## Installation

```
git clone this-repo.git ~/sap/
. ~/sap/sap.sh

echo '' >> ~/.zshrc
echo '# Include Simplified Aws Profiles in the shell' >> ~/.zshrc
echo '. ~/sap/sap.sh' >> ~/.zshrc
```

## Setup

### Setup your AWS SSO

SAP assumes your AWS CLI configuration is already setup. If not, please follow the instructions here: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html

Or you can run `aws configure sso`

```
$ aws configure sso
SSO session name (Recommended): my-sso
SSO start URL [None]: https://my-sso-portal.awsapps.com/start
SSO region [None]: us-east-1
SSO registration scopes [None]: sso:account:access
```

Or you can write this block to ~/.aws/config

```
[sso-session my-sso]
sso_start_url = https://my-sso-portal.awsapps.com/start
sso_region = us-east-1
sso_registration_scopes = sso:account:access
```

### Setup AWS Profiles

SAP assumes you have a ~/.aws/config file with profiles setup. If not, please follow the instructions here: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html

```
[account-1]
sso_session = my-sso
sso_account_id = 111122223333
sso_role_name = my-role
region = us-west-2
output = text

[account-2]
sso_session = my-sso
sso_account_id = 2222444466666
sso_role_name = my-role
region = us-west-2
output = text
```

## Usage

List your profiles with `sap`

```
$ sap
 1 account-1
 2 account-2
```

Get an sso session token for the sso session used by the target profile by passing `-l` to `sap ${LINE_NUMBER} -l`.

```
sap 1 -l
```

Switch profile with `sap ${LINE_NUMBER}`. You don't need to login if your sso session token is still valid for this profile too.

```
sap 1
```
