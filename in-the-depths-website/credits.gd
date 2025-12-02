extends Node2D

var avery_text = 'Gameplay systems developer\n\nAnimator of player animations\n\nIcon artist for swords, spellbooks, and potions\n\nUI developer'
var tomas_text = 'Gameplay systems developer\n\nLore master\n\nIcon artist for items'
var jacob_text = 'Gameplay systems developer\n\nBackground artist\n\nMenu artist\n\nEnemy artist\n\nIcon artist for potions and spellbooks'
var dalton_text = 'Enemy artist'

var text_array = [avery_text, tomas_text, jacob_text, dalton_text]
var names_array = ['Avery Johnson', 'Tomas Urena', 'Jacob Muller', 'Dalton Washam']

var current_index = 0

func next_pressed() -> void:
	if current_index == 3:
		current_index = 0
	else:
		current_index += 1
	$Name.text = '[outline_size=3]' + names_array[current_index] + '[/outline_size]'
	$Roles.text = text_array[current_index]

func previous_pressed() -> void:
	if current_index == 0:
		current_index = 3
	else:
		current_index -= 1
	$Name.text = '[outline_size=3]' + names_array[current_index] + '[/outline_size]'
	$Roles.text = text_array[current_index]
