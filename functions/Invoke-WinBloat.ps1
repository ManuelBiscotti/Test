function Invoke-WinBloat {

	
	# REMOVE UWP APPS

    Write-Host "Removing Universal Windows Platform (UWP) Apps..." -ForegroundColor Green
	Get-AppxPackage -AllUsers |
	Where-Object {
	    $_.Name -notlike '*NVIDIA*' -and
	    $_.Name -notlike '*CBS*' -and
	    # $_.Name -notlike '*AppInstaller*' -and # Winget
	    $_.Name -notlike '*Gaming*' -and
	    $_.Name -notlike '*Xbox*' -and
		$_.Name -notlike '*Widgets*' -and
	    $_.Name -notlike '*Experience*'
	} |
	Remove-AppxPackage

	# Activate Windows Photo Viewer
	Write-Output "Activating Windows Photo Viewer..."
	'tif','tiff','bmp','dib','gif','jfif','jpe','jpeg','jpg','jxr','png','ico'|ForEach-Object{
 		reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".${_}" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f >$null 2>&1
 		reg.exe add "HKCU\SOFTWARE\Classes\.${_}" /ve /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f >$null 2>&1
  	}


	# REMOVE CAPABILITIES

	Write-Host "Removing Available Features on Demand (Capabilities)..." -ForegroundColor Green
	# Remove Steps Recorder
	Write-Output "Removing Steps Recorder..."
	Remove-WindowsCapability -Online -Name "App.StepsRecorder~~~~0.0.1.0" | Out-Null
	# Remove Quick Assist
	Write-Output "Removing Quick Assist..."
	Remove-WindowsCapability -Online -Name "App.Support.QuickAssist~~~~0.0.1.0" | Out-Null
	# Remove Internet Explorer
	Write-Output "Removing Internet Explorer..."
	Remove-WindowsCapability -Online -Name "Browser.InternetExplorer~~~~0.0.11.0" | Out-Null
	# Delete Internet Explorer shortcuts
    Remove-Item "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Accessories\Internet Explorer.lnk" -Force
    Remove-Item "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Internet Explorer.lnk" -Force
    Remove-Item "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\Internet Explorer.lnk" -Force
    Remove-Item "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Internet Explorer.lnk" -Force
	# Remove DirectX Configuration Database
	Write-Output "Removing DirectX Configuration Database..."
	Remove-WindowsCapability -Online -Name "DirectX.Configuration.Database~~~~0.0.1.0" | Out-Null
	# Remove Face Recognition
	Write-Output "Removing Face Recognition..."
	Remove-WindowsCapability -Online -Name "Hello.Face.18967~~~~0.0.1.0" | Out-Null
	Remove-WindowsCapability -Online -Name "Hello.Face.20134~~~~0.0.1.0" | Out-Null
	# Remove Math Recognizer
	Write-Output "Removing Math Recognizer..."
	Remove-WindowsCapability -Online -Name "MathRecognizer~~~~0.0.1.0" | Out-Null		
	# Remove Extended Theme Content
	Write-Output "Removing Extended Theme Content..."
	Remove-WindowsCapability -Online -Name "Microsoft.Wallpapers.Extended~~~~0.0.1.0" | Out-Null
	# Remove PowerShell ISE
	Write-Output "Removing PowerShell ISE..."
	Remove-WindowsCapability -Online -Name "Microsoft.Windows.PowerShell.ISE~~~~0.0.1.0" | Out-Null
	# Remove WordPad
	Write-Output "Removing WordPad..."
	Remove-WindowsCapability -Online -Name "Microsoft.Windows.WordPad~~~~0.0.1.0" | Out-Null
	# Remove OneSync
	Write-Output "Removing OneSync..."
	Remove-WindowsCapability -Online -Name "OneCoreUAP.OneSync~~~~0.0.1.0" | Out-Null
	# Remove OpenSSH Client
	Write-Output "Removing OpenSSH Client..."
	Remove-WindowsCapability -Online -Name "OpenSSH.Client~~~~0.0.1.0" | Out-Null
	# Remove Windows Fax and Scan
	Write-Output "Removing Fax and Scan..."
	Remove-WindowsCapability -Online -Name "Print.Fax.Scan~~~~0.0.1.0" | Out-Null
	# Remove Print Management Console
	Write-Output "Removing Print Management Console..."
	Remove-WindowsCapability -Online -Name "Print.Management.Console~~~~0.0.1.0" | Out-Null
	# Remove WMIC
	Write-Output "Removing WMIC..."
	Remove-WindowsCapability -Online -Name "WMIC~~~~" | Out-Null
	# Remove Character Map
	Write-Output "Removing Character Map..."
	Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\System Tools\Character Map.lnk" -Force | Out-Null
	# Remove Windows Media Player Legacy
	# Write-Output "Removing Windows Media Player Legacy..."
	# Remove-WindowsCapability -Online -Name "Media.WindowsMediaPlayer~~~~0.0.12.0" | Out-Null
	# Remove Notepad (system)
	# Write-Output "Removing Notepad (system)..."
	# Remove-WindowsCapability -Online -Name "Microsoft.Windows.Notepad.System~~~~0.0.1.0" | Out-Null
	# Remove-WindowsCapability -Online -Name "Microsoft.Windows.Notepad~~~~0.0.1.0" | Out-Null	
	# breaks installer & uninstaller programs
	# Remove-WindowsCapability -Online -Name "VBSCRIPT~~~~" | Out-Null
	# Remove Windows Feature Experience Pack ( breaks snippingtool w10 )
	# Write-Output "Windows Feature Experience Pack..."
	# Remove-WindowsCapability -Online -Name "Windows.Client.ShellComponents~~~~0.0.1.0" | Out-Null
	# Remove Linear Address 57-bit
	# Write-Output "Removing Linear Address 57-bit..."
	# Remove-WindowsCapability -Online -Name "Windows.Kernel.LA57~~~~0.0.1.0" | Out-Null
	

    # DISABLE WINDOWS FEATURES

	Write-Host "Disabling Windows Features..." -ForegroundColor Green
	# Disable WCF Services
	Write-Output "Disabling WCF Services..."
	Dism /Online /NoRestart /Disable-Feature /FeatureName:WCF-Services45 | Out-Null
	# Disable TCP Port Sharing
	Dism /Online /NoRestart /Disable-Feature /FeatureName:WCF-TCP-PortSharing45 | Out-Null
	# Disable Microsoft Print to PDF
	Write-Output "Disabling Microsoft Print to PDF..."
	Dism /Online /NoRestart /Disable-Feature /FeatureName:Printing-PrintToPDFServices-Features | Out-Null
	# Disable Microsoft XPS Document Writer
	Write-Output "Disabling Microsoft XPS Document Writer..."
	Dism /Online /NoRestart /Disable-Feature /FeatureName:Printing-XPSServices-Features | Out-Null
	# Disable Print and Document Services
	Write-Output "Disabling Print and Document Services..."
	Dism /Online /NoRestart /Disable-Feature /FeatureName:Printing-Foundation-Features | Out-Null
	# Disable Internet Printing Client
	Dism /Online /NoRestart /Disable-Feature /FeatureName:Printing-Foundation-InternetPrinting-Client | Out-Null
	# Disable Remote Differential Compression API Support
	Write-Output "Disabling Remote Differential Compression API Support..."
	Dism /Online /NoRestart /Disable-Feature /FeatureName:MSRDC-Infrastructure | Out-Null
	# Disable SMB 1.0/CIFS File Sharing Support
	Write-Output "Disabling SMB 1.0..."
	Dism /Online /NoRestart /Disable-Feature /FeatureName:SMB1Protocol | Out-Null
	Dism /Online /NoRestart /Disable-Feature /FeatureName:SMB1Protocol-Client | Out-Null
	Dism /Online /NoRestart /Disable-Feature /FeatureName:SMB1Protocol-Deprecation | Out-Null
	# Disable SMB Direct
	Write-Output "Disabling SMB Direct..."
	Dism /Online /NoRestart /Disable-Feature /FeatureName:SmbDirect | Out-Null
	# Disable Windows Identity Foundation 3.5
	Write-Output "Disabling Windows Identity Foundation 3.5..."
	Dism /Online /NoRestart /Disable-Feature /FeatureName:Windows-Identity-Foundation | Out-Null
	# Disable Windows Powershell 2.0
	Write-Output "Disabling Windows Powershell 2.0..."
	Dism /Online /NoRestart /Disable-Feature /FeatureName:MicrosoftWindowsPowerShellV2Root | Out-Null
	Dism /Online /NoRestart /Disable-Feature /FeatureName:MicrosoftWindowsPowerShellV2 | Out-Null
	# Disable Work Folders Client
	Write-Output "Disabling Work Folders Client..."
	Dism /Online /NoRestart /Disable-Feature /FeatureName:WorkFolders-Client | Out-Null
	# Disable .NET Framework 4.8
	# Write-Output "Disabling .NET Framework 4.8..."
	# Dism /Online /NoRestart /Disable-Feature /FeatureName:NetFx4-AdvSrvs | Out-Null
	# Disable Media Features
	# Write-Output "Disabling Media Features..."
	# Dism /Online /NoRestart /Disable-Feature /FeatureName:MediaPlayback | Out-Null	
	# Disable Hyper-V
	# Write-Output "Disabling Hyper-V..."
	# Dism /Online /NoRestart /Disable-Feature /FeatureName:Microsoft-Hyper-V-All | Out-Null
	# Disable Recall
	# Write-Output "Disabling Recall..."
	# Dism /Online /NoRestart /Disable-Feature /FeatureName:Recall | Out-Null
	# Disable Windows Search Engine service (breaks Search)
	# Write-Output "Disabling Windows Search Engine service..."	
	# Dism /Online /NoRestart /Disable-Feature /FeatureName:SearchEngine-Client-Package | Out-Null


	# UNINSTALL MICROSOFT UPDATE HEALTH TOOLS

	Write-Host "Uninstalling Microsoft Update Health Tools..." -ForegroundColor Green
	Start-Process "msiexec.exe" -ArgumentList '/X{C6FD611E-7EFE-488C-A0E0-974C09EF6473}', '/qn' -Wait -WindowStyle Hidden
	Start-Process "msiexec.exe" -ArgumentList '/X{1FC1A6C2-576E-489A-9B4A-92D21F542136}', '/qn' -Wait -WindowStyle Hidden
	# Clean Microsoft Update Health Tools
    Remove-Item 'HKLM:\SYSTEM\ControlSet001\Services\uhssvc' -Recurse -Force | Out-Null -ErrorAction SilentlyContinue
	Unregister-ScheduledTask -TaskName 'PLUGScheduler' -Confirm:$false *> $null
	
	
	# UNINSTALL UPDATE FOR X64-BASED WINDOWS SYSTEMS

	Write-Host "Uninstalling Update for x64-based Windows Systems..." -ForegroundColor Green	
	Start-Process "msiexec.exe" -ArgumentList '/X{B9A7A138-BFD5-4C73-A269-F78CCA28150E}', '/qn' -Wait -WindowStyle Hidden
	Start-Process "msiexec.exe" -ArgumentList '/X{85C69797-7336-4E83-8D97-32A7C8465A3B}', '/qn' -Wait -WindowStyle Hidden
	# (KB5001716)
	Start-Process "msiexec.exe" -ArgumentList '/x {B8D93870-98D1-4980-AFCA-E26563CDFB79} /qn /norestart' -Wait -WindowStyle Hidden


	# UNINSTALL REMOTE DESKTOP CONNECTION

	Write-Host "Uninstalling Remote Desktop Connection..." -ForegroundColor Green
	if(Test-Path "$env:windir\System32\mstsc.exe"){
    	Start-Process "$env:windir\System32\mstsc.exe" "/uninstall" -WindowStyle Hidden
    	Start-Sleep 5
    	Get-Process mstsc | Stop-Process -Force
	}


	# REMOVE STARTUP APPS
	
	Write-Host "Removing Startup Apps..." -ForegroundColor Green
 	Remove-Item -Recurse -Force "$env:AppData\Microsoft\Windows\Start Menu\Programs\Startup" | Out-Null
	Remove-Item -Recurse -Force "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp" | Out-Null
	New-Item -Path "$env:AppData\Microsoft\Windows\Start Menu\Programs\Startup" -ItemType Directory | Out-Null
	New-Item -Path "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp" -ItemType Directory | Out-Null


	# DISABLE TASKS

	Write-Host "Disabling Tasks..." -ForegroundColor Green
	# Disables OneDrive and Edge scheduled tasks
	Write-Output "Disabling OneDrive and Edge scheduled tasks..."
	Get-ScheduledTask | Where-Object { $_.TaskName -like "*OneDrive*" -or $_.TaskName -like "*Edge*" } | ForEach-Object { Disable-ScheduledTask -TaskName $_.TaskName | Out-Null }
	# Disables automatic disk defragmentation
	Write-Output "Disabling automatic disk defragmentation..."
	schtasks /Change /DISABLE /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" | Out-Null	
	# Disables security scheduled tasks
	Write-Output "Disabling security scheduled tasks..."
	schtasks /Change /TN "Microsoft\Windows\ExploitGuard\ExploitGuard MDM policy Refresh" /Disable | Out-Null
	schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /Disable | Out-Null
	schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /Disable | Out-Null
	schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /Disable | Out-Null
	schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Verification" /Disable | Out-Null
  	# Schedules bloatware killer task
	Write-Output "Scheduling Bloatware Killer Task..."
	try {
		$dir="$env:ProgramData\Bloatware"
		New-Item $dir -ItemType Directory -Force  *> $null
		$script=@'
for ($i = 1; $i -le 3; $i++) {
    "gamingservices","AggregatorHost","MoUsoCoreWorker","UserOOBEBroker","WinStore.App","msedge","SearchApp","ConnectedUserExperiences","CrossDeviceResume","MicrosoftEdgeUpdate","msedgewebview2","ONENOTEM" | % { Get-Process $_ -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue }
    "MSDTC","VSS","uhssvc","Spooler","WSearch" | % { Stop-Service $_ -Force -ErrorAction SilentlyContinue }
    Start-Sleep -Seconds 1
}
'@
		$script | Set-Content "$dir\KillBloatware.ps1" -Encoding UTF8 -Force *> $null
		$trigger=New-ScheduledTaskTrigger -AtStartup
		$action=New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -File `"$dir\KillBloatware.ps1`""
		Register-ScheduledTask -TaskName "KillBloatwareAtStartup" -Action $action -Trigger $trigger -RunLevel Highest -User "SYSTEM" -Force *> $null
	} catch {
	}
	
	# Kill Microsoft Text Input Application
	Write-Output "Disabling Microsoft Text Input Application..."
	cmd /c "taskkill /F /IM TextInputHost.exe >nul 2>&1"; $d=Get-ChildItem "$env:SystemRoot\SystemApps" -Dir -Filter "MicrosoftWindows.Client.CBS_*"|Select-Object -First 1 -ExpandProperty FullName
	if($d){$x=Join-Path $d "TextInputHost.exe"
		if(Test-Path $x){cmd /c "takeown /f `"$x`" >nul 2>&1 & icacls `"$x`" /grant *S-1-3-4:F >nul 2>&1 & move /y `"$x`" `"$env:SystemRoot\TextInputHost.exe.bak`" >nul 2>&1"}
	}

	# Create System Properties Start menu shortcut
	Write-Output "Creating System Properties Start shortcut..."
	$t="$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\System Properties.lnk"
	$s=(New-Object -ComObject WScript.Shell).CreateShortcut($t)
	$s.TargetPath="$env:SystemRoot\System32\SystemPropertiesAdvanced.exe"
	$s.IconLocation="$env:SystemRoot\System32\SystemPropertiesAdvanced.exe"
	$s.Save() >$null 2>&1


	# WINDOWS 10 STUFF
 	if ((Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion').CurrentBuild -le 19045) {
		Write-Host "Windows 10 Stuff..." -ForegroundColor Green

		# Remove Microsoft Paint Legacy
		Write-Output "Uninstalling Paint Legacy..."
		Remove-WindowsCapability -Online -Name "Microsoft.Windows.MSPaint~~~~0.0.1.0" | Out-Null

		# Uninstall SnippingTool Legacy
		Write-Output "Uninstalling SnippingTool Legacy..."
		Start-Process "C:\Windows\System32\SnippingTool.exe" -ArgumentList "/Uninstall"
		# silent window for old snippingtool w10
		$processExists = Get-Process -Name SnippingTool -ErrorAction SilentlyContinue
		if ($processExists) {
			$running = $true
			do {
				$openWindows = Get-Process | Where-Object { $_.MainWindowTitle -ne '' } | Select-Object MainWindowTitle
				foreach ($window in $openWindows) {
					if ($window.MainWindowTitle -eq 'Snipping Tool') {
						Stop-Process -Force -Name SnippingTool -ErrorAction SilentlyContinue | Out-Null
						$running = $false
					}
				}
			} while ($running)
		} else {
		}

		# Set Desktop Wallpaper and Style
		Write-Output "Setting Desktop Wallpaper and Style..."
		Add-Type @"
using System.Runtime.InteropServices;
public class Wallpaper {
    public const int SPI_SETDESKWALLPAPER = 0x0014;
    public const int SPIF_UPDATEINIFILE = 0x01;
    public const int SPIF_SENDWININICHANGE = 0x02;
    [DllImport("user32.dll", CharSet=CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@
		$WallpaperPath = "C:\Windows\web\wallpaper\Windows\img0.jpg"
		Set-ItemProperty "HKCU:\Control Panel\Desktop" -Name "WallpaperStyle" -Value "10"
		Set-ItemProperty "HKCU:\Control Panel\Desktop" -Name "TileWallpaper" -Value "0"
		[Wallpaper]::SystemParametersInfo(0x0014, 0, $WallpaperPath, 3) | Out-Null

		# Disable AppX Deployment Service
		Write-Output "Disabling AppX Deployment Service..."
		Set-ItemProperty -Path "HKLM:\SYSTEM\ControlSet001\Services\AppXSvc" -Name "Start" -Value 4 -Type DWord | Out-Null
		
		# Disable TextInput Management Service	
		Write-Output "Disabling TextInput Management Service	..."
		Set-ItemProperty -Path "HKLM:\SYSTEM\ControlSet001\Services\TextInputManagementService" -Name "Start" -Value 4 -Type DWord | Out-Null
		
		# Show Copy as Path always in right-click menu          
		Write-Output "Enabling Show Copy as Path always in right-click menu ..."
		$regPath = "Registry::HKEY_CLASSES_ROOT\AllFilesystemObjects\shell\windows.copyaspath"
		New-Item -Path $regPath -Force | Out-Null; Set-ItemProperty -Path $regPath -Name "(default)" -Value "Copy &as path" | Out-Null
		Set-ItemProperty -Path $regPath -Name "InvokeCommandOnSelection" -Value 1 -Type DWord | Out-Null
		Set-ItemProperty -Path $regPath -Name "VerbHandler" -Value "{f3d06e7c-1e45-4a26-847e-f9fcdee59be0}" | Out-Null
		Set-ItemProperty -Path $regPath -Name "VerbName" -Value "copyaspath" | Out-Null   		
 				
		# CLEAN START MENU W10
		Write-Output "Cleaning Start..."		
		Remove-Item -Recurse -Force "$env:SystemDrive\Windows\StartMenuLayout.xml"
		$MultilineComment = @'
<LayoutModificationTemplate xmlns:defaultlayout="http://schemas.microsoft.com/Start/2014/FullDefaultLayout" xmlns:start="http://schemas.microsoft.com/Start/2014/StartLayout" Version="1" xmlns:taskbar="http://schemas.microsoft.com/Start/2014/TaskbarLayout" xmlns="http://schemas.microsoft.com/Start/2014/LayoutModification">
	<LayoutOptions StartTileGroupCellWidth="6" />
	<DefaultLayoutOverride>
		<StartLayoutCollection>
			<defaultlayout:StartLayout GroupCellWidth="6" />
		</StartLayoutCollection>
	</DefaultLayoutOverride>
</LayoutModificationTemplate>
'@
		Set-Content -Path "C:\Windows\StartMenuLayout.xml" -Value $MultilineComment -Force -Encoding ASCII
		$layoutFile="C:\Windows\StartMenuLayout.xml"
		$regAliases = @("HKLM", "HKCU")
		foreach ($regAlias in $regAliases){
		$basePath = $regAlias + ":\SOFTWARE\Policies\Microsoft\Windows"
		$keyPath = $basePath + "\Explorer"
		IF(!(Test-Path -Path $keyPath)) { New-Item -Path $basePath -Name "Explorer" | Out-Null }	
		Set-ItemProperty -Path $keyPath -Name "LockedStartLayout" -Value 1 | Out-Null
		Set-ItemProperty -Path $keyPath -Name "StartLayoutFile" -Value $layoutFile | Out-Null
		}	
		Stop-Process -Force -Name explorer
		Timeout /T 5 | Out-Null
		foreach ($regAlias in $regAliases){
		$basePath = $regAlias + ":\SOFTWARE\Policies\Microsoft\Windows"
		$keyPath = $basePath + "\Explorer"
		Set-ItemProperty -Path $keyPath -Name "LockedStartLayout" -Value 0 | Out-Null
		}
  	}

 	# Windows 11 Stuff
  	elseif ((Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion').CurrentBuild -ge 22000) {
		Write-Host "Windows 11 Stuff..." -ForegroundColor Green
		# Set Desktop Wallpaper and Style
		Write-Output "Setting Desktop Wallpaper and Style..."
Add-Type @"
using System.Runtime.InteropServices;
public class Wallpaper {
    public const int SPI_SETDESKWALLPAPER = 0x0014;
    public const int SPIF_UPDATEINIFILE = 0x01;
    public const int SPIF_SENDWININICHANGE = 0x02;
    [DllImport("user32.dll", CharSet=CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@
		$WallpaperPath = "C:\Windows\web\Wallpaper\Windows\img19.jpg"
		Set-ItemProperty "HKCU:\Control Panel\Desktop" -Name "WallpaperStyle" -Value "10"
		Set-ItemProperty "HKCU:\Control Panel\Desktop" -Name "TileWallpaper" -Value "0"
		[Wallpaper]::SystemParametersInfo(0x0014, 0, $WallpaperPath, 3) | Out-Null
	
		# Remove all pinned apps from Start
		Write-Output "Removing all pinned apps from Start..."		
		Get-Process StartMenuExperienceHost | Stop-Process -Force | Out-Null; Start-Sleep -Milliseconds 200
		$dst="$env:LOCALAPPDATA\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState\start2.bin"
  		if (!(Test-Path (Split-Path $dst))){New-Item -Path (Split-Path $dst) -ItemType Directory -Force}
  		Invoke-WebRequest -Uri 'https://github.com/Raphire/Win11Debloat/raw/refs/heads/master/Assets/Start/start2.bin' -OutFile $dst -UseBasicParsing
	 	# Rename Windows Media Player Legacy Start menu shortcut if it exists
		Write-Output "Renaming Windows Media Player Legacy Start shortcut..."		
		Rename-Item -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\Windows Media Player Legacy.lnk" -NewName "Windows Media Player.lnk" -Force

		# NOTEPAD
		# Create Notepad Start menu shortcut
		Write-Output "Create Notepad Start shortcut..."
		$shell = New-Object -ComObject WScript.Shell
		$shortcut = $shell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\Notepad.lnk")
		$shortcut.TargetPath = "$env:SystemRoot\System32\notepad.exe"
		$shortcut.Save()
	
		# Restore New Text Document context menu item
		Write-Output "Restoring New Text Document context menu item..."
		Invoke-WebRequest -UseBasicParsing -Uri "https://github.com/vishnusai-karumuri/Registry-Fixes/raw/refs/heads/master/Restore_New_Text_Document_context_menu_item.reg" -OutFile "$env:TEMP\Restore_New_Text_Document_context_menu_item.reg"
		Start-Process regedit.exe -ArgumentList "/s `"$env:TEMP\Restore_New_Text_Document_context_menu_item.reg`"" -Wait

	}
	else {	
		Write-Host $_.Exception.Message -ForegroundColor Red
		Timeout /T 5 | Out-Null
	} 

<#
	# Install legacy Snipping Tool and Paint apps (portable)
	Write-Output "Installing legacy Snipping Tool and Paint apps (portable)..."
	# Ensure target directory exists
	New-Item -Path "C:\Program Files\Windows NT\Accessories" -ItemType Directory -Force | Out-Null	
	# Ensure Accessories folder exists
	New-Item -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories" -ItemType Directory -Force | Out-Null	
	# SNIPPING TOOL
	# Snipping Tool (Windows 10 Version 1803)
	Invoke-WebRequest -Uri "https://github.com/ManueITest/Windows/raw/main/SnippingTool.zip" -OutFile "$env:TEMP\SnippingTool.zip"
	Expand-Archive -Path "$env:TEMP\SnippingTool.zip" -DestinationPath "C:\Program Files\Windows NT\Accessories" -Force	
	# Create Snipping Tool Start menu shortcut
	Write-Output "Creating Snipping Tool Start shortcut..."
	$shell = New-Object -ComObject WScript.Shell
	$shortcut = $shell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\Snipping Tool.lnk")
	$shortcut.TargetPath = "C:\Program Files\Windows NT\Accessories\SnippingTool.exe"
	$shortcut.Save()		
	# PAINT
	# classic Paint (mspaint) app taken from Windows 10 Build 14393
	Invoke-WebRequest -Uri "https://github.com/ManueITest/Windows/raw/main/Classic%20Paint.zip" -OutFile "$env:TEMP\ClassicPaint.zip"
	Expand-Archive -Path "$env:TEMP\ClassicPaint.zip" -DestinationPath "C:\Program Files\Windows NT\Accessories" -Force	
	# Create Paint Start menu shortcut  
	Write-Output "Creating Paint Start shortcut..."
	$shortcut = $shell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\Paint.lnk")
	$shortcut.TargetPath = "C:\Program Files\Windows NT\Accessories\mspaint1.exe"
	$shortcut.Save()
#>

	Stop-Process -Name explorer -Force | Out-Null	

}