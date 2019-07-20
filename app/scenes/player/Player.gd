extends KinematicBody2D

var sneeze : Sneeze;

var move_speed = 5;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):

    var move_vect = Vector2(0,0)
    
    if Input.is_action_pressed("ui_right"):
        move_vect.x = move_speed;
        pass

    if Input.is_action_pressed("ui_left"):
        move_vect.x = -move_speed;
        pass

    if Input.is_action_pressed("ui_up"):
        move_vect.y = -move_speed;
        pass

    if Input.is_action_pressed("ui_down"):
        move_vect.y = move_speed;
        pass

    if Input.is_action_pressed("ui_select"):
        _do_sneeze();
        pass

    move_and_collide(move_vect);

    pass

#Create a sneeze from this position if possible.
func _do_sneeze():

    pass