# 🎮 Proyecto RPG - Estilo Chrono Trigger

## 📋 Descripción General
Este es un proyecto de RPG 2D desarrollado en GameMaker Studio 2024, inspirado en el clásico Chrono Trigger. El juego busca combinar exploración en tiempo real con combates por turnos y múltiples sistemas RPG.

## 🏗️ Estado Actual del Desarrollo

### ✅ Sistemas Implementados

#### 1. **Sistema de Movimiento**
- **Movimiento en 8 direcciones** completo (cardinal y diagonal)
- **Dos velocidades de movimiento:**
  - Caminar: 4 píxeles/frame
  - Correr: 6 píxeles/frame (con Shift)
- **Sistema de prioridad de ejes:** Resuelve conflictos cuando se presionan múltiples teclas
- **Detección de colisiones** con objetos sólidos (paredes)

#### 2. **Sistema de Sprites y Animaciones**
- **Estados del personaje implementados:**
  - `idle`: Reposo en 4 direcciones
  - `walk`: Caminar en 4 direcciones
  - `run`: Correr en 4 direcciones
  - `stop`: Frenado brusco al colisionar mientras corre
  - `attack`: Ataque básico en 4 direcciones
- **Sistema dinámico de sprites:** Cambia automáticamente según estado y dirección

#### 3. **Sistema de Ataque Básico**
- Ataque con cooldown de 3 segundos
- Animaciones de ataque para cada dirección
- Sistema de estado `isReady` para controlar disponibilidad

#### 4. **Controles**
- **Teclas configurables** en el código:
  - Movimiento: Flechas direccionales
  - Correr: Shift
  - Atacar: X

### 📁 Estructura del Proyecto

```
Blank Pixel Game/
├── objects/
│   ├── obj_player/         # Jugador principal
│   │   ├── Create_0.gml    # Inicialización de variables
│   │   ├── Step_0.gml      # Loop principal de movimiento
│   │   ├── Collision_obj_pared.gml  # Manejo de colisiones
│   │   └── Alarm_0.gml     # Control de cooldown de ataque
│   └── obj_pared/           # Objeto de colisión (paredes)
│
├── scripts/
│   ├── actualizarMovimientoYSprite/  # Lógica principal de movimiento
│   └── obtenerEstadoJugador/         # Determina el estado actual
│
├── sprites/
│   ├── spr_player_idle_*   # Sprites de reposo (4 direcciones)
│   ├── spr_player_walk_*   # Sprites de caminar
│   ├── spr_player_run_*    # Sprites de correr
│   ├── spr_player_stop_*   # Sprites de frenado
│   ├── spr_player_attack_* # Sprites de ataque
│   ├── spr_pared/          # Sprite de pared
│   └── spr_background/     # Fondo del nivel
│
└── rooms/
    └── Room1/              # Sala de prueba con laberinto básico
```

## 🎯 Próximas Características Planeadas

### Fase 1: Sistema de Combate por Turnos
- [ ] Transición de exploración a combate
- [ ] Sistema de turnos estilo Chrono Trigger
- [ ] Menú de acciones (Atacar, Técnica, Item, Huir)
- [ ] Sistema de combos y técnicas especiales

### Fase 2: Sistema RPG
- [ ] Stats del personaje (HP, MP, ATK, DEF, etc.)
- [ ] Sistema de experiencia y niveles
- [ ] Inventario de items
- [ ] Equipamiento (armas, armaduras, accesorios)

### Fase 3: Exploración y Mundo
- [ ] NPCs con diálogos
- [ ] Sistema de mapas conectados
- [ ] Cofres y objetos interactuables
- [ ] Eventos y triggers en el mapa

### Fase 4: Historia y Contenido
- [ ] Sistema de party (múltiples personajes)
- [ ] Cinemáticas y eventos scripted
- [ ] Misiones principales y secundarias

## 🔧 Detalles Técnicos

### Variables Principales del Jugador

```gml
// Velocidades
vw = 4;        // Velocidad al caminar
vr = 6;        // Velocidad al correr

// Estados
state = "idle";           // Estado actual
facing = "down";          // Dirección que mira
last_horizontal = "right"; // Última dirección horizontal
last_vertical = "down";    // Última dirección vertical
last_main_axis = "";      // Último eje principal usado

// Sistema de ataque
cdAttackS = 3;   // Cooldown en segundos
isReady = true;  // Si puede atacar

// Control
stopped = false; // Si está detenido por colisión
```

### Flujo de Estados

```
IDLE ←→ WALK ←→ RUN
  ↓      ↓      ↓
ATTACK ATTACK STOPPED
```

## 🐛 Problemas Conocidos

1. **Error de sintaxis en Create_0.gml:** Falta cerrar comillas en `key_attack = ord(x)` - debe ser `ord("X")`
2. **Sistema de ataque incompleto:** Solo tiene animación, falta daño y detección de enemigos
3. **Sin enemigos implementados** todavía

## 🚀 Cómo Ejecutar

1. Abrir el proyecto en GameMaker Studio 2024
2. Corregir el error en `Create_0.gml` línea 16: `key_attack = ord("X")`
3. Compilar y ejecutar (F5)

## 📝 Notas de Desarrollo

- El proyecto usa sprites placeholder que necesitarán ser reemplazados con arte final
- La estructura modular permite añadir fácilmente nuevos estados y comportamientos
- El sistema de scripts separados facilita el mantenimiento del código

## 🎨 Inspiraciones
- **Chrono Trigger:** Sistema de combate, transiciones, exploración
- **Secret of Mana:** Movimiento en tiempo real
- **Final Fantasy VI:** Sistemas RPG y progresión

---

**Última actualización:** Diciembre 2024  
**Motor:** GameMaker Studio 2024.11.0.179  
**Versión del proyecto:** 0.1.0 (Pre-Alpha)
