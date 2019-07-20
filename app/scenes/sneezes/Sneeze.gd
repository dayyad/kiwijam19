extends Particles2D

class_name Sneeze
	

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var description = "A basic sneeze";
var angle : float;
var distance : float;

signal sneeze_hit(sneeze_info);

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	#if Input.is_action_pressed("ui_select"):
	#	restart();
	#	emitting = true;
	#	pass
	pass

#Emits this sneeze in the given direction.
func _emit(direction : Vector2):
	rotation_degrees = 180
	
	if direction.x > 0:
		rotation_degrees = 0

	restart();
	emitting = true;

	_check_sneeze_collisions();
	pass

#Checks if this sneeze has hit anything.
func _check_sneeze_collisions():

	var collided_areas = $Area2D.get_overlapping_areas();
	
	print(collided_areas)
	
	if collided_areas.size() > 0:
		for i in range(0, collided_areas.size()) :
			var area = collided_areas[i];
			if area is NPCSneezeCollider :
				#Pass the sneeze on the the target
				area._sneeze_hit(_clone_dict());
				#print("sneezing on someone");
			pass
		pass
	pass

#Returns a dictionary holding the data that represents this object
func _clone_dict():
	var dict = {"description": description};
	return dict;  