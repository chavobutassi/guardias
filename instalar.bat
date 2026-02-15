@echo off
echo ========================================
echo   INSTALADOR - Gestor de Guardias 2026
echo ========================================
echo.

echo [1/4] Verificando Python...
python --version
if %errorlevel% neq 0 (
    echo ERROR: Python no esta instalado
    echo Por favor instala Python desde: https://www.python.org/downloads/
    pause
    exit /b 1
)

echo.
echo [2/4] Instalando dependencias...
pip install flask flask-cors openpyxl

echo.
echo [3/4] Creando estructura de carpetas...
if not exist templates mkdir templates

echo.
echo [4/4] Verificando archivos...
if not exist app.py (
    echo ERROR: Falta el archivo app.py
    pause
    exit /b 1
)
if not exist templates\index.html (
    echo ERROR: Falta el archivo templates\index.html
    pause
    exit /b 1
)

echo.
echo ========================================
echo   INSTALACION COMPLETADA
echo ========================================
echo.
echo Para ejecutar la aplicacion:
echo   1. Ejecuta: python app.py
echo   2. Abre tu navegador en: http://localhost:5000
echo.
pause
