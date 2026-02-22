/// @description Actualiza movimiento del personaje y su sprite
function actualizarMovimientoYSprite() {

    // ───────────── Reiniciar velocidad ─────────────
    speed = 0;

    // ───────────── INPUTS ─────────────
    var right = keyboard_check(key_right);
    var left  = keyboard_check(key_left);
    var up    = keyboard_check(key_up);
    var down  = keyboard_check(key_down);

    var horizontal_conflict = (right && left);
    var vertical_conflict   = (up && down);
    var moving = right || left || up || down;

    // ───────────── ACTUALIZAR ESTADO ─────────────
    state = obtenerEstadoJugador();

    // ───────────── SPRITES DE ESTADO FIJO ─────────────
    if (state == Estado.IDLE) {
        image_speed = 1;
        sprite_index = asset_get_index("spr_player_idle_" + string(facing));
        stopped = false;
        last_main_axis = "";
        return;
    }

    if (state == Estado.STOPPED) {
        image_speed = 1;
        sprite_index = asset_get_index("spr_player_stop_" + string(facing));
        return;
    }

    // ───────────── ESTADO DE ATAQUE ─────────────
    if (state == Estado.ATTACK) {
        image_speed = 1;
        sprite_index = asset_get_index("spr_player_attack_" + string(facing));
        stopped = false;
        // Solo inicializar el ataque en el primer frame (evita resetear el alarm cada frame)
        if (!isAttacking) {
            isReady = false;
            isAttacking = true;
            alarm[0] = room_speed * cdAttackS;
        }
        return; // Salir para no ejecutar lógica de movimiento
    }

    // Si no está detenido, lo desactivamos
    stopped = false;

    // ───────────── VELOCIDAD SEGÚN ESTADO ─────────────
    v = (state == Estado.RUN) ? vr : vw;

    // ───────────── REGISTRO DE TECLA ─────────────
    if (keyboard_check_pressed(key_right) && !left) {
        last_horizontal = "right";
        if (last_main_axis == "") last_main_axis = "horizontal";
    }
    if (keyboard_check_pressed(key_left) && !right) {
        last_horizontal = "left";
        if (last_main_axis == "") last_main_axis = "horizontal";
    }
    if (keyboard_check_pressed(key_up) && !down) {
        last_vertical = "up";
        if (last_main_axis == "") last_main_axis = "vertical";
    }
    if (keyboard_check_pressed(key_down) && !up) {
        last_vertical = "down";
        if (last_main_axis == "") last_main_axis = "vertical";
    }

    // ───────────── MOVIMIENTO Y DIRECCIÓN ─────────────
    if (!horizontal_conflict && !vertical_conflict) {
        if (right && up)        { direction = 45;  speed = v; }
        else if (left && up)    { direction = 135; speed = v; }
        else if (left && down)  { direction = 225; speed = v; }
        else if (right && down) { direction = 315; speed = v; }
        else if (right)         { direction = 0;   speed = v; }
        else if (left)          { direction = 180; speed = v; }
        else if (up)            { direction = 90;  speed = v; }
        else if (down)          { direction = 270; speed = v; }
    }

    // ───────────── DETERMINAR FACING ─────────────
    var moving_horizontal = (right != left);
    var moving_vertical   = (up != down);

    if (moving_horizontal && moving_vertical) {
        facing = (last_main_axis == "horizontal") ? last_horizontal : last_vertical;
    } else if (moving_horizontal) {
        facing = right ? "right" : "left";
        last_horizontal = facing;
        last_main_axis = "horizontal";
    } else if (moving_vertical) {
        facing = down ? "down" : "up";
        last_vertical = facing;
        last_main_axis = "vertical";
    }

    // ───────────── CAMBIO DE SPRITE SEGÚN ESTADO ─────────────
    if (speed > 0 && !horizontal_conflict && !vertical_conflict) {
        image_speed = 1;
        var state_name;
        switch (state) {
            case Estado.WALK: state_name = "walk"; break;
            case Estado.RUN:  state_name = "run";  break;
        }
        sprite_index = asset_get_index("spr_player_" + state_name + "_" + string(facing));
    } else if (speed == 0) {
        // Teclas en conflicto o sin movimiento efectivo: mostrar idle
        image_speed = 1;
        sprite_index = asset_get_index("spr_player_idle_" + string(facing));
    }
}
