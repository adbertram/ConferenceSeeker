$startdate = $webResponse.ParsedHtml.getElementsByclassName('address-details')[0].textcontent.split('-').trim().foreach([DateTime])[0]
$enddate = $webResponse.ParsedHtml.getElementsByclassName('address-details')[0].textcontent.split('-').trim().foreach([DateTime])[1]

@{
	'Start' = [datetime]$startDate
	'End' = [datetime]$endDate
} 