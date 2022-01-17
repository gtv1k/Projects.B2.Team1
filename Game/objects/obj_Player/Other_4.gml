if(instance_exists(obj_data_carrier)){
targetEnter=obj_data_carrier.targetEnter;
state=obj_data_carrier.bruhstate;
instance_destroy(obj_data_carrier);
if(instance_exists(targetEnter)){
x=targetEnter.x;
y=targetEnter.y;

}

}