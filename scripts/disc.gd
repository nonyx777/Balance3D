extends CharacterBody3D
@onready var ball: RigidBody3D = $"../Ball"
@onready var collision_shape_3d: CollisionShape3D = $CollisionShape3D
@export var theta: float = PI/3
var new_transform = Transform3D()

func _physics_process(_delta: float):
	var disc_ball: Vector3 = ball.position - position
	var length: float = disc_ball.length()
	var disc_ball_norm: Vector3 = disc_ball.normalized()
	var rotation_axis: Vector3 = transform.basis.y.normalized().cross(disc_ball_norm)
	
	if rotation_axis == Vector3.ZERO:
		return
	
	var desired_rotation = Basis(rotation_axis.normalized(), -theta * length / collision_shape_3d.shape.radius)
	new_transform = transform
	new_transform.basis = desired_rotation
	transform = new_transform
