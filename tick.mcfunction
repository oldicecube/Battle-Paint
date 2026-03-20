# 当玩家脚下的方块非空非屏障时，填充对应的混凝土
execute as @a[tag=team_purple] at @s if score #paint_prepare paint_main matches -2 unless block ~ ~-1 ~ minecraft:air unless block ~ ~-1 ~ minecraft:barrier run setblock ~ ~-1 ~ minecraft:purple_concrete

# 油漆炸弹部分
execute as @a[tag=team_purple] at @s if score #paint_prepare paint_main matches -2 run tag @e[type=wind_charge,distance=..3,limit=1,sort=nearest,tag=!armor_added] add purple_bomb
execute as @e[tag=purple_bomb,type=wind_charge,tag=!armor_added] at @s run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b}
execute as @e[tag=purple_bomb,type=wind_charge] at @s run tag @s add armor_added
execute as @a[tag=team_purple] at @s if entity @e[tag=purple_bomb,type=wind_charge,distance=..2] run tag @e[type=armor_stand,distance=..2,sort=nearest,limit=1] add purple_bomb_armor

execute as @e[type=armor_stand,tag=purple_bomb_armor] at @s run tp @s @e[type=wind_charge,tag=purple_bomb,distance=..3,limit=1,sort=nearest]
execute as @e[type=armor_stand,tag=purple_bomb_armor] at @s unless entity @e[type=wind_charge,distance=..2,tag=purple_bomb] unless entity @s[scores={armor_stand_delay_timer=0}] run scoreboard players set @s armor_stand_delay_timer 1

execute as @e[type=armor_stand,tag=purple_bomb_armor] at @s unless entity @e[type=wind_charge,distance=..2,tag=purple_bomb] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:purple_concrete replace minecraft:red_concrete
execute as @e[type=armor_stand,tag=purple_bomb_armor] at @s unless entity @e[type=wind_charge,distance=..2,tag=purple_bomb] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:purple_concrete replace minecraft:white_concrete
execute as @e[type=armor_stand,tag=purple_bomb_armor] at @s unless entity @e[type=wind_charge,distance=..2,tag=purple_bomb] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:purple_concrete replace minecraft:orange_concrete
execute as @e[type=armor_stand,tag=purple_bomb_armor] at @s unless entity @e[type=wind_charge,distance=..2,tag=purple_bomb] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:purple_concrete replace minecraft:yellow_concrete
execute as @e[type=armor_stand,tag=purple_bomb_armor] at @s unless entity @e[type=wind_charge,distance=..2,tag=purple_bomb] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:purple_concrete replace minecraft:lime_concrete
execute as @e[type=armor_stand,tag=purple_bomb_armor] at @s unless entity @e[type=wind_charge,distance=..2,tag=purple_bomb] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:purple_concrete replace minecraft:light_blue_concrete
execute as @e[type=armor_stand,tag=purple_bomb_armor] at @s unless entity @e[type=wind_charge,distance=..2,tag=purple_bomb] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:purple_concrete replace minecraft:pink_concrete
execute as @e[type=armor_stand,tag=purple_bomb_armor] at @s unless entity @e[type=wind_charge,distance=..2,tag=purple_bomb] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:purple_concrete replace minecraft:purple_concrete
execute as @e[type=armor_stand,tag=purple_bomb_armor] at @s unless entity @e[type=wind_charge,distance=..2,tag=purple_bomb] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:purple_concrete replace minecraft:green_concrete
execute as @e[type=armor_stand,tag=purple_bomb_armor] at @s unless entity @e[type=wind_charge,distance=..2,tag=purple_bomb] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:purple_concrete replace minecraft:black_concrete

# 油漆地雷部分
# 当玩家手持雪球投掷时，将对应雪球加上 tag
execute as @a[tag=team_purple] at @s if score #paint_prepare paint_main matches -2 run tag @e[type=snowball,distance=..3,limit=1,sort=nearest,tag=!armor_added] add purple_mine
# 为每个标记为 purple_mine 的雪球生成隐形盔甲架，防止重复
execute as @e[tag=purple_mine,type=snowball,tag=!armor_added] at @s run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b}
execute as @e[tag=purple_mine,type=snowball] at @s run tag @s add armor_added
execute as @a[tag=team_purple] at @s if entity @e[tag=purple_mine,type=snowball,distance=..2] run tag @e[type=armor_stand,distance=..2,sort=nearest,limit=1] add purple_mine_armor
execute as @a[tag=team_purple] at @s if entity @e[type=armor_stand,tag=purple_mine_armor,distance=..2] run title @s actionbar {"text":"地雷已安放","color":"yellow","bold":true}
execute as @a[tag=team_purple] at @s if entity @e[type=armor_stand,tag=purple_mine_armor,distance=..2] run playsound minecraft:entity.tnt.primed master @s
# tp盔甲架
execute as @e[type=armor_stand,tag=purple_mine_armor] at @s run tp @s @e[type=snowball,tag=purple_mine,distance=..2,limit=1,sort=nearest]
# 爆炸粒子 & 音效playsound minecraft:entity.tnt.primed master @a[distance=..3] ~ ~ ~ 1 1
execute as @e[type=armor_stand,tag=purple_mine_armor] at @s unless entity @e[type=snowball,distance=..2,tag=purple_mine] if entity @a[distance=..3,tag=!team_purple] run playsound minecraft:entity.generic.explode master @a[distance=..3] ~ ~ ~ 5 1
execute as @e[type=armor_stand,tag=purple_mine_armor] at @s unless entity @e[type=snowball,distance=..2,tag=purple_mine] if entity @a[distance=..3,tag=!team_purple] run particle minecraft:explosion_emitter ~ ~ ~ 0.5 0.5 0.5 0.1 20 force
# 对最近非自己的玩家造成减速 IV
execute as @e[type=armor_stand,tag=purple_mine_armor] at @s unless entity @e[type=snowball,distance=..2,tag=purple_mine] if entity @a[distance=..3,tag=!team_purple] run effect give @a[distance=..3,tag=!team_purple,limit=1,sort=nearest] minecraft:slowness 5 3 true
# 对最近非自己的玩家造成 12 点伤害
execute as @e[type=armor_stand,tag=purple_mine_armor] at @s unless entity @e[type=snowball,distance=..1,tag=purple_mine] if entity @a[distance=..3,tag=!team_purple] run damage @a[distance=..3,tag=!team_purple,limit=1,sort=nearest] 12
#换颜色
execute as @e[type=armor_stand,tag=purple_mine_armor] at @s unless entity @e[type=snowball,distance=..2,tag=purple_mine] if entity @a[distance=..3,tag=!team_purple] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:purple_concrete replace minecraft:red_concrete
execute as @e[type=armor_stand,tag=purple_mine_armor] at @s unless entity @e[type=snowball,distance=..2,tag=purple_mine] if entity @a[distance=..3,tag=!team_purple] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:purple_concrete replace minecraft:white_concrete
execute as @e[type=armor_stand,tag=purple_mine_armor] at @s unless entity @e[type=snowball,distance=..2,tag=purple_mine] if entity @a[distance=..3,tag=!team_purple] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:purple_concrete replace minecraft:orange_concrete
execute as @e[type=armor_stand,tag=purple_mine_armor] at @s unless entity @e[type=snowball,distance=..2,tag=purple_mine] if entity @a[distance=..3,tag=!team_purple] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:purple_concrete replace minecraft:yellow_concrete
execute as @e[type=armor_stand,tag=purple_mine_armor] at @s unless entity @e[type=snowball,distance=..2,tag=purple_mine] if entity @a[distance=..3,tag=!team_purple] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:purple_concrete replace minecraft:lime_concrete
execute as @e[type=armor_stand,tag=purple_mine_armor] at @s unless entity @e[type=snowball,distance=..2,tag=purple_mine] if entity @a[distance=..3,tag=!team_purple] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:purple_concrete replace minecraft:light_blue_concrete
execute as @e[type=armor_stand,tag=purple_mine_armor] at @s unless entity @e[type=snowball,distance=..2,tag=purple_mine] if entity @a[distance=..3,tag=!team_purple] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:purple_concrete replace minecraft:pink_concrete
execute as @e[type=armor_stand,tag=purple_mine_armor] at @s unless entity @e[type=snowball,distance=..2,tag=purple_mine] if entity @a[distance=..3,tag=!team_purple] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:purple_concrete replace minecraft:purple_concrete
execute as @e[type=armor_stand,tag=purple_mine_armor] at @s unless entity @e[type=snowball,distance=..2,tag=purple_mine] if entity @a[distance=..3,tag=!team_purple] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:purple_concrete replace minecraft:green_concrete
execute as @e[type=armor_stand,tag=purple_mine_armor] at @s unless entity @e[type=snowball,distance=..2,tag=purple_mine] if entity @a[distance=..3,tag=!team_purple] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 minecraft:purple_concrete replace minecraft:black_concrete
# 执行完干死盔甲架
execute as @e[type=armor_stand,tag=purple_mine_armor] at @s unless entity @e[type=snowball,distance=..1,tag=purple_mine] if entity @a[distance=..3,tag=!team_purple] run kill @s


# 油漆守护弹部分
execute as @a[tag=team_purple] at @s if score #paint_prepare paint_main matches -2 run tag @e[type=egg,distance=..3,limit=1,sort=nearest,tag=!armor_added] add purple_guard
execute as @e[tag=purple_guard,type=egg,tag=!armor_added] at @s run summon minecraft:armor_stand ~ ~ ~ {Invisible:1b,Marker:1b}
execute as @e[tag=purple_guard,type=egg] at @s run tag @s add armor_added
execute as @a[tag=team_purple] at @s if entity @e[tag=purple_guard,type=egg,distance=..2] run tag @e[type=armor_stand,distance=..2,sort=nearest,limit=1] add purple_guard_armor
execute as @a[tag=team_purple] at @s if entity @e[type=armor_stand,tag=purple_guard_armor,distance=..2] run title @s actionbar {"text":"颜色守护弹已部署","color":"yellow","bold":true}
execute as @a[tag=team_purple] at @s if entity @e[type=armor_stand,tag=purple_guard_armor,distance=..2] run playsound minecraft:entity.iron_golem.hurt master @s
execute as @e[type=armor_stand,tag=purple_guard_armor] at @s run tp @s @e[type=egg,tag=purple_guard,distance=..2,limit=1,sort=nearest]
execute as @e[type=armor_stand,tag=purple_guard_armor,tag=!delay_added] at @s unless entity @e[type=egg,distance=..2,tag=purple_guard] run scoreboard players set @s armor_stand_delay_timer 200
execute as @e[type=armor_stand,tag=purple_guard_armor,tag=!delay_added] at @s unless entity @e[type=egg,distance=..2,tag=purple_guard] run tag @s add delay_added

execute as @e[type=armor_stand,tag=purple_guard_armor] at @s unless entity @e[type=egg,distance=..2,tag=purple_guard] run particle minecraft:scrape ~ ~ ~ 2 0 2 0 10 force

execute as @e[type=armor_stand,tag=purple_guard_armor] at @s unless entity @e[type=egg,distance=..2,tag=purple_guard] run fill ~-4 7 ~-4 ~4 7 ~4 minecraft:purple_concrete replace minecraft:red_concrete
execute as @e[type=armor_stand,tag=purple_guard_armor] at @s unless entity @e[type=egg,distance=..2,tag=purple_guard] run fill ~-4 7 ~-4 ~4 7 ~4 minecraft:purple_concrete replace minecraft:white_concrete
execute as @e[type=armor_stand,tag=purple_guard_armor] at @s unless entity @e[type=egg,distance=..2,tag=purple_guard] run fill ~-4 7 ~-4 ~4 7 ~4 minecraft:purple_concrete replace minecraft:orange_concrete
execute as @e[type=armor_stand,tag=purple_guard_armor] at @s unless entity @e[type=egg,distance=..2,tag=purple_guard] run fill ~-4 7 ~-4 ~4 7 ~4 minecraft:purple_concrete replace minecraft:yellow_concrete
execute as @e[type=armor_stand,tag=purple_guard_armor] at @s unless entity @e[type=egg,distance=..2,tag=purple_guard] run fill ~-4 7 ~-4 ~4 7 ~4 minecraft:purple_concrete replace minecraft:lime_concrete
execute as @e[type=armor_stand,tag=purple_guard_armor] at @s unless entity @e[type=egg,distance=..2,tag=purple_guard] run fill ~-4 7 ~-4 ~4 7 ~4 minecraft:purple_concrete replace minecraft:light_blue_concrete
execute as @e[type=armor_stand,tag=purple_guard_armor] at @s unless entity @e[type=egg,distance=..2,tag=purple_guard] run fill ~-4 7 ~-4 ~4 7 ~4 minecraft:purple_concrete replace minecraft:pink_concrete
execute as @e[type=armor_stand,tag=purple_guard_armor] at @s unless entity @e[type=egg,distance=..2,tag=purple_guard] run fill ~-4 7 ~-4 ~4 7 ~4 minecraft:purple_concrete replace minecraft:purple_concrete
execute as @e[type=armor_stand,tag=purple_guard_armor] at @s unless entity @e[type=egg,distance=..2,tag=purple_guard] run fill ~-4 7 ~-4 ~4 7 ~4 minecraft:purple_concrete replace minecraft:green_concrete
execute as @e[type=armor_stand,tag=purple_guard_armor] at @s unless entity @e[type=egg,distance=..2,tag=purple_guard] run fill ~-4 7 ~-4 ~4 7 ~4 minecraft:purple_concrete replace minecraft:black_concrete
execute as @e[type=armor_stand,tag=purple_guard_armor] at @s unless entity @e[type=egg,distance=..2,tag=purple_guard] run effect give @a[distance=..5,tag=!team_purple] minecraft:poison 3 1 true
execute as @e[type=armor_stand,tag=purple_guard_armor] at @s unless entity @e[type=egg,distance=..2,tag=purple_guard] run effect give @a[distance=..5,tag=team_purple] minecraft:regeneration 3 2 true

# 秒人斧_MAX部分
execute if score #paint_prepare paint_main matches -2 as @a[tag=team_purple,scores={dealt_damage=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:netherite_axe"}}] run kill @a[tag=paint_joiner,tag=!team_purple]
execute if score #paint_prepare paint_main matches -2 as @a[tag=team_purple,scores={dealt_damage=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:netherite_axe"}}] run tellraw @a ["",{"selector":"@s"},{"text":" 使用了秒人斧_MAX，效果拔群！","color":"red"}]
execute if score #paint_prepare paint_main matches -2 as @a[tag=team_purple,scores={dealt_damage=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:netherite_axe"}}] run playsound minecraft:entity.ender_dragon.ambient master @a ~ ~ ~ 100 1
execute if score #paint_prepare paint_main matches -2 as @a[tag=team_purple,scores={dealt_damage=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:netherite_axe"}}] run clear @s netherite_axe

# 辐射部分
execute if score #main_timer paint_main matches 600.. if score #paint_prepare paint_main matches -2 as @a[tag=team_purple,scores={dealt_damage=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:mace"}}] run fill -51 7 -51 51 7 51 minecraft:purple_concrete replace minecraft:red_concrete
execute if score #main_timer paint_main matches 600.. if score #paint_prepare paint_main matches -2 as @a[tag=team_purple,scores={dealt_damage=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:mace"}}] run fill -51 7 -51 51 7 51 minecraft:purple_concrete replace minecraft:white_concrete
execute if score #main_timer paint_main matches 600.. if score #paint_prepare paint_main matches -2 as @a[tag=team_purple,scores={dealt_damage=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:mace"}}] run fill -51 7 -51 51 7 51 minecraft:purple_concrete replace minecraft:orange_concrete
execute if score #main_timer paint_main matches 600.. if score #paint_prepare paint_main matches -2 as @a[tag=team_purple,scores={dealt_damage=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:mace"}}] run fill -51 7 -51 51 7 51 minecraft:purple_concrete replace minecraft:yellow_concrete
execute if score #main_timer paint_main matches 600.. if score #paint_prepare paint_main matches -2 as @a[tag=team_purple,scores={dealt_damage=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:mace"}}] run fill -51 7 -51 51 7 51 minecraft:purple_concrete replace minecraft:lime_concrete
execute if score #main_timer paint_main matches 600.. if score #paint_prepare paint_main matches -2 as @a[tag=team_purple,scores={dealt_damage=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:mace"}}] run fill -51 7 -51 51 7 51 minecraft:purple_concrete replace minecraft:light_blue_concrete
execute if score #main_timer paint_main matches 600.. if score #paint_prepare paint_main matches -2 as @a[tag=team_purple,scores={dealt_damage=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:mace"}}] run fill -51 7 -51 51 7 51 minecraft:purple_concrete replace minecraft:pink_concrete
execute if score #main_timer paint_main matches 600.. if score #paint_prepare paint_main matches -2 as @a[tag=team_purple,scores={dealt_damage=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:mace"}}] run fill -51 7 -51 51 7 51 minecraft:purple_concrete replace minecraft:purple_concrete
execute if score #main_timer paint_main matches 600.. if score #paint_prepare paint_main matches -2 as @a[tag=team_purple,scores={dealt_damage=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:mace"}}] run fill -51 7 -51 51 7 51 minecraft:purple_concrete replace minecraft:green_concrete
execute if score #main_timer paint_main matches 600.. if score #paint_prepare paint_main matches -2 as @a[tag=team_purple,scores={dealt_damage=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:mace"}}] run tellraw @a ["",{"selector":"@s"},{"text":" 使用了辐射_MAX，效果拔群！","color":"gold"}]
execute if score #main_timer paint_main matches 600.. if score #paint_prepare paint_main matches -2 as @a[tag=team_purple,scores={dealt_damage=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:mace"}}] run playsound minecraft:entity.wither.death master @a ~ ~ ~ 100 1
execute if score #main_timer paint_main matches 600.. if score #paint_prepare paint_main matches -2 as @a[tag=team_purple,scores={dealt_damage=1..}] if entity @s[nbt={SelectedItem:{id:"minecraft:mace"}}] run clear @s minecraft:mace

execute if score #paint_prepare paint_main matches -2 as @a[tag=team_purple,scores={dealt_damage=1..}] run scoreboard players set @s dealt_damage 0