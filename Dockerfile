FROM mcr.microsoft.com/powershell:lts-alpine-3.10

CMD [ "pwsh" ]

RUN Install-Module PowerShellForGitHub -Force

COPY LICENSE README.md /

COPY entrypoint.ps1 /entrypoint.ps1

ENTRYPOINT ["pwsh", "-Command", "/entrypoint.ps1"]
