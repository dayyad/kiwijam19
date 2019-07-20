extends Node

class_name LevelController

#Tracks the progress to the end of this level.

#Overide this in extensions
var target_score = 100;
var current_score = 0;

var rect_starting_width;

func _ready():
	rect_starting_width = $InnerRect.rect_size.x
	pass # Replace with function body.

func _process(delta):
	var completion_fraction = current_score / target_score;
	$InnerRect.rect_size.x = rect_starting_width * completion_fraction;
	pass

