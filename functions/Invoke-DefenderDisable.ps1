function Invoke-DefenderDisable {

    if (Test-Path "C:\Windows\AtlasModules") {
        Start-Process -FilePath 'C:\Windows\AtlasModules\DisableDefender.cmd' -NoNewWindow -Wait
    }else {
 	    Invoke-WebRequest -Uri "https://github.com/ManuelBiscotti/test/raw/refs/heads/main/tools/AtlasModules.zip" -OutFile "$env:TEMP\AtlasModules.zip"
	    Expand-Archive -Path "$env:TEMP\AtlasModules.zip" -DestinationPath "$env:TEMP" -Force -ErrorAction SilentlyContinue
	    Move-Item -Path (Join-Path $env:TEMP 'AtlasModules') -Destination 'C:\Windows' -Force -ErrorAction SilentlyContinue
        Start-Process -FilePath 'C:\Windows\AtlasModules\DisableDefender.cmd' -NoNewWindow -Wait       
    }
    
}