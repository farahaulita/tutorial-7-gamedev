extends KinematicBody

export var speed = 10
export var crouch_speed = 5
export var sprint_speed = 15
export var acceleration = 5
export var gravity = 0.98
export var jump_power = 30
export var mouse_sensitivity = 0.3

onready var head = $Head
onready var camera = $Head/Camera

var velocity = Vector3()
var camera_x_rotation = 0

var crouch = 0
var sprint = 0


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		head.rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))

		var x_delta = event.relative.y * mouse_sensitivity
		if camera_x_rotation + x_delta > -90 and camera_x_rotation + x_delta < 90:
			camera.rotate_x(deg2rad(-x_delta))
			camera_x_rotation += x_delta

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	if Input.is_action_just_pressed("crouch"):
		$Head.scale.y = 0.7
		crouch = 1
	
	if Input.is_action_just_pressed("sprint"):
		sprint = 1
	
	if Input.is_action_just_released("crouch"):
		$Head.scale.y = 1
		crouch = 0
	if Input.is_action_just_released("sprint"):
		sprint = 0

func _physics_process(delta):
	var head_basis = head.get_global_transform().basis
	
	var movement_vector = Vector3()
	if Input.is_action_pressed("movement_forward"):
		movement_vector -= head_basis.z
	if Input.is_action_pressed("movement_backward"):
		movement_vector += head_basis.z
	if Input.is_action_pressed("movement_left"):
		movement_vector -= head_basis.x
	if Input.is_action_pressed("movement_right"):
		movement_vector += head_basis.x
	
	var current_speed = speed
	
	if Input.is_action_pressed("sprint") and !crouch:
		current_speed = sprint_speed
	elif crouch:
		current_speed = crouch_speed

	movement_vector = movement_vector.normalized()

	velocity = velocity.linear_interpolate(movement_vector * current_speed, acceleration * delta)
	velocity.y -= gravity

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y += jump_power

	velocity = move_and_slide(velocity, Vector3.UP)
