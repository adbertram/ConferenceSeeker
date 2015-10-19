param (
	[Parameter(Mandatory)]
	[ValidateNotNullOrEmpty()]
	[Microsoft.PowerShell.Commands.HtmlWebResponseObject]$WebResponse
)

#$tagContent = $WebResponse.ParsedHtml.getElementsByTagName('p')[3].innerText
#
#@{
#	'Start' = [datetime]"$month $($days[0])"
#	'End' = [datetime]"$month $($days[1])"
#} 