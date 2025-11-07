// input

var _hx = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _vy = keyboard_check(ord("S")) - keyboard_check(ord("W"));
var _dash = keyboard_check_pressed(vk_space);

var isMoving = (_hx != 0 || _vy != 0);


// dash

if (_dash && !isDashing && dash_cooldown <= 0) {
    isDashing = true;
    dashStarted = true;
    dashDuration = 35;
    dash_cooldown = 45; 
    
    if (state_machine == 0) {
        state_machine = 1;
    }
    else if (state_machine == 1) {
        state_machine = -1;
    }
    else if (state_machine == -1) {
        state_machine = 0;
    }

    image_index = 0; 

    if (!isMoving) _hx = (lastDir == 1) ? 1 : -1;
}


// dash
if (isDashing) {
    move_speed = 20;

    if (dashStarted) {
        dashStarted = false;
        // ignore vertical movement mid dash
        _vy = 0;
    }
    
    dashDuration--;
    if (dashDuration <= 0) {
        
        // dash end
        
        isDashing = false;
    }
}
else {
    move_speed = 10;
    if (dash_cooldown > 0) dash_cooldown--;
}


// movement
move_and_collide(_hx * move_speed, _vy * move_speed, tilemap);


// direction facing

if (_hx < 0) lastDir = 0;
if (_hx > 0) lastDir = 1;


// sprite variables
var spr_idle_left;
var spr_idle_right;
var spr_run_left;
var spr_run_right;
var spr_dash_left;
var spr_dash_right;

// Select set depending on form
if (state_machine == -1) {
    spr_idle_left = player_left_idle_flesh;
    spr_idle_right = player_right_idle_flesh;
    spr_run_left = player_left_run_flesh;
    spr_run_right = player_right_run_flesh;
    spr_dash_left = player_left_dash_plastic;
    spr_dash_right = player_right_dash_plastic;
}
else if (state_machine == 0) {
    spr_idle_left = player_left_idle_spectral;
    spr_idle_right = player_right_idle_spectral;
    spr_run_left = player_left_run_spectral;
    spr_run_right = player_right_run_spectral;
    spr_dash_left = player_left_dash_flesh;
    spr_dash_right = player_right_dash_flesh;
}
else if (state_machine == 1) {
    spr_idle_left = player_left_idle_plastic;
    spr_idle_right = player_right_idle_plastic;
    spr_run_left = player_left_run_plastic;
    spr_run_right = player_right_run_plastic;
    spr_dash_left = player_left_dash_spectral;
    spr_dash_right = player_right_dash_spectral;
}


// choose based on movement state
if (isDashing) {
    sprite_index = (lastDir == 0) ? spr_dash_left : spr_dash_right;
}
else if (isMoving) {
    sprite_index = (lastDir == 0) ? spr_run_left : spr_run_right;
}
else {
    sprite_index = (lastDir == 0) ? spr_idle_left : spr_idle_right;
}
