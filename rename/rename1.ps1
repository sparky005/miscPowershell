PS C:\Users\asadik\test> dir -Force -Recurse | Where { -not $_.PSIsContainer } | Rename-Item -NewName{$_.name -replace "
%","_"}