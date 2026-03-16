-ForegroundColor Green$sec = Get-MpComputerStatus
if ($sec.RealTimeProtectionEnabled -eq $false -or $sec.QuickScanAge -gt 3) {
    Write-Host "Sistema ir apdraudeta!" -ForegroundColor Red
} else {
    Write-Host "Sistema ir drosa." -ForegroundColor Green
}