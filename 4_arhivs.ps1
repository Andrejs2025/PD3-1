$src = "$env:USERPROFILE\Documents\Errors.txt"
$date = Get-Date -Format "yyyy-MM-dd"
$zip = "$env:USERPROFILE\Documents\Atskaite_$date.zip"

Compress-Archive -Path $src -DestinationPath $zip -Force
$size = (Get-Item $zip).Length / 1KB
Write-Host "Arhīva izmērs: $($size.ToString('F2')) KB"