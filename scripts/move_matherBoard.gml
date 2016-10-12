/// move_matherBoard(oMatherBoard, dx: int, dy: int);

var mb = argument0;
var mx = argument1;
var my = argument2;

with (mb) {
    xx += mx;
    yy += my;
    if (xx < 0) {
        xx = abs(xx);
        xx = map_w - xx;
    } else if (xx >= map_w) {
        xx = xx mod map_w;
    }
    if (yy < 0) {
        yy = abs(yy);
        yy = map_h - yy;
    } else if (yy >= map_h) {
        yy = yy mod map_h;
    }
}

