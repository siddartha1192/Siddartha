$token= 'qvGkT4N5aIPsYjVEAn51uTYszZCd9UfC'
function get-banknifty($token)
{
$API_KEY = '13dhqhsib4gkznfw'
$Stock = 'NSE:NIFTY BANK'

$link = "token " + $API_KEY + ':' + $token
$Stock_currentValue = Invoke-WebRequest -Method Get -Uri "https://api.kite.trade/quote?i=$Stock" -Headers @{"X-Kite-Version"='3';"Authorization"=$link}
$PS_Data = ($Stock_currentValue.Content | ConvertFrom-Json)
$last_price = $PS_Data.data.$Stock.last_price
Write "Current $Stock price :  $last_price"
}

get-banknifty $token