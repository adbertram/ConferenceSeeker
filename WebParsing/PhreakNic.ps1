param (
	[Parameter(Mandatory)]
	[ValidateNotNullOrEmpty()]
	[Microsoft.PowerShell.Commands.HtmlWebResponseObject]$WebResponse
)

$daterange = $WebResponse.AllElements.Where({ $_.Tagname -eq 'span' }).outerText.Split('-').Trim()
$month = [regex]::Match($daterange[0], '(^\w+) ')[0].Value
$days = $daterange | % { [regex]::Match($_, '(\d+)')[0].Value }
@{
	'Start' = [datetime]"$month $($days[0])"
	'End' = [datetime]"$month $($days[1])"
} 