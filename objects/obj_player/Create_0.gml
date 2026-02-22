/// @description Configurar el personaje al iniciar

// ───────── ESTADOS ─────────
enum Estado {
    IDLE,
    WALK,
    RUN,
    ATTACK,
    STOPPED
}

// ───────── CONFIGURACIÓN DE TECLAS PERSONALIZABLES ─────────
//key_right = ord("D");
//key_left  = ord("A");
//key_up    = ord("W");
//key_down  = ord("S");

key_up    = vk_up;
key_down  = vk_down;
key_left  = vk_left;
key_right = vk_right;
key_run = vk_shift;
key_attack = ord("X");

// ───────── VELOCIDADES ─────────
vw = 4; // velocidad al caminar
vr = 6; // velocidad al correr

// ───────── ESTADO Y DIRECCIÓN ─────────
state = Estado.IDLE;
facing = "down";
last_horizontal = "right";
last_vertical = "down";
last_main_axis = "";

cdAttackS = 3;
isReady = true;
isAttacking = false;

stopped = false;

// ───────── CÁMARA ─────────
view_enabled = true;
view_visible[0] = true;
camera_set_view_target(view_camera[0], id);
