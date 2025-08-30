var _gui_width = display_get_gui_width();
var _heart_spacer = 48;

for (var i = 0; i < hp; i++)
{
    draw_sprite_ext(spr_health_full, 0, _gui_width - 256 - (_heart_spacer * i), 64, 4, 4, 0, c_white, 1);
}

draw_sprite_ext(spr_life_text, 0, _gui_width - 256, 16, 4, 4, 0, c_white, 1);