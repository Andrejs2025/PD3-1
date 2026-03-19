# Run the winget list command and filter for upgrade-available packages
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$updates = winget list --upgrade-available | Select-Object -Skip 3 | Where-Object { $_ -match '\S' }

# Count the number of updates found
$updateCount = $updates.Count

# Output the result
Write-Output "There are [$updateCount] programs on the system that need to be updated."

# Optional: Output the list of programs with updates
if ($updateCount -gt 0) {
    Write-Output "`nPrograms with available updates:"
    $updates
}