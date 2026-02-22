#!/bin/bash

echo "========================================"
echo "  INSTALADOR - Gestor de Guardias 2026"
echo "========================================"
echo ""

echo "[1/4] Verificando Python..."
if ! command -v python3 &> /dev/null; then
    echo "ERROR: Python3 no está instalado"
    echo "Por favor instala Python3 desde tu gestor de paquetes"
    exit 1
fi
python3 --version

echo ""
echo "[2/4] Instalando dependencias..."
pip3 install flask flask-cors openpyxl

echo ""
echo "[3/4] Creando estructura de carpetas..."
mkdir -p templates

echo ""
echo "[4/4] Verificando archivos..."
if [ ! -f "app.py" ]; then
    echo "ERROR: Falta el archivo app.py"
    exit 1
fi
if [ ! -f "templates/index.html" ]; then
    echo "ERROR: Falta el archivo templates/index.html"
    exit 1
fi

echo ""
echo "========================================"
echo "  INSTALACIÓN COMPLETADA"
echo "========================================"
echo ""
echo "Para ejecutar la aplicación:"
echo "  1. Ejecuta: python3 app.py"
echo "  2. Abre tu navegador en: http://localhost:10000"
echo ""
