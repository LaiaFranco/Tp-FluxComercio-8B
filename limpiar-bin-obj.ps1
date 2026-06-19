param(
    [switch]$WhatIf
)

$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$foldersToClean = @(
    "Dominio\bin",
    "Dominio\obj",
    "Negocio\bin",
    "Negocio\obj",
    "FlexComercio\bin",
    "FlexComercio\obj"
)

Write-Host "Limpiando carpetas bin y obj en:"
Write-Host $projectRoot
Write-Host ""

foreach ($relativeFolder in $foldersToClean) {
    $fullPath = Join-Path $projectRoot $relativeFolder
    $resolvedRoot = [System.IO.Path]::GetFullPath($projectRoot)
    $resolvedTarget = [System.IO.Path]::GetFullPath($fullPath)

    if (-not $resolvedTarget.StartsWith($resolvedRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "Ruta fuera del proyecto: $resolvedTarget"
    }

    if (Test-Path -LiteralPath $resolvedTarget) {
        if ($WhatIf) {
            Write-Host "Se borraria: $resolvedTarget"
        }
        else {
            Remove-Item -LiteralPath $resolvedTarget -Recurse -Force
            Write-Host "Borrado: $resolvedTarget"
        }
    }
    else {
        Write-Host "No existe: $resolvedTarget"
    }
}

Write-Host ""
Write-Host "Listo. Ahora podes abrir Visual Studio y recompilar la solucion."
