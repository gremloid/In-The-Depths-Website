extends Node2D

var avery_text = 'Gameplay systems developer\n\nAnimator of player animations\n\nIcon artist for swords, spellbooks, and potions\n\nUI developer\n\nDetails:\n\t*Created Shop UI\n\t*Created Potion/Sword/Spell Systems\n\t*Created Currency\n\t*Created Enemy/Boss System\n\t*Created Attack/Block Animations\n\t*Created Player Damage Over Time System\n\t*Created Inventory\n\t*Created Item Selling System\n\t*Created Admin Console'
var tomas_text = 'Gameplay systems developer\n\nLore master\n\nIcon artist for items\n\nDetails:\n\t*Created Settings\n\t*Created Player Choices System\n\t*Created Items System\n\t*Created Story\n\t*Created Item Synergy System\n\t*Created Enemy Scaling\n\t*Reformated Files'
var jacob_text = 'Gameplay systems developer\n\nBackground artist\n\nMenu artist\n\nEnemy artist\n\nIcon artist for potions and spellbooks\n\nDetails:\n\t*Created Enemy Sprits/Animation\n\t*Created Saving System\n\t*Created Menu Art\n\t*Created NPC Art/Dialogue\n\t*Created Enemy Sound System'
var dalton_text = 'Enemy artist\n\nDetails:\n\t*Created Enemy Sprites'
 
var text_array = [avery_text, tomas_text, jacob_text, dalton_text]
var names_array = ['Avery Johnson', 'Tomas Urena', 'Jacob Muller', 'Dalton Washam']

func _ready():
	$Name.text = '[outline_size=3]' + names_array[0] + '[/outline_size]'
	$Roles.text = avery_text

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
