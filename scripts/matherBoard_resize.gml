/// matherBoard_resize(oMatherBoard, new_cell_size: int);

var mb   = argument0;
var size = argument1;

with (mb) {
    cell_size = size;
    half_cell_size = cell_size / 2;
    line_length = cell_size * 0.7;
    map_w = map_width * cell_size;
    map_h = map_height * cell_size;
    xx = xx mod map_w;
    yy = yy mod map_h;
    
    for (var i = 0; i < map_width; i++) {
        var x2 = (i + 0.5) * cell_size;
        for (var j = 0; j < map_height; j++) {
            var y2 = (j + 0.5) * cell_size;
            var way = ds_grid_get(ways, i, j);
            way.x = x2;
            way.y = y2;
            way.xx = i;
            way.yy = j;
            if (way.hub >= 0) {
                way.hub.x = way.x;
                way.hub.y = way.y;
            }
        }
    }
    
    spr_scale = cell_size / sprite_get_width(sWay);
    need_draw = true;
}

