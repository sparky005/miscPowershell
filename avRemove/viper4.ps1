#$ErrorActionPreference= 'silentlycontinue';

echo "Let's remove those weird Viper registry keys";

$prompt = Read-Host "Do you want to run this on a list of computers?";

if($prompt -eq 'Y' -OR $prompt -eq 'y')
{
    $list = Read-Host "Enter computer list file path";
    $list = gc $list;
}
else
{
    $list = Read-Host "Enter single computer name";
}

$prompt = Read-Host "Do you want to remove keys (Y/N)";
$msePrompt = Read-Host "As long as we're removing AV, do you want to remove MSE?";

if($prompt -eq 'Y' -OR $prompt -eq 'y')
{
    write-host "Checking and removing Viper reg keys" -foreground "red";
    invoke-command -cn $list .\viperRegRemove.ps1;
}
else
{
    write-host "Checking and NOT removing viper reg keys" -foreground "red";
    invoke-command -cn $list .\viperRegCheck.ps1;
}

#$prompt = Read-Host "Do you want to remove MSE as well?";
if($msePrompt -eq 'Y' -OR $msePrompt -eq 'y')
{
    invoke-command -cn $list .\removeMSE2.ps1;
}