/// Only for oGame class

if (surface_exists(map_surf)) {
    surface_free(map_surf);
}
map_surf = surface_create(map_width * cell_size, map_height * cell_size);

