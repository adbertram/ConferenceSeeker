$startdate = $webResponse.ParsedHtml.getElementsByclassName('address-details')[2].textcontent.replace(' - ','_October ').split('_').foreach([datetime])[0]
$enddate = $webResponse.ParsedHtml.getElementsByclassName('address-details')[2].textcontent.replace(' - ','_October ').split('_').foreach([datetime])[1]

@{
	'Start' = [datetime]$startDate
	'End' = [datetime]$endDate
} 