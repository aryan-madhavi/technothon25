/// @description Destroy instances
instance_destroy(creator.area);
creator.area = noone;
instance_destroy();
creator.my_dialog = noone;
creator.prompt = "Press T to Talk";