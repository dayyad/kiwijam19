

extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#var kinematic_body : KinematicBody2D;
var step_limit = 100;
var steps_taken = 1000 ;

var sickness : Dictionary

var move_speed = 3;
var direction_moving = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	#Randomise the limit off steps to make it look a little more natural.TYPE_VECTOR2
	step_limit = rand_range(150,180);
	#connect("sneeze_hit", self, "_sneeze_hit");
	#kinematic_body = $KinematicBody2D;
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	steps_taken = steps_taken + 1;

	_take_steps();
	_animate();
	pass
	

func _take_steps():
	if steps_taken >= step_limit:
		steps_taken = 0;
		direction_moving = Vector2(rand_range(-move_speed,move_speed),rand_range(-move_speed,move_speed));
	
	move_and_collide(direction_moving);
	pass

#Deals with all the edge cases for animating this character
func _animate():
	#Manage the movement
	$AnimatedSprite.play("walk_right");
	$AnimatedSprite.flip_h = false;

	if direction_moving.x <= 0:
		$AnimatedSprite.flip_h = true;
		pass
    
	if direction_moving.x == 0 && direction_moving.y == 0:
		$AnimatedSprite.play("resting");
		pass
		
	pass

#Called when this nodes collider is sneezed on.
func _sneeze_hit(dict : Dictionary):
	print(dict)
	sickness = dict
	pass