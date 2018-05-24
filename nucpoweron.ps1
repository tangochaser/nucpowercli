#########################
# Complete Power-Off of NUC
# Avoids corruption by safely shutting down VMware environment
# Author: Travis Newshott (travis.newshott@firemon.com)
# 24May18
#########################

$server = "192.168.159.10"
$user = "root"
$pwd = "FireMon1!"

Connect-VIServer -Server $server -Protocol https -User $user -Password $pwd
Set-VMHost -State Connected -Confirm:$false
$vms = Get-VM
Foreach($vm in $vms)
{
  If($vm.PowerState -eq "PoweredOn"){continue}
  Start-VM $vm -Confirm:$false
}
Get-VM | Format-Table -Property Name,PowerState
