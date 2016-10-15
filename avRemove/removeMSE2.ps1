#$ErrorActionPreference= 'silentlycontinue';

#TODO: add checking to ensure MSE was actually removed
#just check path again after running setup.exe /x /s

$compname = gc env:computername;
#cmd /c "\\nasdrv02\it\Software\scripts\avRemove\test.bat" -wait;

$path1 = "$env:programfiles\Microsoft Security Essentials";
$path2 = "$env:programfiles\Microsoft Security Client";
if((test-path $path1) -OR (test-path $path2))
{
    write-host "mse FOUND on $compname" -foreground "red";
    write-host "running Microsoft-supplied MSREMOVE script" -foreground "red";
    cmd /c "\\nasdrv02\it\Software\scripts\avRemove\MSREMOVE.bat" -wait;
}
else
{
    echo "mse NOT found in $path on $compname";
}