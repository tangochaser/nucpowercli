#########################
# Complete Power-Off of NUC 
# Avoids corruption by safely shutting down VMware environment
# Author: Travis Newshott (travis.newshott@firemon.com)
# 24May18
#########################

$server = "replace this with your server IP"
$user = "replace this with your username"
$pwd = "replace this with cleartext password"

Connect-VIServer -Server $server -Protocol https -User $user -Password $password
Get-VM | Suspend-VM -confirm $false
Set-VMHost -State Maintenance -confirm $false
Stop-VMHost -confirm $false
