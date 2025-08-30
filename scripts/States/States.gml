//Contains all player states
//player_obj references the states listed here, this script references the player_obj change_state function

//Vars
States.FACING_DIR = "down";
States.attack_started = false;


//HELPER FUNCTIONS
function Get_Direction()
{
    if (keyboard_check(ord("W"))) States.FACING_DIR = "up";
    if (keyboard_check(ord("S"))) States.FACING_DIR = "down";
    if (keyboard_check(ord("A"))) States.FACING_DIR = "left";
    if (keyboard_check(ord("D"))) States.FACING_DIR = "right";
}

//Change player animation
function Animation_Change(current_state)
{
    Get_Direction();
    var _sprite_index = undefined;
    
    switch (current_state) {
    	case PlayerState.IDLE:
            _sprite_index = asset_get_index("player_" + States.FACING_DIR + "_idle");
            break;
        case PlayerState.WALKING:
            _sprite_index = asset_get_index($"player_walk_{States.FACING_DIR}");
            break;
        case PlayerState.ATTACKING:
            _sprite_index = asset_get_index($"player_attack_{States.FACING_DIR}");
            break;
    }
    
    if (player_obj.sprite_index != _sprite_index){
        player_obj.sprite_index = _sprite_index;
        player_obj.image_index = 0;
    }
}

//@param {audio} sound_to_play what sound to play
//@param {int} volume what volume to play the sound at
//@param {bool} randomize_range Whether or not to adjust the pitch
function Audio_Manager(sound_to_play, volume, randomize_range)
{
    var _sound_instance = audio_play_sound(sound_to_play, volume, false);
    if (randomize_range) audio_sound_pitch(_sound_instance, random_range(0.75,1.25));
    else audio_play_sound(sound_to_play, volume, false);
}

///STATE FUNCTIONS

//IDLE
function Idle_Enter()
{
    
}
function Idle_Step(){
    Animation_Change(player_obj.state);
        
    if (keyboard_check(ord("W")) || keyboard_check(ord("A")) || keyboard_check(ord("S")) || keyboard_check(ord("D"))) player_obj.CHANGE_STATE(PlayerState.WALKING);
}
function Idle_Exit(){
    
}

//WALKING
function Walking_Enter(){
    //Handles Audio Cue For Footsteps
    player_obj.alarm[0] = 15;
}
function Walking_Step(){
    player_obj.move_x = keyboard_check_direct(ord("D")) - keyboard_check_direct(ord("A"));
    player_obj.move_y = keyboard_check_direct(ord("S")) - keyboard_check_direct(ord("W"));
    
    player_obj.move_x *= move_speed;
    player_obj.move_y *= move_speed;
    
    move_and_collide(player_obj.move_x, player_obj.move_y, [player_obj.collision_tiles], undefined, undefined, player_obj.move_x, player_obj.move_y);
    
    if (player_obj.move_x != 0 or player_obj.move_y != 0)
    {
        Animation_Change(player_obj.state);
    }
    else 
    {
        player_obj.CHANGE_STATE(PlayerState.IDLE);
    }
    
    
}
function Walking_Exit(){

}

//ATTACKING
function Attacking_Enter(){
    
}
function Attacking_Step(){
    Animation_Change(player_obj.state);
    
    
    if (!States.attack_started)
    {
        States.attack_started = true;
        var _inst = instance_create_depth(player_obj.x, player_obj.y, player_obj.depth, player_sword_attack_anim_obj);
        var facing = States.FACING_DIR;
        var spawn_x = player_obj.x;
        var spawn_y = player_obj.y;
        switch (facing) {
        	case "up":
                spawn_y -= 48;
                spawn_x -= 24;
                _inst.image_yscale = -1;
                break;
            case "down":
                spawn_y += 4;
                spawn_x -= 24;
                _inst.image_yscale = 1;
                break;
            case "left":
                spawn_x -= 48;
                spawn_y -= 24;
                _inst.image_angle -= 90;
                _inst.image_xscale = -1;
                break;
            case "right":
                spawn_y -= 24;
                spawn_x += 4;
                _inst.image_angle += 90;
                _inst.image_xscale = 1;
                break;
        }
        
        _inst.image_xscale *= 1.5;
        _inst.image_yscale *= 1.5;
        
        var _hb_inst = instance_create_layer(spawn_x, spawn_y, "Instances", player_attack_hitbox);
    }
    
    //'locks' the animation in until completed before exiting state
    if (player_obj.image_index >= player_obj.image_number - 1)
    {
        player_obj.CHANGE_STATE(PlayerState.IDLE);
    }
}
function Attacking_Exit(){
    States.attack_started = false;
}