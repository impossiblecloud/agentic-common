# contribute.ps1 — commit and push changes in any git repo
# Usage: contribute.ps1 -Repo "<repo-path>" -Message "<commit message>"

param(
    [Parameter(Mandatory)][string]$Repo,
    [Parameter(Mandatory)][string]$Message
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path "$Repo\.git")) {
    Write-Host "ERROR: No git repo found at $Repo"
    exit 1
}

Set-Location $Repo

Write-Host "Pulling latest changes..."
git pull --rebase

Write-Host "Staging changes..."
git add .

$staged = git diff --staged --name-only
if (-not $staged) {
    Write-Host "No changes to share. Everything already up to date."
    exit 0
}

git commit -m $Message
git push

Write-Host ""
Write-Host "Done! Your changes are now shared."
