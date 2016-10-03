/// Only for oWay class

line_length = oGame.line_length;
var line_width = line_length / 8;

if (surface_exists(surf)) {
    surface_free(surf);
}
surf = surface_create(line_length * 2, line_length * 2);

surface_set_target(surf);
if (state == CROSS_CELL) {
    var xy = line_length - oGame.half_cell_size;
    draw_sprite_stretched(sHub, 0, xy, xy, oGame.cell_size, oGame.cell_size);
    depth = DEPTH_CROSS;
} else {
    draw_set_color(c_green);
    for (var d = 0; d < 4; d++) {
        if (state % ds(d) == 0) {
            draw_line_width(line_length, line_length, (dx(d) + 1) * line_length, (dy(d) + 1) * line_length, line_width);
        }
    }
    if (dl(state) == 1) {
        var xy = line_length - oGame.half_cell_size;
        draw_sprite_stretched(sComp, 0, xy, xy, oGame.cell_size, oGame.cell_size);
    }
}
surface_reset_target();

