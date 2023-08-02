$pythonUrl = "https://www.python.org/ftp/python/3.9.7/python-3.9.7-amd64.exe"
$pythonInstaller = "$env:TEMP\python-3.9.7-amd64.exe"
Invoke-WebRequest -Uri $pythonUrl -OutFile $pythonInstaller -UseBasicParsing
Start-Process -Wait -FilePath $pythonInstaller -ArgumentList "/quiet", "PrependPath=1" -Verb RunAs
Remove-Item -Path $pythonInstaller -Force
$pythonBinFolder = (Get-Command python).Source.Substring(0, (Get-Command python).Source.LastIndexOf('\'))
$env:Path += ";$pythonBinFolder"
Start-Process -FilePath "cmd.exe" -ArgumentList "/C pip install slowloris" -Verb RunAs
