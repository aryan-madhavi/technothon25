array_size = 20;
for (_i = array_size-1; _i >= 0; _i--) {
	pos_x[_i] = x;
	pos_y[_i] = y;	
}

var _ai = instance_create_layer(x,y,"Instances",obj_ai);
_ai.record = array_size-1;