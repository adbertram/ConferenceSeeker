###############
## Insert code to create two datetime objects (Start and End) here
## Use $WebResponse as the output of Invoke-WebRequest -Uri <ConferenceURL>
###############

## Output a hashtable with a Start and an End key
@{
	'Start' = [datetime]$startDate
	'End' = [datetime]$endDate
} 