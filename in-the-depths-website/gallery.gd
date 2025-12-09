extends Node2D

var current_weapon_attack_animation = 'None'
var current_weapon_block_animation = 'None'
var current_arms_attack_animation = 'Punch'
var current_arms_block_animation = 'None'
var current_spell_animation = 'None'
#None, Sword, Spell
var animation_class = 'Sword'
#Attack, Block
var animation_type = 'Attack'

var current_spell = 'None'
var current_sword = 'None'
var current_item = []
var current_synergy = []

func _process(delta: float) -> void:
	if current_sword != 'None' and $SwordsButton.disabled == true:
		$TypeButton.disabled = false
	else:
		$TypeButton.disabled = true

func _ready():
	$SwordsButton.disabled = true
	$PlayButton.modulate = 'WHITE'

func _on_spells_button_pressed() -> void:
	animation_class = 'Spell'
	$SwordsContainer.visible = false
	$EnemiesContainer.visible = false
	$SpellsContainer.visible = true
	$ItemsContainer.visible = false
	$SpellsButton.disabled = true
	$SwordsButton.disabled = false
	$EnemiesButton.disabled = false
	$ItemsButton.disabled = false
	$PlayButton.visible = true
	$TypeButton.visible = true
	$ScrollContainer/CurrentLabel.visible = true
	$ScrollContainer/CurrentLabel.text = 'Current Spell: ' + str(current_spell)

func _on_swords_button_pressed() -> void:
	animation_class = 'Sword'
	$EnemiesContainer.visible = false
	$SpellsContainer.visible = false
	$SwordsContainer.visible = true
	$ItemsContainer.visible = false
	$SwordsButton.disabled = true
	$SpellsButton.disabled = false
	$EnemiesButton.disabled = false
	$ItemsButton.disabled = false
	$PlayButton.visible = true
	$TypeButton.visible = true
	$ScrollContainer/CurrentLabel.visible = true
	$ScrollContainer/CurrentLabel.text = 'Current Sword: ' + str(current_sword)

func _on_enemies_button_pressed() -> void:
	animation_class = 'None'
	$SwordsContainer.visible = false
	$SpellsContainer.visible = false
	$EnemiesContainer.visible = true
	$ItemsContainer.visible = false
	$SwordsButton.disabled = false
	$SpellsButton.disabled = false
	$EnemiesButton.disabled = true
	$ItemsButton.disabled = false
	$PlayButton.visible = true
	$TypeButton.visible = true
	$ScrollContainer/CurrentLabel.visible = false
	
func _on_play_button_pressed() -> void:
	if (animation_class == 'Sword' and current_sword == 'None') or (animation_class == 'Spell' and current_spell == 'None'):
		$PlayerAnimations/PlayerArms.play('punch')
		await $PlayerAnimations/PlayerArms.animation_looped
		$PlayerAnimations/PlayerArms.stop()
	elif animation_class == 'Sword' and animation_type == 'Attack':
		$PlayerAnimations/PlayerArms.play(current_arms_attack_animation)
		$PlayerAnimations/PlayerSword.play(current_weapon_attack_animation)
		await $PlayerAnimations/PlayerArms.animation_looped
		$PlayerAnimations/PlayerSword.stop()
		$PlayerAnimations/PlayerArms.stop()
	elif animation_class == 'Sword' and animation_type == 'Block':
		$PlayerAnimations/PlayerArms.play(current_arms_block_animation)
		$PlayerAnimations/PlayerSword.play(current_weapon_block_animation)
		await $PlayerAnimations/PlayerArms.animation_looped
		$PlayerAnimations/PlayerArms.stop()
		$PlayerAnimations/PlayerSword.stop()
	elif animation_class == 'Spell':
		$PlayerAnimations/PlayerSpell.play(current_spell_animation)
		await $PlayerAnimations/PlayerSpell.animation_looped
		$PlayerAnimations/PlayerSpell.stop()

func set_text(text):
	if animation_class == 'Spell':
		$ScrollContainer/CurrentLabel.text = 'Current Spell: ' + str(text)
	else:
		$ScrollContainer/CurrentLabel.text = 'Current Sword: ' + str(text)

func _on_type_button_pressed() -> void:
	if animation_type == 'Attack':
		animation_type = 'Block' 
		$TypeButton.text = 'Block'
	else:
		animation_type = 'Attack'
		$TypeButton.text = 'Attack'

func display_enemy(enemy_name, animation_name):
	if enemy_name == 'Thief':
		$EnemyDisplay/AnimatedSprite2D.scale.x = 2.5
		$EnemyDisplay/AnimatedSprite2D.scale.y = 2.5
	else:
		$EnemyDisplay/AnimatedSprite2D.scale.x = 4
		$EnemyDisplay/AnimatedSprite2D.scale.y = 4
	var timer = Timer.new()
	timer.wait_time = 1
	add_child(timer)
	$EnemyDisplay/AnimatedSprite2D.animation = animation_name
	$EnemyDisplay/RichTextLabel.text = '[outline_size=5]' + enemy_name + '[/outline_size]'
	$EnemyDisplay.visible = true
	while $EnemyDisplay.visible:
		$EnemyDisplay/AnimatedSprite2D.play()
		await $EnemyDisplay/AnimatedSprite2D.animation_looped
		$EnemyDisplay/AnimatedSprite2D.stop()
		timer.start()
		await timer.timeout

func _on_wooden_sword_button_pressed() -> void:
	current_sword = 'Wooden Sword'
	animation_class = 'Sword'
	current_weapon_attack_animation = 'wooden_sword_attack'
	current_arms_attack_animation = 'sword_swing'
	current_weapon_block_animation = 'wooden_sword_block'
	current_arms_block_animation = 'sword_block'
	set_text('Wooden Sword')

func _on_wooden_axe_button_pressed() -> void:
	current_sword = 'Wooden Axe'
	current_weapon_attack_animation = 'wooden_axe_attack'
	current_arms_attack_animation = 'axe_swing'
	current_weapon_block_animation = 'wooden_axe_block'
	current_arms_block_animation = 'axe_block'
	set_text('Wooden Axe')

func _on_leaf_blade_button_pressed() -> void:
	current_sword = 'Leaf Blade'
	current_weapon_attack_animation = 'leaf_blade_attack'
	current_arms_attack_animation = 'sword_swing'
	current_weapon_block_animation = 'leaf_blade_block'
	current_arms_block_animation = 'sword_block'
	set_text('Leaf Blade')

func _on_fire_sword_button_pressed() -> void:
	current_sword = 'Flame Sword'
	current_weapon_attack_animation = 'flame_sword_attack'
	current_arms_attack_animation = 'sword_swing'
	current_weapon_block_animation = 'flame_sword_block'
	current_arms_block_animation = 'sword_block'
	set_text('Flame Sword')

func _on_poison_sword_button_pressed() -> void:
	current_sword = 'Poison Sword'
	current_weapon_attack_animation = 'poison_sword_attack'
	current_arms_attack_animation = 'sword_swing'
	current_weapon_block_animation = 'poison_sword_block'
	current_arms_block_animation = 'sword_block'
	set_text('Poison Sword')

func _on_lightning_sword_button_pressed() -> void:
	current_sword = 'Lightning Sword'
	current_weapon_attack_animation = 'lightning_sword_attack'
	current_arms_attack_animation = 'sword_swing'
	current_weapon_block_animation = 'lightning_sword_block'
	current_arms_block_animation = 'sword_block'
	set_text('Lightning Sword')

func _on_slime_sword_button_pressed() -> void:
	current_sword = 'Slime Sword'
	current_weapon_attack_animation = 'slime_sword_attack'
	current_arms_attack_animation = 'sword_swing'
	current_weapon_block_animation = 'slime_sword_block'
	current_arms_block_animation = 'sword_block'
	set_text('Slime Sword')

func _on_gladius_button_pressed() -> void:
	current_sword = 'Gladius'
	current_weapon_attack_animation = 'gladius_attack'
	current_arms_attack_animation = 'sword_swing'
	current_weapon_block_animation = 'gladius_block'
	current_arms_block_animation = 'sword_block'
	set_text('Gladius')

func _on_ol_slashy_button_pressed() -> void:
	current_sword = 'Ol\' Slashy'
	current_weapon_attack_animation = 'ol_slashy_attack'
	current_arms_attack_animation = 'sword_swing'
	current_weapon_block_animation = 'ol_slashy_block'
	current_arms_block_animation = 'sword_block'
	set_text('Ol\' Slashy')

func _on_katana_button_pressed() -> void:
	current_sword = 'Katana'
	current_weapon_attack_animation = 'katana_attack'
	current_arms_attack_animation = 'sword_swing'
	current_weapon_block_animation = 'katana_block'
	current_arms_block_animation = 'sword_block'
	set_text('Katana')

func _on_shield_on_a_stick_button_pressed() -> void:
	current_sword = 'Shield on a Stick'
	current_weapon_attack_animation = 'shield_on_a_stick_attack'
	current_arms_attack_animation = 'sword_swing'
	current_weapon_block_animation = 'shield_on_a_stick_block'
	current_arms_block_animation = 'sword_block'
	set_text('Shield on a Stick')

func _on_saber_of_light_button_pressed() -> void:
	current_sword = 'Saber of Light'
	current_weapon_attack_animation = 'saber_of_light_attack'
	current_arms_attack_animation = 'sword_swing'
	current_weapon_block_animation = 'saber_of_light_block'
	current_arms_block_animation = 'sword_block'
	set_text('Saber of Light')

func _on_ballibar_button_pressed() -> void:
	current_sword = 'Ballibar'
	current_weapon_attack_animation = 'ballibar_attack'
	current_arms_attack_animation = 'sword_swing'
	current_weapon_block_animation = 'ballibar_block'
	current_arms_block_animation = 'sword_block'
	set_text('Ballibar')

func _on_leviathan_button_pressed() -> void:
	current_sword = 'Leviathan'
	current_weapon_attack_animation = 'leviathan_attack'
	current_arms_attack_animation = 'axe_swing'
	current_weapon_block_animation = 'leviathan_block'
	current_arms_block_animation = 'axe_block'
	set_text('Leviathan')

func _on_fireball_button_pressed() -> void:
	current_spell = 'Fireball'
	current_spell_animation = 'fireball'
	set_text('Fireball')

func _on_water_ball_button_pressed() -> void:
	current_spell = 'Water Ball'
	current_spell_animation = 'water_ball'
	set_text('Water Ball')

func _on_summon_spider_button_pressed() -> void:
	current_spell = 'Summon Spider'
	current_spell_animation = 'summon_spider'
	set_text('Summon Spider')

func _on_health_orb_button_pressed() -> void:
	current_spell = 'Health Orb'
	current_spell_animation = 'health_orb'
	set_text('Health Orb')

func _on_lightning_bolt_button_pressed() -> void:
	current_spell = 'Lighting Bolt'
	current_spell_animation = 'lightning_bolt'
	set_text('Lightning Bolt')

func _on_rock_squash_button_pressed() -> void:
	current_spell = 'Rock Squash'
	current_spell_animation = 'rock_squash'
	set_text('Rock Squash')

func _on_rock_bullet_button_pressed() -> void:
	current_spell = 'Rock Bullet'
	current_spell_animation = 'rock_bullet'
	set_text('Rock Bullet')

func _on_magic_missile_button_pressed() -> void:
	current_spell = 'Magic Missile'
	current_spell_animation = 'magic_missile'
	set_text('Magic Missile')

func _on_chain_lightning_button_pressed() -> void:
	current_spell = 'Chain Lighting'
	current_spell_animation = 'chain_lightning'
	set_text('Chain Lightning')

func _on_special_beam_cannon_button_pressed() -> void:
	current_spell = 'Special Beam Cannon'
	current_spell_animation = 'special_beam_cannon'
	set_text('Special Beam Cannon')

func _on_ice_wall_button_pressed() -> void:
	current_spell = 'Ice Wall'
	current_spell_animation = 'ice_wall'
	set_text('Ice Wall')

func _on_gun_pressed() -> void:
	current_spell = 'Gun'
	current_spell_animation = 'gun'
	set_text('Gun')

func _on_dungeon_critter_button_pressed() -> void:
	display_enemy('Dungeon Critter', 'dungeon_critter')

func _on_spider_button_pressed() -> void:
	display_enemy('Spider', 'spider')

func _on_zombie_button_pressed() -> void:
	display_enemy('Zombie', 'zombie')

func _on_skeleton_button_pressed() -> void:
	display_enemy('Skeleton', 'skeleton')
	
func _on_thief_button_pressed() -> void:
	display_enemy('Thief', 'thief')

func _on_gremlin_button_pressed() -> void:
	display_enemy('Gremlin', 'gremlin')

func _on_demon_button_pressed() -> void:
	display_enemy('Demon', 'demon')

func _on_close_pressed() -> void:
	$EnemyDisplay.visible = false


func _on_items_button_pressed() -> void:
	animation_class = 'None'
	$SwordsContainer.visible = false
	$SpellsContainer.visible = false
	$EnemiesContainer.visible = false
	$ItemsContainer.visible = true
	$SwordsButton.disabled = false
	$SpellsButton.disabled = false
	$EnemiesButton.disabled = false
	$ItemsButton.disabled = true
	$PlayButton.visible = false
	$TypeButton.visible = false
	$ScrollContainer/CurrentLabel.visible = true
	checkSynergy()

func checkSynergy():
	if current_item.has('Book Lamp') && current_item.has('Glasses') && current_item.has('Spell Master') && !current_synergy.has('Spell Doctor'):
		$SynergyText.text = '[outline_size=5]Spell Doctor[/outline_size]'
		$SynSprite.texture = load("res://Art/Item-Sprites/spell_doctor.png")
		$SynAnimationPlayer.play('Synergy')
		current_synergy.append('Spell Doctor')
	elif (!current_item.has('Book Lamp') || !current_item.has('Glasses') || !current_item.has('Spell Master')) && current_synergy.has('Spell Doctor'):
		current_synergy.erase('Spell Doctor')
	if current_item.has('Calculator') && current_item.has('Coin Flip') && !current_synergy.has('Don\'t Tell Me The Odds!'):
		$SynergyText.text = '[outline_size=5]Don\'t Tell Me The Odds![/outline_size]'
		$SynSprite.texture = load("res://Art/Item-Sprites/dont_tell_me_the_odds!.png")
		$SynAnimationPlayer.play('Synergy')
		current_synergy.append('Don\'t Tell Me The Odds!')
	elif (!current_item.has('Calculator') || !current_item.has('Coin Flip')) && current_synergy.has('Don\'t Tell Me The Odds!'):
		current_synergy.erase('Don\'t Tell Me The Odds!')
	if current_item.has('A Living Heart') && current_item.has('Sports Drink') && !current_synergy.has('Athlete\'s Dream'):
		$SynergyText.text = '[outline_size=5]Athlete\'s Dream[/outline_size]'
		$SynSprite.texture = load("res://Art/Item-Sprites/athletes_dream.png")
		$SynAnimationPlayer.play('Synergy')
		current_synergy.append('Athlete\'s Dream')
	elif (!current_item.has('A Living Heart') || !current_item.has('Sports Drink')) && current_synergy.has('Athlete\'s Dream'):
		current_synergy.erase('Athlete\'s Dream')
	if current_item.has('The Last') && current_item.has('Shattered Crown') && current_item.has('A Bleeding Heart') && !current_synergy.has('The Fool'):
		$SynergyText.text = '[outline_size=5]The Fool[/outline_size]'
		$SynSprite.texture = load("res://Art/Item-Sprites/the_fool.png")
		$SynAnimationPlayer.play('Synergy')
		current_synergy.append('The Fool')
	elif (!current_item.has('The Last') || !current_item.has('Shattered Crown') || !current_item.has('A Bleeding Heart')) && current_synergy.has('The Fool'):
		current_synergy.erase('The Fool')
	
	var temp = ''
	for item in current_item:
		temp = temp + item + ", "
	if current_synergy.size() > 0:
		temp = temp + "\n"
		var temp2 = 'Current Synergies: '
		for syn in current_synergy:
			temp2 = temp2 + syn + ", "
		temp = temp + temp2
	$ScrollContainer/CurrentLabel.text = "Current Item(s): " + temp

func _on_armor_up_toggled(toggled_on: bool) -> void:
	if toggled_on:
		current_item.append('Armor Up')
	else:
		current_item.erase('Armor Up')
	checkSynergy()


func _on_a_bleeding_heart_toggled(toggled_on: bool) -> void:
	if toggled_on:
		current_item.append('A Bleeding Heart')
	else:
		current_item.erase('A Bleeding Heart')
	checkSynergy()


func _on_bare_it_all_toggled(toggled_on: bool) -> void:
	if toggled_on:
		current_item.append('Bare It All')
	else:
		current_item.erase('Bare It All')
	checkSynergy()


func _on_book_lamp_toggled(toggled_on: bool) -> void:
	if toggled_on:
		current_item.append('Book Lamp')
	else:
		current_item.erase('Book Lamp')
	checkSynergy()


func _on_calculator_toggled(toggled_on: bool) -> void:
	if toggled_on:
		current_item.append('Calculator')
	else:
		current_item.erase('Calculator')
	checkSynergy()


func _on_coin_flip_toggled(toggled_on: bool) -> void:
	if toggled_on:
		current_item.append('Coin Flip')
	else:
		current_item.erase('Coin Flip')
	checkSynergy()


func _on_glasses_toggled(toggled_on: bool) -> void:
	if toggled_on:
		current_item.append('Glasses')
	else:
		current_item.erase('Glasses')
	checkSynergy()


func _on_growth_sticker_toggled(toggled_on: bool) -> void:
	if toggled_on:
		current_item.append('Growth Sticker')
	else:
		current_item.erase('Growth Sticker')
	checkSynergy()


func _on_lightning_sticker_toggled(toggled_on: bool) -> void:
	if toggled_on:
		current_item.append('Lightning Sticker')
	else:
		current_item.erase('Lightning Sticker')
	checkSynergy()


func _on_living_heart_toggled(toggled_on: bool) -> void:
	if toggled_on:
		current_item.append('A Living Heart')
	else:
		current_item.erase('A Living Heart')
	checkSynergy()


func _on_shattered_crown_toggled(toggled_on: bool) -> void:
	if toggled_on:
		current_item.append('Shattered Crown')
	else:
		current_item.erase('Shattered Crown')
	checkSynergy()


func _on_shield_toggled(toggled_on: bool) -> void:
	if toggled_on:
		current_item.append('Shield')
	else:
		current_item.erase('Shield')
	checkSynergy()


func _on_spell_master_toggled(toggled_on: bool) -> void:
	if toggled_on:
		current_item.append('Spell Master')
	else:
		current_item.erase('Spell Master')
	checkSynergy()


func _on_sports_drink_toggled(toggled_on: bool) -> void:
	if toggled_on:
		current_item.append('Sports Drink')
	else:
		current_item.erase('Sports Drink')
	checkSynergy()


func _on_stopwatch_toggled(toggled_on: bool) -> void:
	if toggled_on:
		current_item.append('Stopwatch')
	else:
		current_item.erase('Stopwatch')
	checkSynergy()


func _on_the_first_toggled(toggled_on: bool) -> void:
	if toggled_on:
		current_item.append('The First')
	else:
		current_item.erase('The First')
	checkSynergy()


func _on_the_last_toggled(toggled_on: bool) -> void:
	if toggled_on:
		current_item.append('The Last')
	else:
		current_item.erase('The Last')
	checkSynergy()
