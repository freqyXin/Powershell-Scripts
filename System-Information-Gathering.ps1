Write-Host "Thanks for using this script. It is intended for System Admins and Penetration Testers"
Write-Host "This script must be executed locally."

#input from user
$YOUR_OUT_LOCATION = Read-Host "Please enter the path to your folder you would like to save results to"

    wmic nicconfig list full | Out-File "$YOUR_OUT_LOCATION\nicconfig.txt"    

	wmic process list full | Out-File "$YOUR_OUT_LOCATION\process.txt"
	
	wmic qfe list full | Out-File "$YOUR_OUT_LOCATION\qfe-patches.txt"
	
	wmic service list full | Out-File "$YOUR_OUT_LOCATION\services.txt"

	Get-HotFix | Out-File "$YOUR_OUT_LOCATION\hot-fixes.txt"

	Get-NetFirewallRule -all | Out-File "$YOUR_OUT_LOCATION\host-firewall-rules.txt"

	netstat -nao | Out-File "$YOUR_OUT_LOCATION\ports-processes.txt"

	tasklist /svc | Out-File "$YOUR_OUT_LOCATION\services-processes.txt"

Write-Host "Hope this helped. Thanks for using!"