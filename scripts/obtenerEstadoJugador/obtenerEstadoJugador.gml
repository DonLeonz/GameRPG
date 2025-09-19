function obtenerEstadoJugador() {
    // Verifica si el jugador se está moviendo en alguna dirección
    var moving = keyboard_check(key_right) || keyboard_check(key_left) || 
                 keyboard_check(key_up) || keyboard_check(key_down);
    
    // Verifica si está corriendo (Shift + dirección)
    var running = keyboard_check(key_run) && moving;
	
	var attacking = keyboard_check(key_attack);
	
	if (stopped && running) { return "stopped"}

    // Si estaba detenido pero ya no corre, vuelve a caminar
    if (state == "stopped" && !running) return "walk";
	
	if (attacking && isReady) return "attack"

    // Si no se mueve, idle
    if (!moving) return "idle";

    // Si se mueve, corre o camina
    return running ? "run" : "walk";
}