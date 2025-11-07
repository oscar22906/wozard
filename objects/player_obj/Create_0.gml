move_speed = 10;
isDashing = false;
dashStarted = false;
dashDuration = 0;
dash_cooldown = 0;
lastDir = 1;

state_machine = 0; // -1: flesh, 0: spectral, 1: plastic
tilemap = layer_tilemap_get_id("tile_walls"); 

player_health = 5;
player_max_health = 5;
invincible = false;

