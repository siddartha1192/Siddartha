    $pass = '<password>'
    $vCenters = @("full_vCenterName1","full_vCenterName2",full_vCenterName3)
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
foreach($vc in $vCenters)
{
Connect-VIServer $vc -User '<UserName>' -Password $pass 
}

