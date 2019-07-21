

extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#var kinematic_body : KinematicBody2D;
var seconds_walk_limit = 2;
var time_walked_for = 1000;

#A copy of the original sneeze stats
var original_disease : Dictionary
#Tracks the status of the diseas local to this.
var disease : Dictionary

var move_speed = 200;
var direction_moving = Vector2(0,0)

signal infected(score);

# Called when the node enters the scene tree for the first time.
func _ready():
	#Randomise the limit off steps to make it look a little more natural.TYPE_VECTOR2
 seconds_walk_limit = rand_range(0.9, 1.1) * seconds_walk_limit;
	#connect("sneeze_hit", self, "_sneeze_hit");
	#kinematic_body = $KinematicBody2D;
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_walked_for = time_walked_for + delta;

	_check_disease(delta);
	_take_steps(delta);
	_animate();
	pass

#Move the player and track what direction it should go in
func _take_steps(delta):
	if time_walked_for >= seconds_walk_limit:
		time_walked_for = 0;
		direction_moving = Vector2(rand_range(-move_speed,move_speed),rand_range(-move_speed,move_speed));
	
	#Scale speed and direction by the delta
	move_and_collide(Vector2(direction_moving.x * delta, direction_moving.y * delta));
	pass

#Deals with all the edge cases for animating this character
func _animate():
	#Rotate the sneeze collider with us
	$Sneeze.rotation_degrees = 180
	if direction_moving.x > 0:
		$Sneeze.rotation_degrees = 0
        	
	$AnimatedSprite.play("walk_right");
	$AnimatedSprite.flip_h = false;

	if direction_moving.x <= 0:
		$AnimatedSprite.flip_h = true;
		pass
	
	if direction_moving.x == 0 && direction_moving.y == 0:
		$AnimatedSprite.play("resting");
		pass
	pass
		
	#Draw the person as infected if infected.
	if disease.size() > 0:
		$AnimatedSprite.modulate = Color("8ac973")

		#If they have sneezes left then make them slightly darker.
		if disease.sneezes_count > 0 :
			$AnimatedSprite.modulate = Color("48b320")
			pass


#Called when this nodes collider is sneezed on.
func _sneeze_hit(dict : Dictionary):

	#Only make sick if not already been sick.
	if(original_disease.size() != 0):
		return

	print("person infected for first time")
	
	original_disease = _clone_disease_dict(dict)
	disease = _clone_disease_dict(dict)

	emit_signal("infected", 10);
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
