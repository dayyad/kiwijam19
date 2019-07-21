extends KinematicBody2D

var sneeze : Sneeze;

var move_speed = 350;
var move_vect = Vector2(0,0);

var sneeze_cooldown = 1;
var time_since_sneeze = 0;

#Original copy and local copy of disease info.
var original_disease = {"sneezes_count" : 3, "sneeze_delay" : 2, "deadly":false, "death_delay": 500}
var disease = {"sneezes_count" : 3, "sneeze_delay" : 2, "deadly":false, "death_delay": 500}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
    _manage_disease(delta);
    _check_input(delta);
    _animate();
    move_and_collide(move_vect);
    pass

#Track the amount of sneezes the player has left and the cooldown between them
func _manage_disease(delta):
    time_since_sneeze += delta;
    pass

#Changes the players movement depending on input pressed also checks if player wants to sneeze
func _check_input(delta):
    move_vect = Vector2(0,0)
    if Input.is_action_pressed("ui_right"):
        move_vect.x = move_speed * delta;
        pass

    if Input.is_action_pressed("ui_left"):
        move_vect.x = -move_speed * delta;
        pass

    if Input.is_action_pressed("ui_up"):
        move_vect.y = -move_speed * delta;
        pass

    if Input.is_action_pressed("ui_down"):
        move_vect.y = move_speed * delta;
        pass

    if Input.is_action_pressed("ui_select"):
        _do_sneeze();
        pass
    pass

#Manage the players direction and animation related to the direction they are currently moving.
func _animate():
    #Rotate the sneeze manager with us.
    $Sneeze.rotation_degrees = 180
    if move_vect.x > 0:
        $Sneeze.rotation_degrees = 0
        
    $AnimatedSprite.play("walk_right");
    $AnimatedSprite.flip_h = false;

    if move_vect.x <= 0:
        $AnimatedSprite.flip_h = true;
        pass
    
    if move_vect.x == 0 && move_vect.y == 0:
        $AnimatedSprite.play("resting");
        pass
    pass

#Create a sneeze from this position if possible.
func _do_sneeze():

    print(time_since_sneeze)

    if time_since_sneeze < sneeze_cooldown:
        return

    if disease.sneezes_count <= 0:
        return

    #Check which way the player is facing before doing the sneeze
    $Sneeze._emit({"sneezes_count" : original_disease.sneezes_count, "sneeze_delay" : original_disease.sneeze_delay, "deadly":original_disease.deadly, "death_delay": original_disease.death_delay}, move_vect);
    disease.sneezes_count -= 1;
    time_since_sneeze = 0;
    pass