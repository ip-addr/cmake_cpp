$count = 1
foreach ($arg in $args) {
    Write-Host "vscode/cmd #argument$count : $($arg)" -ForegroundColor Green
    $count++
}