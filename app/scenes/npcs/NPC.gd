

extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#var kinematic_body : KinematicBody2D;
var step_limit = 100;
var steps_taken = 1000 ;

var move_speed = 3;

var direction_moving = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	#Randomise the limit off steps to make it look a little more natural.TYPE_VECTOR2
	step_limit = rand_range(150,180);

	#kinematic_body = $KinematicBody2D;
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	steps_taken = steps_taken + 1;

	if steps_taken >= step_limit:
		steps_taken = 0;
		direction_moving = Vector2(rand_range(-move_speed,move_speed),rand_range(-move_speed,move_speed));

	#Manage the movement
	if direction_moving.x > 0:
		$AnimatedSprite.play("walk_right");
		pass
		
	if direction_moving.x <= 0:
		$AnimatedSprite.play("walk_left");
		pass
    
	if direction_moving.x == 0 && direction_moving.y == 0:
		$AnimatedSprite.play("resting");
		pass
		
	#kinematic_body.move_and_collide(rel_move);
	move_and_collide(direction_moving);
	pass
