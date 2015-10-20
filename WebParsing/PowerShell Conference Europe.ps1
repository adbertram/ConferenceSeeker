$DateString = (($WebResponse.Content -split '<p>When: <em>')[1] -split '</em>')[0]
$Year = [regex]::Match($DateString,'\d{4}')[0].value
$Month = ($DateString -split ' ')[0]
$Days = [regex]::Matches($DateString,' \d?\d[a-z]') | ForEach-Object { $_.Value -replace '[^\d]'}


@{
	'Start' = [datetime] "$Year-$Month-$($Days[0])"
	'End' = [datetime] "$Year-$Month-$($Days[1])"
}
