param (
	[Parameter(Mandatory)]
	[ValidateNotNullOrEmpty()]
	[Microsoft.PowerShell.Commands.HtmlWebResponseObject]$WebResponse
)

$roughdates = $WebResponse.ParsedHtml.getElementsByTagName('strong')[0].InnerText
$dates = [regex]::Match($roughdates, '(^\w+) (\d+)-(\d+) ').Groups.Value
$month = $dates[1]
@{
	'Start' = [datetime]"$month $($dates[2])"
	'End' = [datetime]"$month $($dates[3])"
} 