#########################
# Complete Power-On of NUC VMs
# Checks state of host, corrects
# Powers on all VMs
# Author: Travis Newshott (travis.newshott@firemon.com)
# 24May18
#########################

$server = "IP_ADDRESS"
$user = "USER"
$pwd = "PASSWORD"

Connect-VIServer -Server $server -Protocol https -User $user -Password $pwd
Set-VMHost -State Connected -Confirm:$false
$vms = Get-VM
Foreach($vm in $vms)
{
  If($vm.PowerState -eq "PoweredOn"){continue}
  Start-VM $vm -Confirm:$false
}
Get-VM | Format-Table -Property Name,PowerState
