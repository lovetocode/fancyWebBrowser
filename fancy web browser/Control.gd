extends Control

@onready var http_request = $HTTPRequest
@onready var rich_text_label = $RichTextLabel
@onready var address_bar_line_edit = $HBoxContainer/AddressBarLineEdit


func _ready():
	var default_url = "https://news.ycombinator.com/"
	address_bar_line_edit.text = default_url
	http_request.request(default_url)
	

func _on_http_request_request_completed(result, response_code, headers, body):
	var html = body.get_string_from_utf8()
	rich_text_label.text = innterHTML("body", html)
	DisplayServer.window_set_title(innterHTML("title", html))
	


func _on_go_button_pressed():
	http_request.request(address_bar_line_edit.text)
	
func innterHTML(tag, html, default=""):
	var regex = RegEx.new()
	regex.compile("<" + tag + ">(.|\n)*?</" + tag + ">")
	var result = regex.search(html)
	if result:
		return result.get_string().replace("<" + tag + ">", '').replace("</" + tag + ">", '')
	return default 
	
	
	

