

extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#var kinematic_body : KinematicBody2D;

# Called when the node enters the scene tree for the first time.
func _ready():
	#kinematic_body = $KinematicBody2D;
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):


	var rel_move = Vector2(0.4,0.4);
	#kinematic_body.move_and_collide(rel_move);
	move_and_collide(rel_move);
	pass
