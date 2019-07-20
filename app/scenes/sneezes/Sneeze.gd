extends Particles2D

class_name Sneeze
	

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var angle : float;
var distance : float;



# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	#if Input.is_action_pressed("ui_select"):
	#	restart();
	#	emitting = true;
	#	pass
	pass

#Emits this sneeze in the given direction.
func _emit(direction : Vector2):
	rotation_degrees = 180;
	
	if direction.x > 0:
		rotation_degrees = 0;

	restart();
	emitting = true;
	pass