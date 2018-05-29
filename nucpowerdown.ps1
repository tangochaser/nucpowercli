#########################
# Complete Power-Off of NUC
# Avoids corruption by safely shutting down VMware environment
# Author: Travis Newshott (travis.newshott@firemon.com)
# 24May18
#########################

$server = "IP_ADDRESS"
$user = "USER"
$pwd = "PASSWORD"

Connect-VIServer -Server $server -Protocol https -User $user -Password $pwd
$vmlist = Get-VM
Foreach ($vm in $vmlist)
{
  If($vm.PowerState -eq "Suspended"){continue}
  Suspend-VM $vm -Confirm:$false
}
$hoststatus = Get-VMHost
If($hoststatus.ConnectionState -eq "Connected")
{
  Set-VMHost -State Maintenance -Confirm:$false
  Stop-VMHost
}
Else
{
  Stop-VMHost
}
