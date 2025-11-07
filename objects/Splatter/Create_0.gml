splatterSystem = part_system_create()
splatterParticle = part_type_create()

part_type_sprite(splatterParticle, flesh_splatter,true, false, false);
part_type_life(splatterParticle, 200, 300);
part_type_scale(splatterParticle,5,5);
part_type_size(splatterParticle, 5, 10, 6, 0);
part_type_orientation(splatterParticle, 0, 0, 0, 0, true);
part_type_direction(splatterParticle,0,0,0,0);

part_type_color1(splatterParticle, c_red);

part_type_speed(splatterParticle,0,0,0,0);
part_type_gravity(splatterParticle, 0, 0);
part_type_alpha1(splatterParticle, 0);
