if (alarm[0] < 0)
{
    hp -= other.damage;
    injured = true;
    kb_x = sign(x - other.x);
    kb_y = sign(y - other.y);
    
    image_blend = c_red;
    alarm[0] = 20;
}