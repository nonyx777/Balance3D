extends CharacterBody3D

func _physics_process(delta: float):
	if Input.is_action_pressed("up"):
		var new_rotation = transform.rotated(Vector3.RIGHT, -0.05)
		transform = new_rotation
	if Input.is_action_pressed("down"):
		var new_rotation = transform.rotated(Vector3.RIGHT, 0.05)
		transform = new_rotation
	if Input.is_action_pressed("left"):
		var new_rotation = transform.rotated(Vector3.FORWARD, 0.05)
		transform = new_rotation
	if Input.is_action_pressed("right"):
		var new_rotation = transform.rotated(Vector3.FORWARD, -0.05)
		transform = new_rotation
