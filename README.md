# 📅 Gestor de Guardias 2026 - Versión 4.0

Sistema web completo para gestión de guardias con generador de calendario integrado.

## 🚀 Características

- ✅ **Generador de calendario integrado** - Crea automáticamente el Excel al iniciar
- ✅ **Gestión inteligente de disponibilidad** - Control de personas activas/inactivas
- ✅ **Sugerencias automáticas** - Solo considera personas disponibles
- ✅ **Validación de asignaciones** - Detecta conflictos de disponibilidad
- ✅ **Interfaz web moderna** - Diseño responsive y fácil de usar
- ✅ **Detección automática de feriados** - Argentinos 2026
- ✅ **Calendario con colores** - Rojo (feriados), Amarillo (vísperas), Azul (hábiles)

## 📋 Requisitos

```bash
pip install flask flask-cors openpyxl
```

## 🔧 Instalación

1. **Crea una carpeta para tu proyecto:**
```bash
mkdir gestor_guardias
cd gestor_guardias
```

2. **Copia los archivos:**
   - `app.py` (el backend Flask)
   - Crea la carpeta `templates/`
   - `templates/index.html` (el frontend)

3. **Estructura final:**
```
gestor_guardias/
├── app.py
└── templates/
    └── index.html
```

## ▶️ Ejecución

```bash
python app.py
```

Al ejecutar por primera vez:
- ✅ Se creará automáticamente `calendario_guardias_2026.xlsx`
- ✅ Se creará `disponibilidad.json` (personas activas/inactivas)
- ✅ Se creará `historial_guardias.json` (log de cambios)

## 🌐 Acceso

- **Local:** http://localhost:5000
- **En red local:** http://[TU_IP]:5000

Para encontrar tu IP:
```bash
# Windows
ipconfig

# Linux/Mac
ifconfig
```

## 📱 Cómo usar la interfaz web

### 1. Seleccionar mes
- Haz clic en cualquier mes del panel izquierdo
- Se mostrará el calendario del mes

### 2. Asignar guardia
- Haz clic en cualquier día
- Se abrirá un modal con:
  - Información del día (fecha, tipo)
  - Sugerencia automática de persona
  - Selector de personas disponibles
- Selecciona la persona y guarda

### 3. Gestionar disponibilidad
- Clic en "⚙️ Gestionar Personas"
- Marca/desmarca el checkbox "Activo"
- Si desactivas a alguien, ingresa el motivo

### 4. Descargar Excel
- Clic en "📥 Descargar Excel"
- Se descargará el calendario actualizado

## 🎨 Códigos de color

### En el calendario Excel:
- 🔴 **Rojo:** Feriados y fines de semana
- 🟡 **Amarillo:** Viernes y vísperas de feriados
- 🔵 **Azul:** Días hábiles (lunes a jueves)

### En la interfaz web:
- **Borde celeste:** Día hábil
- **Borde amarillo:** Víspera
- **Borde rojo:** Feriado
- **Fondo rojo claro:** Persona no disponible (conflicto)

## 📊 API Endpoints disponibles

```
GET  /api/info                    - Información general
GET  /api/calendario              - Meses disponibles
GET  /api/mes/<mes>               - Datos de un mes
GET  /api/personas/activas        - Personas activas
GET  /api/disponibilidad          - Estado de disponibilidad
PUT  /api/disponibilidad/<persona> - Actualizar disponibilidad
POST /api/asignar                 - Asignar guardia
POST /api/eliminar                - Eliminar guardia
GET  /api/sugerir/<mes>/<dia>     - Sugerencia automática
POST /api/generar-calendario      - Regenerar calendario
GET  /api/descargar               - Descargar Excel
GET  /api/historial               - Historial de cambios
GET  /api/health                  - Health check
```

## 🔄 Regenerar calendario

Si necesitas volver a generar el calendario desde cero:

**Opción 1 - Desde la API:**
```bash
curl -X POST http://localhost:5000/api/generar-calendario
```

**Opción 2 - Manual:**
1. Detén el servidor (Ctrl+C)
2. Elimina `calendario_guardias_2026.xlsx`
3. Reinicia el servidor

## ⚙️ Personalización

### Modificar personas:
En `app.py`, edita la lista `PERSONAS`:
```python
PERSONAS = [
    "PERSONA 1",
    "PERSONA 2",
    # ... más personas
]
```

### Modificar feriados:
En `app.py`, edita el conjunto `FERIADOS_2026`:
```python
FERIADOS_2026 = {
    date(2026, 1, 1),   # Año Nuevo
    # ... más feriados
}
```

## 🐛 Solución de problemas

### El calendario no se genera
- Verifica que tengas permisos de escritura en la carpeta
- Revisa que `openpyxl` esté instalado correctamente

### No puedo acceder desde otro dispositivo
- Verifica que tu firewall permita conexiones en el puerto 5000
- Asegúrate de usar tu IP local, no `localhost`

### Aparecen conflictos de disponibilidad
- Revisa el estado de las personas en "Gestionar Personas"
- Puedes forzar asignaciones si es necesario

## 📞 Soporte

Este sistema fue creado para gestionar guardias de forma eficiente y automática.

### Versión: 4.0
### Fecha: Febrero 2026
### Mejoras principales:
- Generador integrado
- Sin necesidad de archivos externos
- Detección automática de conflictos
- Interfaz moderna y responsive

---

¡Disfruta gestionando tus guardias! 🎉
