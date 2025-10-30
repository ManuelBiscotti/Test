# Perform comprehensive Windows cleanup
function Invoke-WinCleanup {
	# Define all cleanup options
	$options = @(
	    'Active Setup Temp Folders'
	    'Thumbnail Cache'
	    'Delivery Optimization Files'
	    'D3D Shader Cache'
	    'Downloaded Program Files'
	    'Internet Cache Files'
	    'Setup Log Files'
	    'Temporary Files'
	    'Windows Error Reporting Files'
	    'Offline Pages Files'
	    'Recycle Bin'
	    'Temporary Setup Files'
	    'Update Cleanup'
	    'Upgrade Discarded Files'
	    'Windows Defender'
	    'Windows ESD installation files'
	    'Windows Reset Log Files'
	    'Windows Upgrade Log Files'
	    'Previous Installations'
	    'Old ChkDsk Files'
	    'Feedback Hub Archive log files'
	    'Diagnostic Data Viewer database files'
	    'Device Driver Packages'
	)
	
	# Display disk space before cleaning
	$driveletter = $env:SystemDrive -replace ':', ''
	$drive = Get-PSDrive $driveletter
	$usedInGB = [math]::Round($drive.Used / 1GB, 4)
	Write-Host 'BEFORE CLEANING' -ForegroundColor Red
	Write-Host "Used space on $($drive.Name):\ $usedInGB GB" -ForegroundColor Red
	
	# Perform all cleanup operations automatically
	Write-Host 'Clearing Event Viewer Logs...'
	wevtutil el | Foreach-Object { wevtutil cl "$_" >$null 2>&1 } 
	
	Write-Host 'Clearing Windows Log Files...'
	# Clear Distributed Transaction Coordinator logs
	Remove-Item -Path $env:SystemRoot\DtcInstall.log -Force
	# Clear Optional Component Manager and COM+ components logs
	Remove-Item -Path $env:SystemRoot\comsetup.log -Force
	# Clear Pending File Rename Operations logs
	Remove-Item -Path $env:SystemRoot\PFRO.log -Force
	# Clear Windows Deployment Upgrade Process Logs
	Remove-Item -Path $env:SystemRoot\setupact.log -Force
	Remove-Item -Path $env:SystemRoot\setuperr.log -Force
	# Clear Windows Setup Logs
	Remove-Item -Path $env:SystemRoot\setupapi.log -Force
	Remove-Item -Path $env:SystemRoot\Panther\* -Force -Recurse
	Remove-Item -Path $env:SystemRoot\inf\setupapi.app.log -Force
	Remove-Item -Path $env:SystemRoot\inf\setupapi.dev.log -Force
	Remove-Item -Path $env:SystemRoot\inf\setupapi.offline.log -Force 
	# Clear Windows System Assessment Tool logs
	Remove-Item -Path $env:SystemRoot\Performance\WinSAT\winsat.log -Force
	# Clear Password change events
	Remove-Item -Path $env:SystemRoot\debug\PASSWD.LOG -Force
	# Clear DISM (Deployment Image Servicing and Management) Logs
	Remove-Item -Path $env:SystemRoot\Logs\CBS\CBS.log -Force 
	Remove-Item -Path $env:SystemRoot\Logs\DISM\DISM.log -Force  
	# Clear Server-initiated Healing Events Logs
	Remove-Item -Path "$env:SystemRoot\Logs\SIH\*" -Force 
	# Common Language Runtime Logs
	Remove-Item -Path "$env:LocalAppData\Microsoft\CLR_v4.0\UsageTraces\*" -Force 
	Remove-Item -Path "$env:LocalAppData\Microsoft\CLR_v4.0_32\UsageTraces\*" -Force 
	# Network Setup Service Events Logs
	Remove-Item -Path "$env:SystemRoot\Logs\NetSetup\*" -Force 
	# Disk Cleanup tool (Cleanmgr.exe) Logs
	Remove-Item -Path "$env:SystemRoot\System32\LogFiles\setupcln\*" -Force 
	# Clear Windows update and SFC scan logs
	Remove-Item -Path $env:SystemRoot\Temp\CBS\* -Force 
	# Clear Windows Update Medic Service logs
	takeown /f $env:SystemRoot\Logs\waasmedic /r *>$null
	icacls $env:SystemRoot\Logs\waasmedic /grant administrators:F /t *>$null
	Remove-Item -Path $env:SystemRoot\Logs\waasmedic -Recurse
	# Clear Cryptographic Services Traces
	Remove-Item -Path $env:SystemRoot\System32\catroot2\dberr.txt -Force
	Remove-Item -Path $env:SystemRoot\System32\catroot2.log -Force
	Remove-Item -Path $env:SystemRoot\System32\catroot2.jrs -Force
	Remove-Item -Path $env:SystemRoot\System32\catroot2.edb -Force
	Remove-Item -Path $env:SystemRoot\System32\catroot2.chk -Force
	# Windows Update Logs
	Remove-Item -Path "$env:SystemRoot\Traces\WindowsUpdate\*" -Force 
	# Miscellaneous folder cleanup
	'C:\XboxGames',
	'C:\.GamingRoot', 
	'C:\inetpub',
	'C:\PerfLogs',
	'C:\Program Files\Microsoft Update Health Tools',
	'C:\ProgramData\Microsoft OneDrive' | ForEach-Object {
    	Remove-Item $_ -Force -Recurse
	}
 
	Write-Host 'Clearing TEMP Files...'
	# Cleanup temp files
	$temp1 = 'C:\Windows\Temp'
	$temp2 = $env:TEMP
	$tempFiles = (Get-ChildItem -Path $temp1 , $temp2 -Recurse -Force).FullName
	foreach ($file in $tempFiles) {
	    Remove-Item -Path $file -Recurse -Force
	}
	
	Write-Host 'Running Disk Cleanup...'
	# Set all cleanup options in registry
	$key = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches'
	foreach ($item in $options) {
	    reg.exe add "$key\$item" /v StateFlags0069 /t REG_DWORD /d 00000002 /f >$null 2>&1
	}
	# Run Disk Cleanup
	Start-Process cleanmgr.exe -ArgumentList '/sagerun:69 /autoclean' -Wait
	# Start-Process cleanmgr.exe -ArgumentList '/d C: /VERYLOWDISK'
 	# while(-not (Get-Process cleanmgr)){sleep 1}; do{$p=Get-Process|? MainWindowTitle -eq 'Disk Space Notification'} until($p);$p|%{ $_.CloseMainWindow()
  	# if(-not $_.HasExited){ $_.Kill() } } *>$null
	# Start-Process powershell -ArgumentList '-NoProfile -Command "Dism.exe /Online /Cleanup-Image /StartComponentCleanup /ResetBase"' -Wait

	# Display disk space after cleaning
	$drive = Get-PSDrive $driveletter
	$usedInGB = [math]::Round($drive.Used / 1GB, 4)
	Write-Host 'AFTER CLEANING' -ForegroundColor Green
	Write-Host "Used space on $($drive.Name):\ $usedInGB GB" -ForegroundColor Green

	Write-Host "Cleanup completed successfully!" -ForegroundColor Green				
}
