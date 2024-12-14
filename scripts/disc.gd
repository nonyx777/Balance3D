extends CharacterBody3D
@onready var ball: RigidBody3D = $"../Ball"
@onready var collision_shape_3d: CollisionShape3D = $CollisionShape3D
@export var max_angle: float = PI/6
@export var snappiness: float = 1

var new_transform = Transform3D()
var position_tobe = Vector3()

func _physics_process(delta: float):
	position_tobe = ball.position + ball.linear_velocity
	
	var disc_ball: Vector3 = position_tobe - position
	var length: float = disc_ball.length()
	var disc_ball_norm: Vector3 = disc_ball.normalized()
	var rotation_axis: Vector3 = transform.basis.y.normalized().cross(disc_ball_norm)
	
	if rotation_axis == Vector3.ZERO:
		return
	
	var desired_rotation = Basis(rotation_axis.normalized(), -max_angle * length / collision_shape_3d.shape.radius)
	new_transform = transform
	new_transform.basis = new_transform.basis.slerp(desired_rotation, snappiness * delta)
	transform = new_transform
