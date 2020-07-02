if (!$env:GITHUB_TOKEN) {
    throw "Environment variable for GITHUB_TOKEN not found"
}

Get-Module -ListAvailable

# Setup PowerShellForGitHub with GITHUB_TOKEN
$secureString = $env:GITHUB_TOKEN | ConvertTo-SecureString -AsPlainText -Force
$cred = [System.Management.Automation.PSCredential]::new("username is ignored", $secureString)
Set-GitHubAuthentication -Credential $cred
$secureString = $null # clear this out now that it's no longer needed
$cred = $null # clear this out now that it's no longer needed

Get-GitHubEmoji
