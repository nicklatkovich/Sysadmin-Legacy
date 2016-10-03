/// Only for oGame class

if (surface_exists(map_surf)) {
    surface_free(map_surf);
}
map_surf = surface_create(map_width * cell_size, map_height * cell_size);
with (oWay) {
    wayDraw();
}
var dddy = line_length;
surface_set_target(oGame.map_surf);
with (oWay) {
    draw_surface(surf, x - dddy, y - dddy);
}
surface_reset_target();

