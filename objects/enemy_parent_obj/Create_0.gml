target_x = x;
target_y = y;
injured = false;
collision_tiles = layer_tilemap_get_id("tiles_col");

//knockback values
kb_x = 15;
kb_y = 15;

//move speed controller - speed changes on knockback
move_speed_orig = move_speed;

alarm[1] = 30;

enum Enemy_Facing{
    UP,
    DOWN,
    LEFT,
    RIGHT
}
enemy_facing = Enemy_Facing.DOWN;

function Enemy_Animation_Change(enemy_name, state_type)
{
    switch (enemy_facing) {
    	case Enemy_Facing.RIGHT:
            sprite_index = asset_get_index($"{enemy_name}_{state_type}_right");
            break;
        case Enemy_Facing.LEFT:
            sprite_index = asset_get_index($"{enemy_name}_{state_type}_left");
            break;
        case Enemy_Facing.DOWN:
            sprite_index = asset_get_index($"{enemy_name}_{state_type}_down");
            break;
        case Enemy_Facing.UP:
            sprite_index = asset_get_index($"{enemy_name}_{state_type}_up");
            break;
    }
}