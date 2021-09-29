$vRainfra = @('Server1','server2')
foreach($Server in $vRainfra)
{

$output_data += @(get-vm $server | Get-Snapshot | select @{n='VM Name';e={$Server}},@{n='Status';e={(get-vm $server).PowerState}},@{n='SnapshootName';e={$_.name}},@{n='SnapshotCreated';e={$_.Created}},@{n='vCenter';e={(get-vm $server).extensiondata.client.ServiceUrl.split('/')[2]}})
$output_data[-1]
}
$output_data | Out-GridView
Remove-Variable -Name output_data
