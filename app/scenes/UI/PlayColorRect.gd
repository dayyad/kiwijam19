extends ColorRect

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_PlayButton_mouse_entered():
	color = Color("#576f79e5")
	pass # Replace with function body.


func _on_PlayButton_mouse_exited():
	color = Color("#57ffffff")
	pass # Replace with function body.
