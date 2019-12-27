extends Node2D

func _ready():
	var network = NetworkedMultiplayerENet.new()
	network.create_client("127.0.0.1", 4242)
	get_tree().set_network_peer(network)
	#handles connection failed
	network.connect("connection_failed", self, "_on_connection_failed")
	#when peer packets arrive, call packet received function
	get_tree().multiplayer.connect("network_peer_packet",self, "_on_packet_received")
	
func _on_connection_failed(error):
	$labelStatus.text = "Error connecting to server " + error
	
func _on_packet_received(id,packet):
	#when packets come in, print contents to client label
	$labelServerData.text = packet.get_string_from_ascii()