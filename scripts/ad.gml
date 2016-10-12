/// ad(s:num);

var state = argument0;

if (state % CELL_STRONG == 0) {
    state /= CELL_STRONG;
}

return global.ad_help[state];

