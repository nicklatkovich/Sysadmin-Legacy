/// scr_map_generate(map_width:int, map_height:int, seed:int, full:[0, 1]) : ds_grid

var map_width  = argument0;
var map_height = argument1;
var seed       = argument2;
var full       = argument3;

var result = ds_grid_create(map_width, map_height);
for (var i = 0; i < map_width; i++) {
    for (var j = 0; j < map_height; j++) {
        ds_grid_set(result, i, j, 0);
    }
}

random_set_seed(seed);
var list_x = ds_list_create();
var list_y = ds_list_create();
var start_x = rand(map_width);
var start_y = rand(map_height);
var done_cell = 0;
var cell_num = map_width * map_height;

ds_list_add(list_x, start_x);
ds_list_add(list_y, start_y);
ds_grid_set(result, start_x, start_y, -1);

while (ds_list_size(list_x) > 0 && done_cell / cell_num < full) {
    var k = rand(ds_list_size(list_x));
    var xx = ds_list_find_value(list_x, k);
    var yy = ds_list_find_value(list_y, k);
    ds_list_delete(list_x, k);
    ds_list_delete(list_y, k);
    if (ds_grid_get(result, xx, yy) == -1) {
        done_cell++;
        ds_grid_set(result, xx, yy, 1);
        
        var near_cells = 0;
        
        for (var i = 0; i < 4; i++) {
            var x1 = xx + dx(i);
            var y1 = yy + dy(i);
            if (in_range(x1, 0, map_width) && in_range(y1, 0, map_height)) {
                // Cell is on map
                var grid_cell = ds_grid_get(result, x1, y1);
                if (grid_cell == 0) {
                    ds_list_add(list_x, x1);
                    ds_list_add(list_y, y1);
                    ds_grid_set(result, x1, y1, -1);
                } else if (grid_cell > 0) {
                    near_cells++;
                }
            }
        }
        
        var near = rand(near_cells);
        for (var i = 0; i < 4; i++) {
            var x1 = xx + dx(i);
            var y1 = yy + dy(i);
            if (in_range(x1, 0, map_width) && in_range(y1, 0, map_height)) {
                var grid_cell = ds_grid_get(result, x1, y1);
                if (grid_cell > 0) {
                    near--;
                    if (near < 0) {
                        ds_grid_set(result, xx, yy,
                            ds(i));
                        ds_grid_set(result, x1, y1,
                            grid_cell * ds(i + 2));
                        i = MAX_UINT;
                    }
                }
            }
        }
    }
}

ds_list_destroy(list_x);
ds_list_destroy(list_y);

return result;

