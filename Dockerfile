FROM mcr.microsoft.com/powershell:lts-alpine-3.10

RUN pwsh -c Install-Module PowerShellForGitHub -Force -Scope AllUsers

COPY LICENSE README.md /

COPY entrypoint.ps1 /entrypoint.ps1

ENTRYPOINT ["pwsh", "-Command", "/entrypoint.ps1"]
