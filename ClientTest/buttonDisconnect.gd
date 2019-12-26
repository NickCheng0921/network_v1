extends Button

func _onbuttonDisconnect_pressed():
	get_tree().set_network_peer(null) 
