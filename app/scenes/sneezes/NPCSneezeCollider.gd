extends Area2D

class_name NPCSneezeCollider

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

#Caused when the area overlaps with a sneeze.
func _sneezed_on():
    print("ive been sneezed on!!!");
    pass