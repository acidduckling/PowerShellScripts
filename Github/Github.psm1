. ".\Github\New-GithubRepo.ps1"
. ".\Github\Remove-GithubRepo.ps1"
. ".\Github\Get-GithubRepos.ps1"
. ".\Github\Set-GithubToken.ps1"

export-modulemember -Function 'New-GithubRepo'
export-modulemember -Function 'Remove-GithubRepo'
export-modulemember -Function 'Get-GithubRepos'
export-modulemember -Function 'Set-GithubToken'