# 🎯 NUEVA FUNCIONALIDAD: Distribución Equitativa con Slider de Usuarios

## ✨ Características Nuevas

### 1. **Selector de Usuario (Slider)**
Cada mes muestra un panel con todos los oficiales activos. Puedes:
- ✅ Ver cuántos días tiene asignado cada persona
- ✅ Ver la distribución por tipo (Hábiles, Vísperas, Feriados)
- ✅ Seleccionar tu usuario haciendo clic en tu tarjeta

### 2. **Modo Auto-Asignación** ✋
Una vez que seleccionas tu usuario:
1. Haz clic en el botón **"✋ Modo Auto-Asignación"**
2. Los días disponibles se resaltarán en verde
3. Simplemente haz clic en cualquier día disponible
4. ¡Listo! Te asignas automáticamente

### 3. **Distribución Automática Equitativa** ⚡
El botón **"⚡ Distribución Automática"** hace todo el trabajo:
- Distribuye TODOS los días del mes
- De forma EQUITATIVA entre personas activas
- Balanceando días hábiles, vísperas y feriados
- Respeta las disponibilidades de cada persona

---

## 📖 Cómo Usar

### **Opción A: Auto-Asignación Manual**

1. **Selecciona un mes** (ej: Febrero)
2. **Selecciona tu usuario** en el panel superior
   - Verás tus estadísticas actualizadas
3. **Activa el modo auto-asignación**
   - Clic en "✋ Modo Auto-Asignación"
4. **Haz clic en los días que quieres**
   - Solo puedes asignarte días sin ocupar
   - El sistema verifica tu disponibilidad
5. **Listo!** Tus asignaciones quedan guardadas

#### Ejemplo de uso:
```
Usuario: TN MACHUCA
Días actuales: 8 (5 hábiles, 2 vísperas, 1 feriado)

[Clic en día 15] → Asignado! ✅
[Clic en día 20] → Asignado! ✅

Nuevos totales: 10 días (6 hábiles, 3 vísperas, 1 feriado)
```

---

### **Opción B: Distribución Automática**

1. **Selecciona un mes** (ej: Marzo)
2. **Clic en "⚡ Distribución Automática"**
3. **Confirma** la acción
4. El sistema automáticamente:
   - Detecta todas las personas activas
   - Cuenta los días disponibles
   - Distribuye equitativamente por tipo
   - Asigna rotativamente

#### Ejemplo de resultado:
```
MARZO 2026 - Distribución Automática
=====================================
Total días: 31
Personas activas: 13

Distribución resultante:
- TNIM BUTASSI:      2 días (1H, 0V, 1F)
- TN MACHUCA:        2 días (1H, 1V, 0F)
- TNAU BARRIOS:      2 días (2H, 0V, 0F)
- TF ONETO CAJAL:    3 días (2H, 0V, 1F)
- TFCO LEDESMA:      2 días (1H, 1V, 0F)
- TFIM GONZALEZ:     2 días (2H, 0V, 0F)
- TFIM RACEDO:       3 días (1H, 1V, 1F)
- TF ZALAZAR:        2 días (1H, 0V, 1F)
- TCCO PALMA:        2 días (2H, 0V, 0F)
- TC LEDESMA:        3 días (1H, 1V, 1F)
- GUIM DIAZ:         2 días (1H, 1V, 0F)
- GUIM TORRES:       3 días (2H, 0V, 1F)
- GUCO BENITEZ:      3 días (1H, 1V, 1F)
```

---

## 🎨 Interfaz Visual

### **Tarjetas de Usuario**
```
┌─────────────────────────────────┐
│ TN MACHUCA               Total: 8│
│ H:5  V:2  F:1                   │
└─────────────────────────────────┘
  ↑                           ↑
  Estadísticas por tipo    Total anual
```

**Al hacer clic:**
- La tarjeta se pone azul (seleccionada)
- Se muestran estadísticas detalladas abajo
- Se habilita el botón de auto-asignación

### **Modo Auto-Asignación Activo**
```
Días disponibles:
┌────────────────┐
│ 15  [HÁBIL]   │  ← Verde: Puedes asignarte
│ ✓ Clic aquí   │
└────────────────┘

Días ocupados:
┌────────────────┐
│ 16  [VÍSPERA] │  ← Gris: Ya ocupado
│ TN MACHUCA    │
└────────────────┘
```

---

## 📊 Estadísticas del Usuario

Cuando seleccionas tu usuario, verás:

```
📊 Tus asignaciones en TN MACHUCA
────────────────────────────────────
Total de días:     12
Días hábiles:      8  (azul)
Vísperas:          3  (amarillo)
Feriados:          1  (rojo)
Este mes:          2
────────────────────────────────────
```

---

## 🔄 Algoritmo de Distribución Automática

El sistema usa un algoritmo equitativo que:

1. **Separa días por tipo**
   - Hábiles (lun-jue normales)
   - Vísperas (viernes + previo a feriados)
   - Feriados (sábados, domingos, feriados)

2. **Distribuye rotativamente**
   - Persona 1 → Primer día hábil
   - Persona 2 → Segundo día hábil
   - ...
   - Persona 13 → Décimotercero día hábil
   - Persona 1 → Décimocuarto día hábil (vuelve al inicio)

3. **Verifica disponibilidad**
   - Si Persona X no está disponible → Salta a siguiente
   - Mantiene la equidad en el conteo

4. **Resultado final**
   - Diferencia máxima: ±1 día entre personas
   - Distribución balanceada por tipo

---

## ⚙️ API Endpoints Nuevos

### **GET `/api/estadisticas/usuario/<persona>`**
Obtiene estadísticas de asignaciones de un usuario.

**Respuesta:**
```json
{
  "persona": "TN MACHUCA",
  "estadisticas": {
    "total": 12,
    "habil": 8,
    "vispera": 3,
    "feriado": 1,
    "por_mes": {
      "Enero": {
        "total": 2,
        "habil": 1,
        "vispera": 1,
        "feriado": 0,
        "dias": [...]
      }
    }
  },
  "activo": true
}
```

### **POST `/api/asignar/usuario/<mes>/<dia>`**
Auto-asignación de un usuario a un día.

**Body:**
```json
{
  "persona": "TN MACHUCA"
}
```

**Respuesta exitosa:**
```json
{
  "success": true,
  "mensaje": "✅ Te asignaste exitosamente al día 15 de Febrero",
  "dia": 15,
  "persona": "TN MACHUCA",
  "tipo_dia": "habil"
}
```

### **POST `/api/distribucion/auto/<mes>`**
Distribución automática equitativa de un mes completo.

**Respuesta:**
```json
{
  "success": true,
  "mensaje": "✅ Distribución automática completada para Febrero",
  "mes": "Febrero",
  "dias_asignados": 28,
  "personas_participantes": 13,
  "distribucion": {
    "TN MACHUCA": {
      "habil": 1,
      "vispera": 1,
      "feriado": 0,
      "total": 2
    },
    ...
  }
}
```

---

## 💡 Casos de Uso

### **Caso 1: Planificación Individual**
*"Quiero elegir mis propios días"*

1. Selecciona tu usuario
2. Activa modo auto-asignación
3. Revisa el calendario
4. Haz clic en los días que prefieras
5. El sistema mantiene tu conteo actualizado

### **Caso 2: Distribución Rápida del Mes**
*"Necesito llenar todo Marzo rápidamente"*

1. Selecciona "Marzo"
2. Clic en "⚡ Distribución Automática"
3. ¡Listo! Todo el mes asignado equitativamente

### **Caso 3: Ajustes después de Auto-Distribución**
*"La distribución automática está bien, pero quiero cambiar algunos días"*

1. Después de distribución automática
2. Selecciona tu usuario
3. Usa el modal normal para:
   - Eliminar días que no quieres
   - Reasignar a otra persona
4. Usa auto-asignación para tomarte días libres

---

## 🎯 Ventajas del Sistema

✅ **Equidad Garantizada**
- Todos reciben ±1 día de diferencia
- Balance entre tipos de día

✅ **Flexibilidad**
- Distribución automática O manual
- Combinar ambos métodos

✅ **Transparencia**
- Cada usuario ve su propio conteo
- Visible quién tiene más/menos días

✅ **Respeta Disponibilidad**
- No asigna a personas inactivas
- Verifica disponibilidad por fecha

✅ **Velocidad**
- Un mes completo en 1 clic
- O asignación selectiva día por día

---

## 🚀 Próximos Pasos

Ahora que tienes el sistema completo:

1. **Prueba la distribución automática** en un mes
2. **Revisa los resultados** - Deberían estar balanceados
3. **Usa el modo manual** para ajustes finos
4. **Exporta el Excel** cuando esté listo

**¡Disfruta de tu nuevo sistema de guardias equitativas!** 🎉
