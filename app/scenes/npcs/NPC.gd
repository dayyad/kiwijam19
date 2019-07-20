

extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#var kinematic_body : KinematicBody2D;
var step_limit = 100;
var steps_taken = 1000;

#A copy of the original sneeze stats
var original_disease : Dictionary
#Tracks the status of the diseas local to this.
var disease : Dictionary

var move_speed = 3;
var direction_moving = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	#Randomise the limit off steps to make it look a little more natural.TYPE_VECTOR2
	step_limit = rand_range(150,180);
	#connect("sneeze_hit", self, "_sneeze_hit");
	#kinematic_body = $KinematicBody2D;
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	steps_taken = steps_taken + 1;

	_check_disease(delta);
	_take_steps();
	_animate();
	pass

#Move the player and track what direction it should go in
func _take_steps():
	if steps_taken >= step_limit:
		steps_taken = 0;
		direction_moving = Vector2(rand_range(-move_speed,move_speed),rand_range(-move_speed,move_speed));
	
	move_and_collide(direction_moving);
	pass

#Deals with all the edge cases for animating this character
func _animate():
	#If we are not infected stay the same.
	if disease.size() == 0: 	
		$AnimatedSprite.play("walk_right");
		$AnimatedSprite.flip_h = false;
	
		if direction_moving.x <= 0:
			$AnimatedSprite.flip_h = true;
			pass
	    
		if direction_moving.x == 0 && direction_moving.y == 0:
			$AnimatedSprite.play("resting");
			pass
		pass
		
	#Draw the person as infected.
	if disease.size() > 0:
		$AnimatedSprite.modulate = Color("8ac973")
		pass
		

#Called when this nodes collider is sneezed on.
func _sneeze_hit(dict : Dictionary):

	#Only make sick if not already been sick.
	if(original_disease.size() != 0):
		return

	print("person infected for first time")
	
	original_disease = _clone_disease_dict(dict)
	disease = _clone_disease_dict(dict)
	pass

var time_since_sneeze = 0;

#Checks how the disease is affecting the current individual and if its time to spread it.
func _check_disease(delta):

	if disease.size() == 0:
		return

	time_since_sneeze += delta;

	if time_since_sneeze >= disease.sneeze_delay && disease.sneezes_count > 0:
		print("we think its time");
		$Sneeze._emit(original_disease, direction_moving);
		disease.sneezes_count -= 1;
		time_since_sneeze = 0;
		pass

	#Count down the death timer and sneeze delay
	

	pass

func _clone_disease_dict(dict : Dictionary) -> Dictionary : 
	return {"sneezes_count" : dict.sneezes_count, "sneeze_delay" : dict.sneeze_delay, "deadly":dict.deadly, "death_delay": dict.death_delay};
