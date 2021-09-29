$token = 'gAAAAABg8QqtceXiQV4BG_-DNnUPvPyG_uQw3zG3Srj8G_hlF6GC7XXCDM1JlJjk7wVE2PeRFKTSNfEphzZvKtZP3vLoaXDRv9iAnAkMEgP7QDXLiSzw1lg='
$symbol = 'NSE:IOC-EQ'
function Cancel-SeletedStock($token,$symbol)
{
    $header = @{"Authorization"=$token}
    $data1 = Invoke-WebRequest -Method Get -Uri 'https://api.fyers.in/api/v1/orders' -ContentType 'application/json'  -Headers $header
    $OrderStatus = $data1.Content | ConvertFrom-Json
    $pending_Orders = $OrderStatus.orderBook | where {$_.status -eq 6} | where {$_.symbol -like $symbol}
    if($pending_Orders)
    {
        $pending_Orders| %{
        $OrderID = $_.id

        $json = $host | select @{n='id';e={$OrderID}} | ConvertTo-Json
        $data1 = Invoke-WebRequest -Method Delete -Uri 'https://api.fyers.in/api/v1/orders' -ContentType 'application/json' -Body $json -Headers $header
        $OrderStatus = $data1.Content | ConvertFrom-Json
        write-host "$OrderStatus.message"
        }
    }
}
Cancel-SeletedStock  $token $symbol