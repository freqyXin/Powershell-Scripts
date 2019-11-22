Write-Host "Thanks for using this script. It is intended for System Admins and Penetration Testers"
Write-Host "This script must be executed locally."

#input from user
$YOUR_OUT_LOCATION = Read-Host "Please enter the path to your folder you would like to save results to"

    # Grabs current network interface configuration
    wmic nicconfig list full | Out-File "$YOUR_OUT_LOCATION\nicconfig.txt"    

    #Grabs full list of processes 
	wmic process list full | Out-File "$YOUR_OUT_LOCATION\process.txt"
	
    #Gives full list of services runing on the system
	wmic service list full | Out-File "$YOUR_OUT_LOCATION\services.txt"
    
    #Grabs hot-fix patches applied to system
	Get-HotFix | Out-File "$YOUR_OUT_LOCATION\hot-fixes.txt"

    #Grabs the system's current firewall rules
	Get-NetFirewallRule -all | Out-File "$YOUR_OUT_LOCATION\host-firewall-rules.txt"
    
    #Shows system ports and the processes running on each
	netstat -nao | Out-File "$YOUR_OUT_LOCATION\ports-processes.txt"
    
    #Shows system service and the processes associated
	tasklist /svc | Out-File "$YOUR_OUT_LOCATION\services-processes.txt"

Write-Host "Hope this helped. Thanks for using!"