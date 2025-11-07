#macro view view_camera[0]

camera_set_view_size(view,view_width*window_scale,view_height*window_scale);

if(instance_exists(player_obj))
{
    var _x = (player_obj.x-view_width/2) + 48 ;
    var _y = player_obj.y-view_height/2;
    
    camera_set_view_pos(view,_x,_y);
}
