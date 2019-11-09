extends ItemList

# we don't want to list these
var ignore = ['graph_node.gd', 'start', 'default']

# path to our nodes
var node_path = "res://config/nodes/"
# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_nodes("res://config/nodes/"))

func get_nodes(path):
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin(true, true)

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file in ignore:
			var list_name = file + ' ' + 'node'
			
			# does the node have a screenshot?
			var screenshot = File.new()
			if screenshot.file_exists(node_path + file + '/' + 'screenshot.png'):
				self.add_item(list_name.capitalize(), load(node_path + file + '/' + 'screenshot.png'))
			else:
				self.add_item(list_name.capitalize())

	dir.list_dir_end()
