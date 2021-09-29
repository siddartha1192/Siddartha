# Siddartha

Thanks everone who view my code. I worte this code to automate trade execution in fyers.

I believe it will help outside audiance. I use FYERS REST version 1  API  to execute the tasks in powershell.
I helps me i believe it will help others also.

Please reach me on vicidas2021@gmail.com/siddartha1192@gmail.com for more details.

Example for placing Limit order in Fyers:

#Quantity you can change in the json varibale where it mention (@{n='qty';e={25}}) otherwise you can crete your own varibale and pass it in the function attribute.
$limit_price = (236.55) 
$symbol = 'NSE:BANKNIFTY21JUL34600PE'
$buy_sell = -1
$token = 'gAAAAABhANRFLr_wFcCW7GRAa_Y7jana4W6tAfcvuELW0BjlJek88bj_WSrG2yD6p6f8AgWVTTcRPIg-UQ-UiNH5pOrKODXcywJZquHcW6hZH3yijRRNoO8='
function Put-LimitOrder([string]$token, [string]$symbol, [int]$limit_price, [int]$buy_sell)
{
$json = $host | select @{n='symbol';e={$symbol}},@{n='qty';e={25}},@{n='type';e={3}},@{n='side';e={$buy_sell}},@{n='productType';e={'INTRADAY'}},@{n='limitPrice';e={$limit_price}},@{n='stopPrice';e={0}},@{n='disclosedQty';e={0}},@{n='validity';e={'DAY'}},@{n='offlineOrder';e={'False'}},@{n='stopLoss';e={0}},@{n='takeProfit';e={0}} | ConvertTo-Json
$data1 = Invoke-WebRequest -Method Post -Uri 'https://api.fyers.in/api/v1/orders' -ContentType 'application/json' -Body $json -Headers @{"Authorization"=($token.split(' ')[0])}
$OrderStatus = $data1.Content | ConvertFrom-Json
$OrderStatus.message

}
Put-LimitOrder -token $token -symbol $symbol -limit_price $limit_price -buy_sell $buy_sell
