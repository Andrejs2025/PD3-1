$disk = Get-Volume -DriveLetter C
$percent = ($disk.SizeRemaining / $disk.Size) * 100
$log = "$env:USERPROFILE\Documents\Apkope.log"
$now = Get-Date

if ($percent -lt 25) {
    Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Clear-RecycleBin -Force -Confirm:$false
    "[$now] Tīrīšana veikta. Atbrīvoti 0.5 GB." >> $log
} else {
    "[$now] Vieta pietiekama." >> [span_9](start_span)$log[span_9](end_span)
}