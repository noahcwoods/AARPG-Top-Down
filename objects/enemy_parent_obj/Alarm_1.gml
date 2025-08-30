if (instance_exists(player_obj) && distance_to_object(player_obj) < distance_to_player)
{
    target_x = player_obj.x;
    target_y = player_obj.y;
}
else 
{
    target_x = random_range(xstart - 100, xstart + 100);	
    target_y = random_range(ystart - 100, ystart + 100);	
}

alarm[1] = 30;