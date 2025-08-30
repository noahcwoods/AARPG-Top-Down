var _hor = clamp(target_x - x, -1, 1);
var _ver = clamp(target_y - y, -1, 1);


// applies knockback when hit
if (alarm[0] >= 0)
{
    target_x = x + kb_x;
    target_y = y + kb_y;
}else{
    move_speed = move_speed_orig;
}

move_and_collide(_hor * move_speed, _ver * move_speed, [collision_tiles, enemy_parent_obj], undefined, undefined, undefined, move_speed, move_speed);

//Get Current Facing Direction
if (_speed_x >= 1){
    enemy_facing = Enemy_Facing.RIGHT;
}
if (_speed_x <= -1){
    enemy_facing = Enemy_Facing.LEFT;
}
if (_speed_y >= 1){
    enemy_facing = Enemy_Facing.DOWN;
}
if (_speed_y <= -1){
    enemy_facing = Enemy_Facing.UP;
}