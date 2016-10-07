/// get_xdx(xx, d, w, loop: bool);

var xx =   argument0;
var d =    argument1;
var w =    argument2;
var loop = argument3;

var x1 = xx + dx(d);
if (loop) {
    if (x1 < 0) {
        x1 = w + x1;
    } else if (x1 >= w) {
        x1 = x1 mod w;
    }
}

return x1;

