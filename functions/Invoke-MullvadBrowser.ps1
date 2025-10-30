function Invoke-MullvadBrowser {
    Write-Output "Installing: Mullvad Browser..."

    # Get latest Mullvad Browser release URL
    $url = (Invoke-RestMethod "https://api.github.com/repos/mullvad/mullvad-browser/releases/latest" -Headers @{ 'User-Agent' = 'PowerShell' }).assets |
        Where-Object { $_.name -match 'windows.*x86_64.*\.exe$' } |
        Select-Object -First 1 -ExpandProperty browser_download_url

    if (-not $url) { Write-Host "Download URL not found." -ForegroundColor Red; return }

    # Download installer
    $exe = Join-Path $env:TEMP 'mullvad-browser-windows-x86_64.exe'
    Get-FileFromWeb -URL $url -File $exe

    # Silent install
    Start-Process -FilePath $exe -ArgumentList '/S' -Wait -NoNewWindow
}
