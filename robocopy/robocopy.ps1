#this script will run a robocopy to duplicate Axiom's backup data to another location
# the script will first check if any removable disks are present on the preset drive letters
# it will then copy the data to whatever drive is present

#readOnly vars for drive letters
set-variable M -option ReadOnly -value 77
set-variable W -Option ReadOnly -Value 87

#location of backup directory
$backupDir = "C:\test\test2"


foreach ($driveLetter in 78) {
    $driveLetter = "$([char]$driveletter):\"
    if(test-path -LiteralPath $driveLetter) {
        robocopy "$backupDir" "$driveLetter\testbackup" /MIR /R:2 /W:5
        #exit
    }
}


Remove-Variable M -Force
Remove-Variable W -force