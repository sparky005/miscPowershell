echo "Let's remove those weird Viper registry keys";
$list = Read-Host "Enter computer list file path";
$list = gc $list;
$prompt = Read-Host "Do you want to remove keys (Y/N)";
if($prompt -eq 'Y' -OR $prompt -eq 'y')
{
    invoke-command -cn $list .\viperRegRemove.ps1;
}
else
{
    invoke-command -cn $list .\viperRegCheck.ps1;
}

echo "Now let's remove MSE";
invoke-command -cn $list .\removeMSE.ps1;