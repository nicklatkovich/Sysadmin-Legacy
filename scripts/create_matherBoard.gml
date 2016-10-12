/// create_matherBoard(width: int, height: int, loop: bool);

global.mb_width  = argument0;
global.mb_height = argument1;
global.mb_loop   = argument2;

return instance_create(0, 0, oMatherBoard);

