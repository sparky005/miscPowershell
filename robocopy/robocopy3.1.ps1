#this script will run a robocopy to duplicate Axiom's backup data to another location
# the script will first check if any removable disks are present on the preset drive letters
# it will then copy the data to whatever drive is present

# it will also check to make sure the inserted drive is DESIGNATION for backup storatge
# it will do this by checking the root dir and making sure there is an identifying file present

#readOnly vars for drive letters
set-variable J -option ReadOnly -value 74
set-variable W -Option ReadOnly -Value 87

#location of backup directory
$backupDir = "\\TS-XEL8A8\StoreGrid-Backups\BDR"


foreach ($driveLetter in $J..$W) {
    $driveLetter = "$([char]$driveletter):\"
    if((test-path -LiteralPath $driveLetter) -AND (test-path -LiteralPath $driveLetter\backupAllowed.txt)) {
        #perform copy
        robocopy "$backupDir" "$driveLetter\sgstorage" /MIR /R:2 /W:5
        
        #free vars
        Remove-Variable M -Force
        Remove-Variable W -force

        #exit
        exit
    }
}

#if we don't find a usable backup drive
#quit with error
Remove-Variable M -Force
Remove-Variable W -force

Throw "Can't find usable backup drive"