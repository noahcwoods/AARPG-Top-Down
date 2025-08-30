var left = x + x_offset;   //48
var top = y + y_offset;    //0
var right = left + hb_width;
var bottom = top + hb_height;

if (player_obj.image_index <= player_obj.image_number - 1){
    instance_destroy();
}