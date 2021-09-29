$token = 'gAAAAABg9Rhu5F6_7-F3_52DEXa3WUtOvM1Qn9YDx2SPX9LGXfxpJxd2f7kSyH_JD3GIF4-T8r3Z84YCkMM_lDn3IRfiWjEO_6JIP_mCUBL2uWX4Hfxq3OQ='
$stoploss_price = 418
$symbol = 'NSE:SBIN-EQ'
$buy_sell = 1

function Put-SLOrder($token,$stoploss_price,$symbol,$buy_sell)
{
$json = $host | select @{n='symbol';e={$symbol}},@{n='qty';e={25}},@{n='type';e={3}},@{n='side';e={$buy_sell}},@{n='productType';e={'INTRADAY'}},@{n='limitPrice';e={$stoploss_price}},@{n='stopPrice';e={$stoploss_price}},@{n='disclosedQty';e={0}},@{n='validity';e={'DAY'}},@{n='offlineOrder';e={'False'}},@{n='stopLoss';e={$stoploss_price}},@{n='takeProfit';e={0}} | ConvertTo-Json
$data1 = Invoke-WebRequest -Method Post -Uri 'https://api.fyers.in/api/v1/orders' -ContentType 'application/json' -Body $json -Headers @{"Authorization"=$token}
$OrderStatus = $data1.Content | ConvertFrom-Json
$OrderStatus.message
return $OrderStatus
}

$oder_Details = Put-SLOrder $token $stoploss_price $symbol $buy_sell