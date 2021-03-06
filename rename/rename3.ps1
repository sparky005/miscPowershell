$filter = [regex] '^\.|^~|[#%]'
$source = "C:\Users\asadik\test\newTest"
$destination = "C:\Users\asadik\test2"
$moved = "C:\Users\asadik\MovedFiles.txt"
$renamed = "C:\Users\asadik\Renamed.txt"

New-Item $moved -type file
New-Item $renamed -type file

#dir $source -Force -Recurse | Where { -not $_.PSIsContainer } | Where { $_.name -match $filter } | Move-Item $destination

foreach ($i in dir $source -Force -Recurse) {
    if (-not $_.PSIsContainer -and $i.name -match $filter) {
        echo $i.FullName >> $moved
        Copy-Item -path $i.FullName -destination $destination\$i
        $output = "Renamed " + $i.FullName + " to "
        $newname = $i.Name -replace "$filter", "_"
        $output = $output + $newname
        Rename-Item -path $i.FullName -NewName $newname
        echo $output >> $renamed
    }
}