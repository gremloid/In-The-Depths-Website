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
	$SpellsContainer.visible = true
	$SpellsButton.disabled = true
	$SwordsButton.disabled = false
	$CurrentLabel.text = 'Current Spell: ' + str(current_spell)

func _on_swords_button_pressed() -> void:
	animation_class = 'Sword'
	$SpellsContainer.visible = false
	$SwordsContainer.visible = true
	$SwordsButton.disabled = true
	$SpellsButton.disabled = false
	$CurrentLabel.text = 'Current Sword: ' + str(current_sword)

func _on_play_button_pressed() -> void:
	if (animation_class == 'Sword' and current_sword == 'None') or (animation_class == 'Spell' and current_spell == 'None'):
		$PlayerAnimations/PlayerArms.play('punch')
		await $PlayerAnimations/PlayerArms.animation_looped
		$PlayerAnimations/PlayerArms.stop()
	elif animation_class == 'Sword' and animation_type == 'Attack':
		$PlayerAnimations/PlayerArms.play(current_arms_attack_animation)
		$PlayerAnimations/PlayerSword.play(current_weapon_attack_animation)
		await $PlayerAnimations/PlayerArms.animation_looped
		$PlayerAnimations/PlayerArms.stop()
		$PlayerAnimations/PlayerSword.stop()
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
		$CurrentLabel.text = 'Current Spell: ' + str(text)
	else:
		$CurrentLabel.text = 'Current Sword: ' + str(text)

func _on_type_button_pressed() -> void:
	if animation_type == 'Attack':
		animation_type = 'Block'
		$TypeButton.text = 'Block'
	else:
		animation_type = 'Attack'
		$TypeButton.text = 'Attack'

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
