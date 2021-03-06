$filter = [regex] '^\.|^~|[#%]'
$reps = [regex] '^~|[#%]'
$source = "C:\Users\asadik\test"
$destination = "C:\Users\asadik\test2"

New-Item $source\MovedFiles.txt -type file
New-Item $source\Renamed.txt -type file

#dir $source -Force -Recurse | Where { -not $_.PSIsContainer } | Where { $_.name -match $filter } | Move-Item $destination

foreach ($i in dir $source -Force -Recurse) {
    if (-not $_.PSIsContainer -and $i.name -match $filter) {
        echo $i.FullName >> "$source\MovedFiles.txt"
        $dest = $i.FullName -replace "C:\\Users\\asadik\\test", "$destination"
        if(!(Test-Path $dest)) {
            New-Item $dest -type directory
        }
        Copy-Item -Force -Recurse -path $i.FullName -destination $dest
        $output = "Renamed " + $i.FullName + " to "
        $newname = $i.Name -replace "$reps", "_"
        $output = $output + $newname
        Rename-Item -path $i.FullName -NewName $newname
        echo $output >> "$source\Renamed.txt"
    }
}