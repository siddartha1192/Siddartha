$token = 'gAAAAABg9Rhu5F6_7-F3_52DEXa3WUtOvM1Qn9YDx2SPX9LGXfxpJxd2f7kSyH_JD3GIF4-T8r3Z84YCkMM_lDn3IRfiWjEO_6JIP_mCUBL2uWX4Hfxq3OQ='

function Cancel-AllOpenOrdes($token)
{
    $header = @{"Authorization"=$token}
    $data1 = Invoke-WebRequest -Method Get -Uri 'https://api.fyers.in/api/v1/orders' -ContentType 'application/json'  -Headers $header
    $OrderStatus = $data1.Content | ConvertFrom-Json
    $pending_Orders = $OrderStatus.orderBook | where {$_.status -eq 6}
    if($pending_Orders)
    {
        $pending_Orders| %{
        $OrderID = $_.id

        $json = $host | select @{n='id';e={$OrderID}} | ConvertTo-Json
        $data1 = Invoke-WebRequest -Method Delete -Uri 'https://api.fyers.in/api/v1/orders' -ContentType 'application/json' -Body $json -Headers $header
        $OrderStatus = $data1.Content | ConvertFrom-Json
        $OrderStatus.message
        }
    }
}
Cancel-AllOpenOrdes($token)