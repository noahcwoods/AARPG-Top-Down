// States
enum PlayerState 
{
    IDLE,
    WALKING,
    ATTACKING
}
state = PlayerState.IDLE;

state_enter = [Idle_Enter, Walking_Enter, Attacking_Enter];
state_step = [Idle_Step, Walking_Step, Attacking_Step];
state_exit = [Idle_Exit, Walking_Exit, Attacking_Exit];

//Movement Controllers
collision_tiles = layer_tilemap_get_id("tiles_col");
facing = 0;
move_x = 0;
move_y = 0;

//State Machine Switcher
function CHANGE_STATE(new_state)
{
    if (state != new_state)
    {
        if (state_exit[state]) state_exit[state]();
        state = new_state;
        
        if (state_enter[state]) state_enter[state]();
    }
}

function DEBUG_LOG(message)
{
    show_debug_message(message);
}

