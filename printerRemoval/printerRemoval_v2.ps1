"""
Invalid Printer Removal Script
Author: @sparky_005

Script to automatically remove all WSD or IP printers

TODO:
add parameters to specify which type of printers you want to remove

If it looks like nothing happened, probably it didn't find any matching printers.

"""
#grabs printer via WMI object and deletes it
function deletePrinter($byePrinter) {
    #write-host $byePrinter
    $a = Get-WmiObject -Class Win32_Printer | Where { $_.name -like $byePrinter }
    #$a = get-wmiobject -query "SELECT * FROM win32_printer WHERE name = '`$byePrinter'"
    #write-host $a
    $a.delete()
}


#regex to match IP address for IP mapped printers
$ipaddress = [regex] '[0-9]{1,3}?\.[0-9]{1,3}?\.[0-9]{1,3}?\.[0-9]{1,3}?'

#get list of currently installed printers 
$printers = Get-WmiObject -Class Win32_Printer | Select Name,DriverName,PortName,Shared,ShareName


foreach ( $item in $printers) {
    
    #check if printer port matches WSD or an IP address
    #if so, call delete function to delete it
    if($item.PortName -like "*WSD*" -or $item.PortName -match "$ipaddress") {
        write-host $item.Name -nonewline -ForegroundColor "Yellow"
        write-host " shouldn't be here. Let's get rid of it"
        #write-host $item.name
        deletePrinter($item.Name)
        Write-host "DONE!"
    }
}