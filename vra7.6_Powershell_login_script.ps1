Import-Module powervra -RequiredVersion 3.6.0
# Enter your pass and stores it securely:
$SecureString = Read-Host -AsSecureString 'Enter the Password' | ConvertFrom-SecureString | ConvertTo-SecureString
# Users you password securly
$MySecureCreds = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList "<full_user_id>",$SecureString
# Sets yous credentials to be used
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
$vra = Connect-vRAServer -Server c2c.cloud.kp.org -Credential (Get-Credential $MySecureCreds) -Tenant  KPPC -IgnoreCertRequirements
write-host $vra
