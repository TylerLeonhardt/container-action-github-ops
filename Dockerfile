FROM mcr.microsoft.com/powershell:lts-alpine-3.10
SHELL ["pwsh", "-Command"]

RUN Install-Module PowerShellForGitHub -Force -Scope AllUsers

RUN if (!$env:GITHUB_TOKEN) { throw "Environment variable for GITHUB_TOKEN not found" } \
    # Setup PowerShellForGitHub with GITHUB_TOKEN
    $secureString = $env:GITHUB_TOKEN | ConvertTo-SecureString -AsPlainText -Force \
    $cred = [System.Management.Automation.PSCredential]::new("username is ignored", $secureString) \
    Set-GitHubAuthentication -Credential $cred

COPY LICENSE README.md /

COPY entrypoint.ps1 /entrypoint.ps1

ENTRYPOINT ["pwsh", "-Command", "/entrypoint.ps1"]
