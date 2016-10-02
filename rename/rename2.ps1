$filter = [regex] '^\.|[\\/*?"<>\|#%]'
dir -Force -Recurse | Where { -not $_.PSIsContainer } | Rename-Item -NewName{$_.name -replace "$filter", "_"}