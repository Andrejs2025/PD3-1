$disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
$procenti = ($disk.FreeSpace / $disk.Size) * 100
$fails = "$env:USERPROFILE\Documents\Apkope.log"
$laiks = Get-Date -Format "yyyy-MM-dd HH:mm"

if ($procenti -lt 25) {
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue
    Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    
    "[$laiks] Tīrīšana veikta. Atbrīvoti 0.5 GB." >> $fails
} else {
    "[$laiks] Vieta pietiekama." >> $fails
}