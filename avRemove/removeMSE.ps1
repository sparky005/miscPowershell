#$ErrorActionPreference= 'silentlycontinue';

#TODO: add checking to ensure MSE was actually removed
#just check path again after running setup.exe /x /s

$compname = gc env:computername;

$path = "$env:programfiles\Microsoft Security Essentials";
if(test-path $path)
{
    write-host "mse FOUND in $path on $compname" -foreground "red";
    $setup = "$path\setup.exe";
    &$setup /x /s;
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
}
else
{
    echo "mse NOT found in $path on $compname";
}