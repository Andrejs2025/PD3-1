$filePath = "$HOME\Documents\Errors.txt"

$startDate = (Get-Date).AddDays(-7)
$errors = Get-WinEvent -FilterHashtable @{
    LogName = 'System'
    Level = 2
    StartTime = $startDate
} -ErrorAction SilentlyContinue

$header = if ($errors.Count -gt 10) {
    "[KRITISKI]] System is unstable!"
} else {
    "[OK] Error level is normal."
}

$errorList = $errors | ForEach-Object {
    "$($_.TimeCreated): $($_.Message)"
}

$output = @($header) + $errorList
$output | Out-File -FilePath $filePath -Encoding utf8
