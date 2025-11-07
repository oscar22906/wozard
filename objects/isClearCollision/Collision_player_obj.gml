
if (instance_number(enemy1) <= 0) {
    if room != Level2 {
        room_goto_next();
    }
    
    else {
        room_goto(Level3);
    }
    
    
}