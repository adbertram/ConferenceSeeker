$e= $WebResponse.AllElements
$line=$e.where({$_.tagname -eq 'h1' -and $_.outerhtml -match 'class'}).innertext
$month,$days,$null = $line.split(':')[-1].trim().split(' ')
$startDay,$EndDay=$days.Split('-')
@{
    Start = [datetime]"$month $startDay"
    End = [datetime]"$month $EndDay"
}