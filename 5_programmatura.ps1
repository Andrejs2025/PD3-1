$list = winget upgrade | Select-Object -Skip 2
$count = ($list | Measure-Object).Count
Write-Host "Sistēmā ir $count programmas, kuras nepieciešams atjaunināt."