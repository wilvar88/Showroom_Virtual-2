# Script para conectar con GitHub
# Uso: .\push-to-github.ps1 TU-USUARIO-DE-GITHUB

param(
    [Parameter(Mandatory=$true)]
    [string]$GitHubUser
)

Write-Host "🚀 Conectando con GitHub..." -ForegroundColor Cyan
Write-Host ""

# Configurar remote
$repoUrl = "https://github.com/$GitHubUser/showroom-virtual-quito.git"

Write-Host "📡 Configurando repositorio remoto:" -ForegroundColor Yellow
Write-Host "   $repoUrl" -ForegroundColor Gray
git remote add origin $repoUrl

if ($LASTEXITCODE -ne 0) {
    Write-Host "⚠️  Remote ya existe, actualizando URL..." -ForegroundColor Yellow
    git remote set-url origin $repoUrl
}

Write-Host ""
Write-Host "🔄 Cambiando a branch 'main'..." -ForegroundColor Yellow
git branch -M main

Write-Host ""
Write-Host "⬆️  Subiendo código a GitHub..." -ForegroundColor Yellow
Write-Host "   (Te pedirá tus credenciales de GitHub)" -ForegroundColor Gray
Write-Host ""

git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ ¡Código subido exitosamente!" -ForegroundColor Green
    Write-Host ""
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
    Write-Host "📋 SIGUIENTES PASOS:" -ForegroundColor Cyan
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "1. Ve a: https://github.com/$GitHubUser/showroom-virtual-quito" -ForegroundColor White
    Write-Host ""
    Write-Host "2. Haz clic en 'Settings' → 'Pages'" -ForegroundColor White
    Write-Host ""
    Write-Host "3. En 'Branch', selecciona: main + / (root) + Save" -ForegroundColor White
    Write-Host ""
    Write-Host "4. Espera 1-2 minutos" -ForegroundColor White
    Write-Host ""
    Write-Host "5. Tu sitio estará en:" -ForegroundColor White
    Write-Host "   https://$GitHubUser.github.io/showroom-virtual-quito/" -ForegroundColor Green
    Write-Host ""
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "❌ Error al subir el código" -ForegroundColor Red
    Write-Host "   Verifica que:" -ForegroundColor Yellow
    Write-Host "   • Hayas creado el repositorio en GitHub" -ForegroundColor Gray
    Write-Host "   • Tu usuario sea correcto: $GitHubUser" -ForegroundColor Gray
    Write-Host "   • Tengas permisos de escritura" -ForegroundColor Gray
}
