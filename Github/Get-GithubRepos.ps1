. ".\Github\Github-Shared.ps1"
function Get-GithubRepos {

    $creds = getCredentialsFromSettings

    $response = makeGetRequest -url "https://api.github.com/users/$($creds.Username)/repos"

    return ($response.Content | ConvertFrom-Json) | Select-Object -Property name, clone_url, private
}