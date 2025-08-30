if (alarm[1] < 0)
{
    hp -= other.damage;
    image_blend = c_red;
    alarm[1] = 30;
    
    
    if (hp <= 0)
    {
        room_restart();
    }
    
    var _dir = point_direction(x, y, other.x, other.y)
    var push = 7;
    x += lengthdir_x(-push, _dir)
    y += lengthdir_y(-push, _dir)
}