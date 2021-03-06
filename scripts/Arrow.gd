extends Area2D

export var speed = 350
signal balloon_hit


var velocity:= Vector2.ZERO
var acceleration:= Vector2.ZERO


func start(_transform)-> void:
    global_transform = _transform
    velocity = transform.x * speed


func _physics_process(delta: float) -> void:
    velocity += acceleration * delta
    velocity = velocity.clamped(speed)
    rotation = velocity.angle()
    position += velocity * delta


func _on_Arrow_area_entered(area: Area2D) -> void:
    if area.is_in_group("Target"):
        area.destroy()
        emit_signal("balloon_hit")

    queue_free()
