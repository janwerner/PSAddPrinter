$PrinterFriendlyName = "Samsung ML-2250"
$PrinterDriverName = "Samsung ML-2250 Series"
$PrinterPortName = "Repeater:"
$LPRServerAddress = "10.0.7.2"
$LPRQueueName = "LPRServer"
$PrinterDriverInfPath = "$PSScriptRoot\..\drivers\Samsung ML-2250\ssgh1.inf"

# Create LPR port
Add-PrinterPort -Name "$PrinterPortName" -LprHostAddress "$LPRServerAddress" -LprQueueName "$LPRQueueName"

# Install printer driver
Start-Process -NoNewWindow -Wait -FilePath "$env:windir\system32\rundll32.exe" -ArgumentList "$env:windir\system32\printui.dll PrintUIEntry /ia /f `"$PrinterDriverInfPath`" /m `"$PrinterDriverName`""

# Create printer
Add-Printer -Name "$PrinterFriendlyName" -PortName "$PrinterPortName" -DriverName "$PrinterDriverName"
