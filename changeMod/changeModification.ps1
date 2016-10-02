#this script will change modification dates of all files in the C:\voicemails directory
#this is to solve the issue where FTP uploads are getting their mod dates changed
#will run as a scheduled task

$voicemails = "C:\Voicemails"


foreach ($file in dir $voicemails -Force -Recurse) {
#excludes directories
if ($file -isnot [System.IO.DirectoryInfo]) {
        $pieces = $file.Name.split("_")
        $date = $pieces[0] + "_" + $pieces[1]
        $date = [datetime]::parseexact($date, "yyyyMMdd_hhmmsstt", $null)
        $file.LastWriteTime = $date
}
}
exit