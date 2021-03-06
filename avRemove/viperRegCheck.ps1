$ErrorActionPreference= 'silentlycontinue';

$compname = gc env:computername;

pushd;
sl HKLM:\Software;
if(test-path SBAMSvc)
{
    write-host "SBAMSvc FOUND on $compname" -foreground "red";
}
else
{
    "SBAMSvc NOT found on $compname";
}
popd;

pushd;
sl HKLM:\SYSTEM\CurrentControlSet\services\;
if(test-path SBAMSvc)
{
    write-host "SBAMSvc service FOUND on $compname" -foreground "red";
}
else
{
    "SBAMSvc service NOT found on $compname";
}
popd;

pushd;
sl HKLM:\SYSTEM\CurrentControlSet\services\;
if(test-path sbapifs)
{
    write-host "sbapifs service FOUND on $compname" -foreground "red";
}
else
{
    "sbapifs service NOT found on $compname";
}
popd;

pushd;
sl HKLM:\SYSTEM\CurrentControlSet\services\;
if(test-path SBRE)
{
    write-host "SBRE service FOUND on $compname" -foreground "red";
}
else
{
    "SBRE service NOT found on $compname";
}
popd;
