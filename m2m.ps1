
$token = 'gAAAAABg9Rhu5F6_7-F3_52DEXa3WUtOvM1Qn9YDx2SPX9LGXfxpJxd2f7kSyH_JD3GIF4-T8r3Z84YCkMM_lDn3IRfiWjEO_6JIP_mCUBL2uWX4Hfxq3OQ='
function Get-M2M($token)
{
$data = Invoke-WebRequest -Method Get -Uri 'https://api.fyers.in/api/v1/positions' -Headers @{"Authorization"=$token}
$positions = $data.Content | ConvertFrom-Json
$positions.netPositions | where {$_.netQty -eq 0} | Out-Null
$m2m = 0
$positions.netPositions | %{$m2m = $_.pl + $m2m}
return $m2m
}
Get-M2M $token