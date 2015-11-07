$Dates = Select-String -InputObject $WebResponse.Content -Pattern '(\d?\d\.\d?\d\.\d{4})' -AllMatches | % { $_.Matches.value }
$culture = New-Object system.globalization.cultureinfo 'en-gb'

@{
	'Start' = [datetime]::Parse($Dates[0],$culture)
	'End' = [datetime]::Parse($Dates[1],$culture)
}