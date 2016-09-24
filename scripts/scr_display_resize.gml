/// scr_display_resize(dis_w, dis_h);

var new_dis_w = argument0;
var new_dis_h = argument1;

oAppSurf.dis_w = new_dis_w;
oAppSurf.dis_h = new_dis_h;
if (window_get_fullscreen() == false) {
    window_set_position(
        (display_get_width() - oAppSurf.dis_w) / 2,
        (display_get_height() - oAppSurf.dis_h) / 2);
    window_set_size(oAppSurf.dis_w, oAppSurf.dis_h);
}

view_wview[0] = oAppSurf.dis_w;
view_hview[0] = oAppSurf.dis_h;
view_wport[0] = oAppSurf.dis_w;
view_hport[0] = oAppSurf.dis_h;
surface_resize(application_surface, oAppSurf.dis_w, oAppSurf.dis_h);

