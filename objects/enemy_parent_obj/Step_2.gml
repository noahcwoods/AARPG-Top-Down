if (hp <= 0) {
    var _smoke_obj = instance_create_layer(x, y, "Instances", destroy_smoke_obj);
    _smoke_obj.image_angle = random_range(-5, 500);
    instance_destroy();
}