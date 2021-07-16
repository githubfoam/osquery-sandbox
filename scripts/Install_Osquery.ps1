# Silent Install Firefox 
## Download URL: https://www.mozilla.org/en-US/firefox/all/
### When a new version of FireFox comes out, just change the firefox version or url to the new value

#--------------------------------------------------------------------------------------------------------
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/set-psdebug?view=powershell-7.1
Set-PSDebug -Trace 2 #turns script debugging features on and off, sets the trace level

$VerbosePreference = "continue"
Write-Output $VerbosePreference
#--------------------------------------------------------------------------------------------------------

# https://docs.chocolatey.org/en-us/choco/commands/install
# https://community.chocolatey.org/packages/osquery/
choco install --yes --no-progress --virus-check  --params='/InstallService' osquery 

choco list --local-only

choco install --yes --no-progress --virus-check sysinternals
psservice config osqueryd

Write-Output "displays a list of running services."
tasklist | findstr "osqueryd.exe"

Write-Output "display a list of all processes along with their corresponding PID, and services that are tied to them"
tasklist /svc | findstr "osqueryd"

# Get all services on the computer
Get-Service -Name "osqueryd"
Get-Service "osquery*"
Get-Service "osqueryd" -RequiredServices #gets the services that the osqueryd service requires

Get-Service -Name "osqueryd" | Stop-Service -Force

Start-Service -DisplayName *osqueryd* -WhatIf

Get-Service -Displayname "osqueryd"

Get-CimInstance win32_service | Where-Object Name -eq "osqueryd"

Start-Service osqueryd

Get-CimInstance win32_service | Where-Object Name -eq "osqueryd"

