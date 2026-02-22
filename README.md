# Blank Pixel Game (GameMaker)

RPG de acción en pixel art inspirado en Chrono Trigger, desarrollado en GameMaker Studio 2.

> Este proyecto fue posteriormente migrado a Godot 4 manteniendo la misma lógica.

## Estado actual
- [x] Sistema de movimiento del jugador (caminar, correr, idle)
- [x] Movimiento diagonal con prioridad por último eje presionado
- [x] Sistema de ataque con cooldown (alarm[0])
- [x] Animación STOPPED al correr contra una pared sólida
- [x] Cámara que sigue al jugador (camera_set_view_target)
- [x] Estados con enum (`Estado.IDLE`, `Estado.WALK`, etc.)

## Controles
| Tecla | Acción |
|-------|--------|
| Flechas | Mover |
| Shift | Correr |
| X | Atacar |

## Arquitectura del jugador
El jugador usa una máquina de estados explícita con enum:

```gml
enum Estado { IDLE, WALK, RUN, ATTACK, STOPPED }
```

Variables clave:
- `vw = 4` — velocidad al caminar (px/frame)
- `vr = 6` — velocidad al correr (px/frame)
- `facing` — dirección del sprite: `"up"`, `"down"`, `"left"`, `"right"`
- `last_main_axis` — eje dominante en diagonal (`"horizontal"` o `"vertical"`)
- `isAttacking` / `isReady` — control del cooldown de ataque

## Estructura del proyecto
```
Blank Pixel Game/
├── objects/obj_player/
│   ├── Create_0.gml       # Inicialización, enum Estado, cámara
│   ├── Step_0.gml         # Llama a actualizarMovimientoYSprite()
│   ├── Alarm_0.gml        # Fin del cooldown de ataque
│   └── Collision_obj_pared.gml  # Marca stopped = true
├── scripts/
│   ├── obtenerEstadoJugador/    # Máquina de estados
│   └── actualizarMovimientoYSprite/  # Movimiento, sprites, dirección
├── sprites/               # Sprites del jugador y entorno
└── rooms/                 # Habitaciones del juego
```

## Próximas características planeadas

### Fase 1: Sistema de combate por turnos
- [ ] Transición de exploración a combate
- [ ] Sistema de turnos estilo Chrono Trigger
- [ ] Menú de acciones (Atacar, Técnica, Item, Huir)
- [ ] Sistema de combos y técnicas especiales

### Fase 2: Sistema RPG
- [ ] Stats del personaje (HP, MP, ATK, DEF, etc.)
- [ ] Sistema de experiencia y niveles
- [ ] Inventario y equipamiento

### Fase 3: Exploración y mundo
- [ ] NPCs con diálogos
- [ ] Mapas conectados
- [ ] Cofres y triggers en el mapa

### Fase 4: Historia y contenido
- [ ] Sistema de party (múltiples personajes)
- [ ] Cinemáticas y eventos scripted
- [ ] Misiones principales y secundarias

## Tecnologías
- **Motor:** GameMaker Studio 2
- **Lenguaje:** GML 2.3+
- **Arte:** Pixel art propio
