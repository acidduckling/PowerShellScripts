. ".\Github\Github-Shared.ps1"
function New-GithubRepo {
    param(
        # The name of the repo
        [Parameter(Mandatory=$true)]
        [string]
        $Repo
    )

    $body = New-Object -TypeName psobject -Property @{
        name = $repo
    }

    $encoded = getEncodedCreds

    $response = makePostRequest -url 'https://api.github.com/user/repos' -encodedCreds $encoded -body $body
}