$vRainfra = @('(Puppet) cskpcloudxm1020','(Puppet) cskpcloudxm1021','(Puppet) cskpcloudxm1025','(Puppet) cskpcloudxm1026','(Puppet) cskpcloudxm1027','(vRA Mgr) cskpcloudwm1125','(vRA Mgr) cskpcloudwm1127','(vRA Proxy Dev)cskpcloudwm7008','(vRA Proxy Dev)cskpcloudwm7009','(vRA Proxy Prod)cskpcloudwm7006','(vRA Proxy Prod)cskpcloudwm7007','(vRA Proxy) cskpcloudwm1144','(vRA Proxy) cskpcloudwm1145','(vRA Proxy) cskpcloudwm1147','(vRA Proxy) cskpcloudwm7357','(vRA Proxy) cskpcloudwm7358','(vRA Proxy)cskpcloudvm7345','(vRA Proxy)cskpcloudvm7346','(vRA Proxy)cskpcloudwm1146','(vRA Proxy)cskpcloudwm7003','(vRA Proxy)cskpcloudwm7004','(vRA Proxy)cskpcloudwm7354','(vRA Proxy)cskpcloudwm7355','(vRA Proxy)cskpcloudwm7356','(vRA PS Proxy Sovlabs DMZ) dzkpcloudwm1000','(vRA PS Proxy) cskpcloudwm1100','(vRA SQL) cskpcloudwm1148','(vRA SQL) cskpcloudwm1149','(vRA util) csc2cwp00003803','(vRA util) csc2cxp00002078','(vRA Web) cskpcloudwm1133','(vRA Web) cskpcloudwm1134','(vRA Wkr) cskpcloudwm1122','(vRA Wkr) cskpcloudwm1123','(vRA Wkr) cskpcloudwm1124','(vRA) cskpcloudvm1236','(vRA) cskpcloudvm1237','(vRA) cskpcloudvm1238')
foreach($Server in $vRainfra)
{

$output_data += @(get-vm $server | Get-Snapshot | select @{n='VM Name';e={$Server}},@{n='Status';e={(get-vm $server).PowerState}},@{n='SnapshootName';e={$_.name}},@{n='SnapshotCreated';e={$_.Created}},@{n='vCenter';e={(get-vm $server).extensiondata.client.ServiceUrl.split('/')[2]}})
$output_data[-1]
}
$output_data | Out-GridView
Remove-Variable -Name output_data