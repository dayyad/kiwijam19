extends Area2D

class_name NPCSneezeCollider

#var Sneeze = preload("res://scenes/sneezes/BasicSneeze.tscn");

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

#Caused when the area overlaps with a sneeze.
func _sneeze_hit(dict : Dictionary):
	get_parent()._sneeze_hit(dict);
	pass