/// @description Configurar el personaje al iniciar

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
key_attack = ord(x)

// ───────── VELOCIDADES ─────────
vw = 4; // velocidad al caminar
vr = 6; // velocidad al correr

// ───────── ESTADO Y DIRECCIÓN ─────────
state = "idle";
facing = "down";
last_horizontal = "right";
last_vertical = "down";
last_main_axis = "";

cdAttackS = 3
isReady = true

stopped = false;

