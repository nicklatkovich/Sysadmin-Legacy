/// dl(n);

var n = argument0;

var result = 0;
for (var d = 0; d < 4; d++) {
    if (n % ds(d) == 0) {
        result++;
    }
}
return result;

