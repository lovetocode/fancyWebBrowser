extends Control

@onready var http_request = $HTTPRequest
@onready var rich_text_label = $RichTextLabel


func _ready():
	http_request.request("https://godotengine.org/")
	

func _on_http_request_request_completed(result, response_code, headers, body):
	rich_text_label.text = body.get_string_from_utf8()
