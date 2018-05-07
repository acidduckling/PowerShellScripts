. ".\Github\Github-Shared.ps1"

function Set-GithubToken {
    param(
        # The username to be added to the settings file
        [Parameter(Mandatory = $true)]
        [string]
        $Username,
        # The token used to access the account
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [securestring]
        $Token
    )

    $settings = getSettings

    # Write-Host ($settings.username)
    # $settings | Get-Member

    $settings.username = $Username
    $settings.token = $Token | ConvertFrom-SecureString
    
    return saveSettings -settings $settings
    
}