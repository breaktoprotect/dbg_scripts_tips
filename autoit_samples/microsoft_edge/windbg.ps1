$WinDbgPath = "c:\Program Files (x86)\Windows Kits\10\Debuggers\x64\windbg.exe"

$p = Get-Process -Name MicrosoftEdgeCP

$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
ForEach ($pr in $p) {
    Write-Host ("Attaching to {0}" -f ($pr.Id))
	$args = '-p {0} -c "$<{1}" -WF C:\Users\admin\Desktop\default.WEW' -f ($pr.Id, (Join-Path $scriptPath "windbgscript.txt"))
	Start-Process -FilePath $WinDbgPath -ArgumentList $args
}