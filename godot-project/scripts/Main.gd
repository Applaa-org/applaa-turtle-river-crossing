extends Node2D

@onready var turtle = $Turtle
@onready var ui_layer = $CanvasLayer
@onready var status_label = $CanvasLayer/StatusLabel
@onready var play_again_button = $CanvasLayer/PlayAgainButton

var game_started = false
var game_over = false
var won = false

func _ready():
	turtle.connect("game_over", Callable(self, "_on_game_over"))
	turtle.connect("win", Callable(self, "_on_win"))
	play_again_button.connect("pressed", Callable(self, "_on_play_again"))
	show_start_screen()

func _on_game_over():
	game_over = true
	status_label.text = "Game Over!"
	play_again_button.visible = true

func _on_win():
	won = true
	status_label.text = "You Win!"
	play_again_button.visible = true

func _on_play_again():
	get_tree().reload_current_scene()

func show_start_screen():
	status_label.text = "Turtle River Crossing\nUse Arrow Keys to move\nAvoid the logs!\nPress Space to Start"
	play_again_button.text = "Start Game"
	play_again_button.visible = true

func _input(event):
	if event.is_action_pressed("ui_accept") and not game_started:
		game_started = true
		status_label.text = ""
		play_again_button.visible = false