extends Particles2D

class_name Sneeze
	

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var description = "A basic sneeze";
var angle : float;
var distance : float;

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
func _emit(sneeze_details : Dictionary, direction : Vector2):
	restart();
	emitting = true;
	_check_sneeze_collisions(sneeze_details);
	pass

#Checks if this sneeze has hit anything.
func _check_sneeze_collisions(sneeze_details):

	var collided_areas = $Area2D.get_overlapping_areas();
	
	#print(collided_areas)
	
	if collided_areas.size() > 0:
		for i in range(0, collided_areas.size()) :
			var area = collided_areas[i];
			if area is NPCSneezeCollider :
				#Pass the sneeze on the the target
				area._sneeze_hit(sneeze_details);
				#print("sneezing on someone");
			pass
		pass
	pass

#Returns a dictionary holding the data that represents this object
func _clone_dict():
	var dict = {"description": description};
	return dict;  