


$symbol = 'NSE:ioc-EQ'
$buy_sell = 1
[string]$token = 'gAAAAABg9Rhu5F6_7-F3_52DEXa3WUtOvM1Qn9YDx2SPX9LGXfxpJxd2f7kSyH_JD3GIF4-T8r3Z84YCkMM_lDn3IRfiWjEO_6JIP_mCUBL2uWX4Hfxq3OQ='
function Put-MarketOrder($token,$symbol,$buy_sell)
{

$json = $host | select @{n='symbol';e={$symbol}},@{n='qty';e={25}},@{n='type';e={3}},@{n='side';e={$buy_sell}},@{n='productType';e={'INTRADAY'}},@{n='limitPrice';e={0}},@{n='stopPrice';e={0}},@{n='disclosedQty';e={0}},@{n='validity';e={'DAY'}},@{n='offlineOrder';e={'False'}},@{n='stopLoss';e={0}},@{n='takeProfit';e={0}} | ConvertTo-Json
$data1 = Invoke-WebRequest -Method Post -Uri 'https://api.fyers.in/api/v1/orders' -ContentType 'application/json' -Body $json -Headers @{"Authorization"=$token}
$OrderStatus = $data1.Content | ConvertFrom-Json
write-host "$OrderStatus.message"
}

Put-MarketOrder -token $token -symbol $symbol -buy_sell $buy_sell