extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var map_l = 10
var map_w = 10
var mainmap = [0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 
3, 4, 4, 5, 5, 6, 6, 7, 10, 10, 10, 11, 11, 11, 12, 12, 12, 12, 12, 12, 12, 12, 
12, 12, 14, 14, 14, 14, 14, 15, 15, 15, 15, 15, 16, 16, 16, 16, 16, 17, 17, 17, 
17, 17, 18, 18, 18, 18, 18, 19, 19, 19, 19, 19, 20, 20, 20, 20, 20, 21, 21, 21, 
21, 21, 22, 22, 22, 22, 22, 23, 23, 23, 24, 24, 24, 25, 25, 25]

var last_names = ['Marx', 'Engels', 'Luxemburg', 'Kropotkin', 'Bakunin', 'Chomsky', 'Bookchin', 'Goldman', 'Berkman']
var first_names = ['Alice', 'Bob', 'Charlie', 'Donna', 'Eve', 'Faythe', 'Grey', 
'Hogarth', 'Isaac', 'Julliet', 'Klaus', 'Lionel', 'Mango', 'Nex', 'Oscar', 
'Penelope', 'Romeo', 'Quinn', 'Romeo', 'Sunny', 'Tyler', 'Ursula', 'Violet', 
'Xavier', 'Yoshi', 'Zed', 'Karl', 'Freidrich', 'Rosa', 'Peter', 'Noam', 'Murray']
var citizens = []
var starting_set = ['Leader', 'Gatherer', 'Soldier', 'Soldier']
var owned = {"field": 0,
			"farm": 0,
			"apartment": 0,
			"chaz": 0,
			"5g": 0,
			"gunstore": 0,
			"coop": 0,
			"bar": 0,
			"barstucks": 0,
			"donuts": 0,
			"npc": 0,
			"church": 0,
			"mapple": 0,
			"anonazon": 0,
			"office": 0}
var tiles_owned = []
var starting_location_l = 0
var starting_location_w = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()	
	mainmap = shuffle_list(mainmap)
	var curr_l = 0
	var curr_w = 0
	for item in mainmap:
		if item == 7:
			starting_location_l = curr_l
			starting_location_w = curr_w
		if curr_l > map_l - 1:
			curr_l = 0
			curr_w += 1
			set_cell(curr_l, curr_w, item)
		else:
			set_cell(curr_l, curr_w, item)
		curr_l += 1
		#find the chaz tile
		#update the location of all of the citizens to start the game
	
	# this generates the array of citizens. it gives each a name, job, and location
	for initial_citizen in starting_set:
		var poe_first_name = first_names[randi() % first_names.size()]
		var poe_last_name = last_names[randi() % last_names.size()]
		var poe_job = initial_citizen
		var poe_dict = {"first": poe_first_name, "last": poe_last_name, 
		"job": poe_job, "location_l": starting_location_l, "location_w":starting_location_w}
		citizens.append(poe_dict)
	print(citizens)
		
func shuffle_list(list):
	var shuffledList = [] 
	var indexList = range(list.size())
	for i in range(list.size()):
		var x = randi()%indexList.size()
		shuffledList.append(list[indexList[x]])
		indexList.remove(x)
	return shuffledList

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		print(get_cellv(world_to_map(event.global_position)))
		print(event.global_position)
		print(world_to_map(event.global_position))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
