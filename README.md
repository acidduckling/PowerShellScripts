# Powershell Snippets and Modules
This repository just contains some really basic PowerShell Modules that I have written. Nothing fancy (I am definitely not a PowerShell expert!)

## Github Module
This contains a couple of functions for adding and deleting Github repositories from the command line.
First use **Set-GithubToken** to save the credentials for your github repo access.

Note: Auth uses basic token authentication, so you will need to configure an auth token first in GitHub

### Importing the Gitbub Module
Copy the 

### Set-GithubToken
This will save your settings to a githubsettings.json file, with the token stored as a secure string. ALl the other functions will utilise the stored credentials

```PowerShell
Set-GithubToken -Username [YOUR_USERNAME] -Token [YOUR_TOKEN]
```

### New-GithubRepo
Will create a new public Github repository for the account defined in [githubsettings.json](Github/githubsettings.json)

```powershell
New-GithubRepo -Repo [NEW_REPOSITORY_NAME]
```

### Remove-GithubRepo
Will delete the specified repository from the Github account specified in the [githubsettings.json](Github/githubsettings.json) file

```powershell
Remove-GithubRepo -Repo [REPOSITORY_NAME]
```

### Get-GithubRepos
Will list all the repos in the Github account defined in [githubsettings.json](Github/githubsettings.json)

```powershell
Get-GithubRepos
```