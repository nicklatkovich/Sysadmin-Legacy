/// rotate_cell(oMatherBoard, xx: int, yy: int, steps: int);

var mb = argument0;
var xx = argument1;
var yy = argument2;
var st = argument3;

with (mb) {
    var cell_state = ds_grid_get(map, xx, yy);
    if (cell_state > 0 && cell_state % CELL_STRONG != 0) {
        cell_state = rotate_state(cell_state, st);
        ds_grid_set(map, xx, yy, cell_state);
        var way = ds_grid_get(ways, xx, yy);
        way.state = cell_state;
        need_draw = true;
    }
}

