/// rotate_state(state: int, steps: int);

var state_r = argument0;
var steps_r = argument1;

var result = 1;

for (var d = 0; d < 4; d++) {
    if (state_r % ds(d) == 0) {
        result *= ds(d + steps_r);
    }
}

if (state_r % CELL_STRONG == 0) {
    result *= CELL_STRONG;
}

return result;

