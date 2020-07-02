if (!$env:GITHUB_TOKEN) {
    throw "Environment variable for GITHUB_TOKEN not found"
}

# Setup PowerShellForGitHub with GITHUB_TOKEN
$secureString = $env:GITHUB_TOKEN | ConvertTo-SecureString -AsPlainText -Force
$cred = [System.Management.Automation.PSCredential]::new("username is ignored", $secureString)
Set-GitHubAuthentication -Credential $cred

$env:GITHUB_REPOSITORY
$repoArgs = $env:GITHUB_REPOSITORY -split '/'
Set-GitHubConfiguration -DefaultOwnerName $repoArgs[0] -DefaultRepositoryName $repoArgs[1]

Get-GitHubPullRequest
