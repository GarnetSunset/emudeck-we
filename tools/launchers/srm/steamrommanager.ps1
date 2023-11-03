. "$env:USERPROFILE/AppData/Roaming/EmuDeck/backend/functions/all.ps1"
$steamRunning = Get-Process -Name "Steam" -ErrorAction SilentlyContinue
if ($steamRunning) {
	taskkill /IM steam.exe /F
}
SRM_createParsers
SRM_addSteamInputProfiles
RPCS3_renameFolders

$emulatorFile = "$toolsPath/srm.exe"
$scriptFileName = [System.IO.Path]::GetFileNameWithoutExtension($MyInvocation.MyCommand.Name)
Start-Process $emulatorFile -WindowStyle Maximized -Wait

if ($steamRunning) {
	startSteam
}