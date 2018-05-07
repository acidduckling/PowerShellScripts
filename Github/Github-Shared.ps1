. ".\Github\GithubDefaults.ps1"

function getEncodedCreds {
    $credentials = getCredentialsFromSettings

    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    return [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($credentials.UserName):$($credentials.GetNetworkCredential().Password)"))
}

function makePostRequest {
    param([string] $encodedCreds, [string] $url, [psobject] $body)

    return makeRequest -authValue $encodedCreds -url $url -body $body -httpVerb Post
}

function makeDeleteRequest {
    param([string] $token, [string] $url)

    return makeRequest -authType token -authValue $token -url $url -httpVerb Delete
}

function makeGetRequest {
    param([string] $encodedCreds, [string] $url)

    return makeRequest -authValue $encodedCreds -url $url -httpVerb Get
}

function makeRequest {
    param([string] $authValue, 
        [string][ValidateSet('basic', 'token')] $authType='basic', 
        [string] $url, 
        [psobject] $body, 
        [string][ValidateSet('Post', 'Get', 'Delete', 'Put')] $httpVerb)

    if ($authValue -ne $null) {
        $Headers = @{
            Authorization = "$authType $authValue"
        }
    }

    return Invoke-WebRequest -Uri $url -Headers $Headers -Method $httpVerb -Body $($body | ConvertTo-Json)
}

function getSettings {
    # If the file exists, return its settings
    if (Test-Path $settingsPath) {
        return Get-Content $settingsPath | ConvertFrom-Json
    }
    # If the settings file does not exist, then we return a default settings object
    else {
        return @{
            username = "USERNAME"
            token = "TOKEN"
        }
    }
}

function getCredentialsFromSettings {
    $settings = getSettings
    $username = $settings.username
    $token = $settings.token | ConvertTo-SecureString
    return New-Object pscredential($username,$token)
}

function saveSettings {
    param([psobject] $settings)

    $settings | ConvertTo-Json | Set-Content -Path $settingsPath
}