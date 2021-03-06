$ErrorActionPreference= 'silentlycontinue';

$compname = gc env:computername;

pushd;
sl HKLM:\Software;
if(test-path SBAMSvc)
{
    remove-item SBAMSvc;
    write-host "SBAMSvc REMOVED from $compname" -foreground "red";
}
else
{
    "SBAMSvc does not exist on $compname";
}
popd;

pushd;
sl HKLM:\SYSTEM\CurrentControlSet\services\;
if(test-path SBAMSvc)
{
    remove-item SBAMSvc;
    write-host "SBAMSvc service REMOVED from $compname" -foreground "red";
}
else
{
    "SBAMSvc service does not exist on $compname";
}
popd;

pushd;
sl HKLM:\SYSTEM\CurrentControlSet\services\;
if(test-path sbapifs)
{
    remove-item -recurse sbapifs;
    write-host "sbapifs service REMOVED from $compname" -foreground "red";
}
else
{
    "sbapifs service does not exist on $compname";
}
popd;

pushd;
sl HKLM:\SYSTEM\CurrentControlSet\services\;
if(test-path SBRE)
{
    remove-item -recurse SBRE;
    write-host "SBRE service REMOVED from $compname" -foreground "red";
}
else
{
    "SBRE service does not exist on $compname";
}
popd;
