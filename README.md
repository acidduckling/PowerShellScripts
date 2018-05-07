# Powershell Snippets and Modules
This repository just contains some really basic PowerShell Modules that I have written. Nothing fancy (I am definitely not a PowerShell expert!)

## Github Module
This contains a couple of functions for adding and deleting Github repositories from the command line.
First use **Set-GithubToken** to save the credentials for your github repo access.
Note: Auth uses basic token authentication, so you will need to configure an auth token first in GitHub

### Set-GithubToken
**Usage:** 
```PowerShell
Set-GithubToken -Username [YOUR_USERNAME] -token [YOUR_TOKEN]
```
This will save your settings to a githubsettings.json file, with the token stored as a secure string