#$ErrorActionPreference= 'silentlycontinue';

$compname = gc env:computername;

$path = "$env:programfiles\Microsoft Security Essentials";
if(test-path $path)
{
    write-host "mse FOUND in $path on $compname" -foreground "red";
    $setup = "$path\setup.exe";
    &$setup /x /s;
    write-host "mse REMOVED from $path on $compname" -foreground "red";
}
else
{
    echo "mse NOT found in $path on $compname";
}

$path = "$env:programfiles\Microsoft Security Client";
if(test-path $path) 
{
    write-host "mse FOUND in $path on $compname" -foreground "red";
    $setup = "$path\setup.exe";
    &$setup /x /s;
    write-host "mse REMOVED from $path on $compname" -foreground "red";
}
else
{
    echo "mse NOT found in $path on $compname";
}