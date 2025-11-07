// Get health ratio
var health_ratio = player.player_health / player.player_max_health;

// Smooth transition (optional)
health_display = lerp(health_display, player.player_health, 0.1);
var display_ratio = health_display / player.player_max_health;

// Choose sprite based on form
var bar_sprite;

switch (player.state_machine) {
    case -1: bar_sprite = healthbar_flesh; break;
    case 0:  bar_sprite = healthbar_spectral; break;
    case 1:  bar_sprite = healthbar_plastic; break;
}

// Choose frame based on health
var frame_count = sprite_get_number(bar_sprite);
var frame_index = floor(0);

// Draw the healthbar sprite at GUI position
draw_sprite_ext(bar_sprite, frame_index, x_gui, y_gui, 5.5, 5.5, 0, c_white, 1);
