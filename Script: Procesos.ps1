while ($true) {
    Clear-Host
    Write-Host "=== Gestión de procesos ===`n"
    Write-Host "1. Buscar procesos por nombre"
    Write-Host "2. Listar todos los procesos"
    Write-Host "3. Matar un proceso por PID"
    Write-Host "4. Matar un proceso por nombre"
    Write-Host "5. Salir`n"

    $option = Read-Host "Seleccione una opción"

    switch ($option) {
        1 {
            $processName = Read-Host "Introduzca parte del nombre del proceso"
            Get-Process | Where-Object { $_.ProcessName -like "*$processName*" } | Select-Object Id, Name | Format-Table
            Pause
        }
        2 {
            Get-Process | Select-Object Id, Name | Format-Table
            Pause
        }
        3 {
            $processId = Read-Host "Introduzca el PID del proceso a matar"
            Get-Process -Id $processId | Stop-Process -Force
        }
        4 {
            $processName = Read-Host "Introduzca el nombre del proceso a matar"
            Get-Process | Where-Object { $_.ProcessName -eq $processName } | Stop-Process -Force
        }
        5 {
            break
        }
        default {
            Write-Host "Opción no válida. Introduzca una opción del 1 al 5."
            Pause
        }
    }
}
