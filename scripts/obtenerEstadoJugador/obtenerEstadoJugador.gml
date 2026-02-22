function obtenerEstadoJugador() {
    // Verifica si el jugador se está moviendo en alguna dirección
    var moving = keyboard_check(key_right) || keyboard_check(key_left) ||
                 keyboard_check(key_up) || keyboard_check(key_down);

    // Verifica si está corriendo (Shift + dirección)
    var running = keyboard_check(key_run) && moving;

	var attacking = keyboard_check(key_attack);

	// Si hay un ataque en curso, mantenerlo hasta que el alarm lo termine
	if (isAttacking) return Estado.ATTACK;

	// Iniciar nuevo ataque (tiene prioridad sobre el estado stopped)
	if (attacking && isReady) return Estado.ATTACK;

	if (stopped && running) { return Estado.STOPPED; }

    // Si estaba detenido pero ya no corre, vuelve a caminar
    if (state == Estado.STOPPED && !running) return Estado.WALK;

    // Si no se mueve, idle
    if (!moving) return Estado.IDLE;

    // Si se mueve, corre o camina
    return running ? Estado.RUN : Estado.WALK;
}
