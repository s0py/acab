extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var turn = 0
var town_name = 'CHAZ'

# Called when the node enters the scene tree for the first time.
func _ready():
	text = town_name + '   |   ' + 'TURN ' + str(turn)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
