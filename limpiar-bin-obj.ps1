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

$roslynSource = Join-Path $projectRoot "packages\Microsoft.CodeDom.Providers.DotNetCompilerPlatform.4.1.0\tools\Roslyn-4.1.0"
$roslynTarget = Join-Path $projectRoot "FlexComercio\roslyn"

if (Test-Path -LiteralPath $roslynSource) {
    if ($WhatIf) {
        Write-Host "Se copiaria Roslyn desde: $roslynSource"
        Write-Host "Hacia: $roslynTarget"
    }
    else {
        New-Item -ItemType Directory -Path $roslynTarget -Force | Out-Null
        Copy-Item -Path (Join-Path $roslynSource "*") -Destination $roslynTarget -Recurse -Force
        Write-Host "Roslyn copiado: $roslynTarget"
    }
}
else {
    Write-Host "No se encontro Roslyn en packages: $roslynSource"
}

Write-Host ""
Write-Host "Listo. Ahora podes abrir Visual Studio y recompilar la solucion."
