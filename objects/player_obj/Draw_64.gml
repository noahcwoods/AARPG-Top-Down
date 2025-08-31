
//START HEALTH BAR DISPLAY
var _hearts_total = max_hp / 4;
var _current_hearts = floor(hp / 4);
var _partial_heart = hp - (_current_hearts * 4);
var _hearts_remaining = _hearts_total - _current_hearts;

var _margin_x = 0;
var _margin_y = 28;
var _spacing = 72;

for (var i = 1; i <= _hearts_total; i++)
{
    if (i <= _current_hearts) draw_sprite(spr_health_icons, 4, _margin_x + (_spacing * i), _margin_y);
    else if (i == _current_hearts + 1) && (_partial_heart != 0) draw_sprite(spr_health_icons, _partial_heart, _margin_x + (_spacing * i), _margin_y);
    else if (_hearts_remaining > 0) draw_sprite(spr_health_icons, 0, _margin_x + (_spacing * i), _margin_y);
}
//END HEALTH BAR DISPLAY