extends Node

var next_music: AudioStream setget set_next_music

var _play_backwards := false

onready var _anim_player := $AnimationPlayer
onready var _track_1 := $Track
onready var _track_2 := $Track2
onready var _next_track := _track_2


func crossfade() -> void:
	_next_track.play()
	if not _play_backwards:
		_anim_player.play("Crossfade")
		_next_track = _track_1
	else:
		_anim_player.play_backwards("Crossfade")
		_next_track = _track_2
	_play_backwards = not _play_backwards


func set_next_music(audio_stream: AudioStream) -> void:
	next_music = audio_stream
	_next_track.stream = next_music
