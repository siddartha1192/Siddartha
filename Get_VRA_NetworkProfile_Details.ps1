#This Script will get the all the network profile details of vRa(7.X) and user can view which IP is allocated and it's respective server and how many free IP is present in VRA.

$cred = get-Credential #Enter the Credential 
Connect-vRAServer -Server <vRa_Appliance_Name> -Tenant KPPC -Credential $cred -IgnoreCertRequirements
$network_profiles = Get-vRAExternalNetworkProfile
foreach($network1 in ($network_profiles ))
{
$network2 = Get-vRAExternalNetworkProfile -Name $network1.Name
$range = $network2.DefinedRanges
    foreach ($range1 in $range)
    {
    $output3 += @($range1 | select @{n="portgroupName";e={$network1.Name}},@{n="IsHidden :";e={$network1.IsHidden}},beginIPv4Address,endIPv4Address)
    }
    $VM_IP = $range.definedAddresses
    foreach($vm_ip1 in $vm_ip)
    {
    $vm_out += @($vm_ip1 | select virtualMachineName,IPv4Address,@{n="portgroupName";e={$network1.Name}})

    }
    Remove-Variable -Name range
}
$output3 | Export-Csv -Path c:\network_profile.csv
$vm_out | Export-Csv -Path c:\vm_list.csv