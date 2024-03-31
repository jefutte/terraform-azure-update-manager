

function Clear-WsusSettings {
    <#
    .SYNOPSIS   
    Clears the Wsus settings from the registry
        
    .DESCRIPTION 
    This function removes several values regarding WSUS from the registry, temporarily allowing a local administrative users to download patches from Microsoft Update instead of the regularly defined WSUS server. If group policies are setup for this machine the WSUS settings might be reapplied depending on the GPO configuration.
        
    .EXAMPLE   
    Clear-WsusSettings
    
    Description
    -----------
    Will purge the defined registry settings in the WindowsUpdate key
    
    .EXAMPLE   
    Clear-WsusSettings -WhatIf
    
    Description
    -----------
    Will display which changes will be made in the registry without actually making any changes
    #>
    [cmdletbinding(SupportsShouldProcess=$true)]
    param ()
    $ErrorActionPreference = 'SilentlyContinue'
    Remove-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate' -Force -Name WUServer
    Remove-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate' -Force -Name TargetGroup
    Remove-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate' -Force -Name WUStatusServer
    Remove-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate' -Force -Name TargetGroupEnable
    Set-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU' -Value 0 -Force -Name UseWUServer
    Set-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU' -Value 0 -Force -Name NoAutoUpdate
    Set-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU' -Value 3 -Force -Name AUOptions
    Set-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate'    -Value 0 -force -Name DisableWindowsUpdateAccess
    Restart-Service -Name wuauserv
}


function Get-WsusSettings {
    <#
    .SYNOPSIS   
    Gets the Wsus settings from the registry
        
    .DESCRIPTION 
    This function gets several values regarding WSUS from the registry
        
    .EXAMPLE   
    Get-WsusSettings
    
    Description
    -----------
    Will get the defined registry settings in the WindowsUpdate key
    
    .EXAMPLE   
    Get-WsusSettings
    
    #>
    [cmdletbinding(SupportsShouldProcess=$true)]
    param ()
    $ErrorActionPreference = 'SilentlyContinue'
    Get-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate' -Name WUServer
    Get-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate' -Name TargetGroup 
    Get-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate' -Name WUStatusServer
    Get-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate' -Name TargetGroupEnable
    Get-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name UseWUServer
    Get-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name NoAutoUpdate
    Get-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name AUOptions
    Get-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate' -Name DisableWindowsUpdateAccess
}

Get-WsusSettings

Clear-WsusSettings