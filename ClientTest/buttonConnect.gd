extends Button

#same create client as before, loopback ip address
func _on_buttonConnect_pressed():
	var network = NetworkedMultiplayerENet.new()
	network.create_client("127.0.0.1", 4242)
	get_tree().set_network_peer(network)

