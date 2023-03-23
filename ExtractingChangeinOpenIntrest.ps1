        Import-Module selenium
        
        $opt  = New-Object OpenQA.Selenium.Chrome.ChromeOptions
        $opt.addArguments("disable-infobars");
        $opt.addArguments("--start-maximized");
        $opt.addArguments("--disable-extensions");
        #$opt.addArguments("headless");
        
        $driver = New-Object OpenQA.Selenium.Chrome.ChromeDriver($opt)
        ($driver.Navigate().GoToURL('https://www.nseindia.com/api/option-chain-indices?symbol=BANKNIFTY'))
        $totalData = ($driver.FindElementByXPath('/html/body/pre')).Text  | ConvertFrom-Json
        $driver.Quit()

function get-OpenIntrest($dataBank)
{
        #$dataBank = Invoke-RestMethod -Uri "https://www.nseindia.com/api/option-chain-indices?symbol=BANKNIFTY" -Method Get
        $bankNiftyCurrentValue = [math]::Round($dataBank.records.underlyingValue)
        for ($i=$bankNiftyCurrentValue; $i -lt ($bankNiftyCurrentValue + 200); $i++)
        {

        $remider = $i % 100
            if($remider -eq 0)
            {
                $currentStrikePrice = $i
                break
            }
    
        }
        $StartRange = $currentStrikePrice - 1000
        $EndRange = $currentStrikePrice + 1000

        $totalOICE = 0
        $totalOIPE = 0

        for($j=$StartRange;$j -le $EndRange;$j =$j+100)
        {

            [int]$OI = ($dataBank.records.data.ce | where {$_.expirydate -like "*23-Mar-2023*"} | where {$_.strikeprice -eq $j}).changeinOpenInterest
            [int]$totalOICE = [int]$OI + [int]$totalOICE


            [int]$OI = ($dataBank.records.data.pe | where {$_.expirydate -like "*23-Mar-2023*"} | where {$_.strikeprice -eq $j}).changeinOpenInterest
            [int]$totalOIPE = [int]$OI + [int]$totalOIPE

        }
        return @($totalOICE,$totalOIPE)
}
get-OpenIntrest $totalData


Remove-Variable -Name totalOICE,totalOIPE,i,j,StartRange,EndRange -ErrorAction:SilentlyContinue