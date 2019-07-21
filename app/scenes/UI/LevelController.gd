extends Node

class_name LevelController

#Tracks the progress to the end of this level.

#Overide this in extensions
var target_score = 100.0;
var current_score = 0.0;

var rect_starting_width;

func _ready():
	rect_starting_width = $InnerRect.rect_size.x

	#Connect all NPC signals to this for the current level.
	var npcs = get_parent().get_node("NPCs").get_children();

	for i in range(0, npcs.size()):
		var npc = npcs[i];
		npc.connect("infected", self, "_npc_infected");
		pass

	pass # Replace with function body.

func _process(delta):
	var completion_fraction = current_score / target_score;
	$InnerRect.rect_size.x = rect_starting_width * completion_fraction;
	pass

#Called when someone infected.
func _npc_infected(score):
	current_score += score;
	pass