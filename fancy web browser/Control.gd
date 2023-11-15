extends Control

@onready var http_request = $HTTPRequest
@onready var rich_text_label = $RichTextLabel
@onready var address_bar_line_edit = $HBoxContainer/AddressBarLineEdit


func _ready():
	http_request.request("https://godotengine.org/")
	

func _on_http_request_request_completed(result, response_code, headers, body):
	rich_text_label.text = body.get_string_from_utf8()


func _on_go_button_pressed():
	http_request.request(address_bar_line_edit.text)
	

