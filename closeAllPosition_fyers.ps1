
$token = 'gAAAAABg9koQWkf159sLvqmsjeqCVxpHssPGXlysKKICdo5nwGrzRv2nUx70C-IYQof6cSFG5hGK5vMhXgzjCoBZ8EZUm_M4B-dwhIKkK6TPic0XQuJ3YV8='
$Zerodha_token= 'INJLFbvdtzHjhlyOGogPBPs2vXYfziJI'
function Cancel-Allposition($token)
{

    $json = $host | select @{n='symbol';e={'NSE:SBIN-EQ'}} | ConvertTo-Json
    $data1 = Invoke-WebRequest -Method Post -Uri 'https://api.fyers.in/api/v1/exit_positions' -ContentType 'application/json' -Body $json -Headers @{"Authorization"=$token}
    $OrderStatus = $data1.Content | ConvertFrom-Json
    $OrderStatus.message
    

}
Cancel-Allposition($token)