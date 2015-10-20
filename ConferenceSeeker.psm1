$webParsingFolderPath = "$PSScriptRoot\WebParsing"
$confConfig = "$PSScriptRoot\conferences.json"

Set-StrictMode -Version Latest

## To hide Invoke-WebRequest's progress bar
$ProgressPreference = 'SilentlyContinue'

function Get-ConferenceConfiguration
{
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string]$Name
	)
	begin {
		$ErrorActionPreference = 'Stop'
	}
	process {
		try
		{
			$json = Get-Content -Path $confConfig -Raw | ConvertFrom-Json
			$json.conferences.Where({ $_.Name -eq $Name })
		}
		catch
		{
			Write-Error $_.Exception.Message
		}
	}
}

function Add-ConferenceConfiguration
{
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[pscustomobject]$InputObject
			
	)
	begin {
		$ErrorActionPreference = 'Stop'
	}
	process {
		try
		{
			$jsonKeyValues = @()
			$InputObject.PSObject.Properties | foreach {
				$jsonKeyValues += '"{0}":"{1}"' -f $_.Name,$_.Value
			}
			
			$jsonBlock = "{$($jsonKeyValues -join ',')}"
				
		}
		catch
		{
			Write-Error $_.Exception.Message
		}
	}
}

function Get-Conference
{
	[CmdletBinding()]
	param
	(
		[Parameter()]
		[ValidateNotNullOrEmpty()]
		[ValidateScript({
			if (-not (Test-Path -Path "$webParsingFolderPath\$($_).ps1" -PathType Leaf))
			{
				throw "The web parsing code could not be found for the conference [$($Name)]"
			}
			else
			{
				$true	
			}
		})]
		[string]$Name
	)
	begin {
		$ErrorActionPreference = 'Stop'
	}
	process {
		try
		{
			if ($PSBoundParameters.ContainsKey('Name'))
			{
				$confInfo = Get-ConferenceConfiguration -Name $Name
				$webResponse = Invoke-WebRequest -Uri $confInfo.Url
				$confScript = "$webParsingFolderPath\$Name.ps1"
				$conf = [ordered]@{ 'Conference' = $Name }
				Write-Verbose -Message "Getting conference information for conference [$($Name)] using URL [$($confInfo.Url)]"
				$conf += & $confScript
				[pscustomobject]$conf
			}
			else
			{
				Get-ChildItem -Path $webParsingFolderPath -Filter '*.ps1' | foreach {
					Get-Conference -Name $_.BaseName	
				}
			}	
		}
		catch
		{
			Write-Error $_.Exception.Message
		}
	}
}

function New-Conference
{
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string]$Name
	)
	begin {
		$ErrorActionPreference = 'Stop'
	}
	process {
		try
		{
			## Create the template script
			$templateScript = "param (
				[Parameter(Mandatory)]
				[ValidateNotNullOrEmpty()]
				[Microsoft.PowerShell.Commands.HtmlWebResponseObject]`$WebResponse
			)
			
			## Parsing code here

			@{
				'Start' = [datetime]##date1)`"
				'End' = [datetime]##date2)`"
			}"
			Add-Content -Path "$PSScriptRoot\$Name.ps1" -Value $templateScript
			
			## Add to the JSON file
			
			
		}
		catch
		{
			Write-Error $_.Exception.Message
		}
	}
}

Export-ModuleMember -Function Get-Conference,New-Conference