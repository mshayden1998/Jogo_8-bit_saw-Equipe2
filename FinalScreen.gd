extends Control


func _process(delta):
	if Input.is_action_just_pressed("ui_language"):
		if TranslationServer.get_locale() == "en":
			TranslationServer.set_locale("pt")
		else:
			TranslationServer.set_locale("en")


func _on_BtnExit_button_up():
	get_tree().quit()


func _on_BtnRestart_button_up():
	get_tree().change_scene("res://Main.tscn")


func _on_FinalScreen_ready():
	$LabelFinalMsn.visible = false


func _on_VideoPlayer_finished():
	$LabelFinalMsn.visible = true
	$AnimationPlayer.play("labels_fade_in")
	$VideoPlayer.queue_free()
