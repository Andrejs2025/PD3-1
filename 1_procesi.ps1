$top5Processes = Get-Process | 
    Where-Object { $_.ProcessName -notmatch "svchost" } | 
    Sort-Object WorkingSet64 -Descending | 
    Select-Object -First 5 ProcessName, @{Name="RAM(MB)"; Expression={[Math]::Round($_.WorkingSet64 / 1MB, 2)}}

$top5Processes | Format-Table -AutoSize

$totalRAM = ($top5Processes | Measure-Object -Property "RAM(MB)" -Sum).Sum

Write-Host "Top 5 processes total RAM: $totalRAM MB"