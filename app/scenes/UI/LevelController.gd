extends Node

class_name LevelController

#Tracks the progress to the end of this level.

#Overide this in extensions
var target_score = 100.0;
var current_score = 0.0;

var rect_starting_width;

var sneeze_ammo_prefab = load("res://scenes/UI/UISneezeAmmo.tscn"); 
var player;

func _ready():
	rect_starting_width = $InnerRect.rect_size.x;

	#Connect all NPC signals to this for the current level.
	var npcs = get_parent().get_node("NPCs").get_children();
	
	var player = get_parent().get_node("Player");

	for i in range(0, npcs.size()):
		var npc = npcs[i];
		npc.connect("infected", self, "_npc_infected");
		pass

	pass # Replace with function body.

func _process(delta):
	var completion_fraction = current_score / target_score;
	$InnerRect.rect_size.x = rect_starting_width * completion_fraction;

	_render_ammo();
	pass

#Draw the amount of sneezes left to the UI.
func _render_ammo():
 #i in range(0, player.disease.sneezes_count):

		#pass
	pass

#Called when someone infected.
func _npc_infected(score):
	current_score += score;
	pass