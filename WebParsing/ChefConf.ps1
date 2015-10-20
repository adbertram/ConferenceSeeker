param (
	[Parameter(Mandatory)]
	[ValidateNotNullOrEmpty()]
	[Microsoft.PowerShell.Commands.HtmlWebResponseObject]$WebResponse
)

[int]$year = $webResponse.ParsedHtml.body.getElementsByClassName('chefconf-title')[0].innerText.split(' ')[1]
$roughdates = $webResponse.ParsedHtml.body.getElementsByClassName('date')[0].innerText.Split('|')[1].Trim()
$dates = [regex]::Match($roughdates, '(^\w+) (\d+)-(\d+)').Groups.Value
$month = $dates[1]
@{
	'Start' = [datetime]"$month $($dates[2]) $year"
	'End' = [datetime]"$month $($dates[3]) $year"
} 