#ConferenceSeeker

ConferenceSeeker is a project written in PowerShell that helps you keep up with the seemingly ever-increasing number of conferences and meetups across the world. ConferenceSeeker sets out to give you a single place to go to find all of the interesting technology conferences you might like to go to.

ConferenceSeeker does this by scraping the conference websites to gather this information.

#Help Make ConferenceSeeker Better!

If you know PowerShell, are a whiz with Invoke-WebRequest and can navigate the DOM with the best of them, I need your help!  Each conference requires a unique approach due to the difference in each conference's webpage. I need help writing scripts that can parse each conference webpage to output a common type.

Here's how you can contribute to help make this the one-stop shop for up-to-date conference information:

## The Most Helpful Way
1. Pick a conference script that's needed in the [Issues](https://github.com/adbertram/ConferenceSeeker/issues) with a tag of `help wanted` or create an issue yourself and build the script.
2. Check out the [_ConferenceTemplate.ps1 script](https://github.com/adbertram/ConferenceSeeker/blob/master/WebParsing/_ConferenceTemplate.ps1) script in the WebParsing folder.
3. Do whatever you have to to pull out the conference's start and end dates.
4. Output the start and end dates in a hashtable with key names of `Start` and `End` and `[datetime]` objects as the dates into the ConferenceTemplate script.
5. Updated the README to add the supported conference and update the "as of date".
5. Submit a pull request with your new conference script.
6. Get your pull request accepted.
5. Feel good about yourself for helping the technology community.

## Another Way to Help

If you see a conference not supported or without an Issue, add it to the [ConferenceSeeker Wiki](https://github.com/adbertram/ConferenceSeeker/wiki/Conference-Scripts-You-Haven%27t-Got-an-Issue-for-Yet/_edit) and let us know!

#Supported Conferences (as of 10/20/15)

1. [PhreakNic](http://phreaknic.info)
2. [IT Computing Cloud Conference](http://icee3.com)
3. [DockerConUS](https://blog.docker.com/2015/10/dockercon-us-2016/)
4. [ChefConf](https://www.chef.io/chefconf)