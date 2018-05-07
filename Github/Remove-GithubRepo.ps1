. ".\Github\Github-Shared.ps1"

function Remove-GithubRepo {
    param(
        [Parameter(Mandatory=$true)]
        [string] $Repo
    )

    $confirmation = Read-Host "Are you sure you want to delete the $Repo repository from GitHub?"
    if ($confirmation.ToLower() -eq 'y') {

        $creds = getCredentialsFromSettings
    
        $response = makeDeleteRequest -url "https://api.github.com/repos/$($creds.Username)/$Repo" -token $creds.GetNetworkCredential().Password

        if($response.StatusCode -eq 204) {
            Write-Output "Successfully deleted $Repo"
        } else {
            Write-Output "There was an error deleting $Repo"
        }
    }
}