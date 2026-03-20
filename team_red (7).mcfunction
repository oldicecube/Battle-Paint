# 有以下颜色可选：red;white;orange;yellow;lime;light_blue;pink;purple;green
execute in battlepaint:battlepaint positioned 0 0 0 run kill @e[type=chicken,distance=..1000]
execute in battlepaint:battlepaint positioned 0 0 0 run kill @e[type=item,distance=..1000]

# 状态常量
effect give @a[tag=paint_joiner] minecraft:night_vision infinite 1 true
effect give @a[tag=paint_joiner] minecraft:speed infinite 3 true
execute as @a[tag=paint_joiner] if data entity @s {foodLevel:0} run effect give @s saturation 1 1 true
execute as @a[tag=paint_joiner] run attribute @s minecraft:generic.attack_knockback base set 5
execute as @a[tag=paint_joiner] run attribute @s minecraft:generic.attack_damage base set 2
execute as @a[tag=paint_joiner] run attribute @s minecraft:player.entity_interaction_range base set 5

execute if score #main_timer paint_main matches 2400 run loot give @a[tag=paint_joiner,tag=team_red] loot battlepaint:random_props/random_props
execute if score #main_timer paint_main matches 2400 run loot give @a[tag=paint_joiner,tag=team_white] loot battlepaint:random_props/random_props
execute if score #main_timer paint_main matches 2400 run loot give @a[tag=paint_joiner,tag=team_orange] loot battlepaint:random_props/random_props
execute if score #main_timer paint_main matches 2400 run loot give @a[tag=paint_joiner,tag=team_yellow] loot battlepaint:random_props/random_props
execute if score #main_timer paint_main matches 2400 run loot give @a[tag=paint_joiner,tag=team_lime] loot battlepaint:random_props/random_props
execute if score #main_timer paint_main matches 2400 run loot give @a[tag=paint_joiner,tag=team_light_blue] loot battlepaint:random_props/random_props
execute if score #main_timer paint_main matches 2400 run loot give @a[tag=paint_joiner,tag=team_pink] loot battlepaint:random_props/random_props
execute if score #main_timer paint_main matches 2400 run loot give @a[tag=paint_joiner,tag=team_purple] loot battlepaint:random_props/random_props
execute if score #main_timer paint_main matches 2400 run loot give @a[tag=paint_joiner,tag=team_green] loot battlepaint:random_props/random_props

execute if score #main_timer paint_main matches 1200 run loot give @a[tag=paint_joiner,tag=team_red] loot battlepaint:random_props/random_props
execute if score #main_timer paint_main matches 1200 run loot give @a[tag=paint_joiner,tag=team_white] loot battlepaint:random_props/random_props
execute if score #main_timer paint_main matches 1200 run loot give @a[tag=paint_joiner,tag=team_orange] loot battlepaint:random_props/random_props
execute if score #main_timer paint_main matches 1200 run loot give @a[tag=paint_joiner,tag=team_yellow] loot battlepaint:random_props/random_props
execute if score #main_timer paint_main matches 1200 run loot give @a[tag=paint_joiner,tag=team_lime] loot battlepaint:random_props/random_props
execute if score #main_timer paint_main matches 1200 run loot give @a[tag=paint_joiner,tag=team_light_blue] loot battlepaint:random_props/random_props
execute if score #main_timer paint_main matches 1200 run loot give @a[tag=paint_joiner,tag=team_pink] loot battlepaint:random_props/random_props
execute if score #main_timer paint_main matches 1200 run loot give @a[tag=paint_joiner,tag=team_purple] loot battlepaint:random_props/random_props
execute if score #main_timer paint_main matches 1200 run loot give @a[tag=paint_joiner,tag=team_green] loot battlepaint:random_props/random_props

# 监听游戏进度计分板，当游戏快结束时进行倒计时
execute in battlepaint:battlepaint if score #main_timer paint_main matches 220 run tellraw @a[tag=paint_joiner] {"text":"游戏即将结束","color":"dark_purple","bold":true}
execute in battlepaint:battlepaint if score #main_timer paint_main matches 200 run tellraw @a[tag=paint_joiner] {"text":"10","color":"yellow","bold":true}
execute in battlepaint:battlepaint if score #main_timer paint_main matches 180 run tellraw @a[tag=paint_joiner] {"text":"9","color":"yellow","bold":true}
execute in battlepaint:battlepaint if score #main_timer paint_main matches 160 run tellraw @a[tag=paint_joiner] {"text":"8","color":"yellow","bold":true}
execute in battlepaint:battlepaint if score #main_timer paint_main matches 140 run tellraw @a[tag=paint_joiner] {"text":"7","color":"yellow","bold":true}
execute in battlepaint:battlepaint if score #main_timer paint_main matches 120 run tellraw @a[tag=paint_joiner] {"text":"6","color":"yellow","bold":true}
execute in battlepaint:battlepaint if score #main_timer paint_main matches 100 run tellraw @a[tag=paint_joiner] {"text":"5","color":"yellow","bold":true}
execute in battlepaint:battlepaint if score #main_timer paint_main matches 80 run tellraw @a[tag=paint_joiner] {"text":"4","color":"yellow","bold":true}
execute in battlepaint:battlepaint if score #main_timer paint_main matches 60 run tellraw @a[tag=paint_joiner] {"text":"3","color":"yellow","bold":true}
execute in battlepaint:battlepaint if score #main_timer paint_main matches 40 run tellraw @a[tag=paint_joiner] {"text":"2","color":"yellow","bold":true}
execute in battlepaint:battlepaint if score #main_timer paint_main matches 20 run tellraw @a[tag=paint_joiner] {"text":"1","color":"yellow","bold":true}
execute in battlepaint:battlepaint if score #main_timer paint_main matches 0 run tellraw @a[tag=paint_joiner] {"text":"0","color":"yellow","bold":true}
execute in battlepaint:battlepaint if score #main_timer paint_main matches 0 run scoreboard players set #main_timer paint_main -1

# 油漆桶部分
execute unless score paint_bucket paint_bucket matches 2 unless block 0 7 0 minecraft:composter run scoreboard players set paint_bucket paint_bucket 1
execute in battlepaint:battlepaint if score paint_bucket paint_bucket matches 1 if block 0 7 0 minecraft:red_concrete run fill -10 7 -10 10 7 10 minecraft:red_concrete
execute in battlepaint:battlepaint if score paint_bucket paint_bucket matches 1 if block 0 7 0 minecraft:red_concrete run tellraw @a[tag=paint_joiner] {"text":"油漆桶已被红方打翻!","color":"red"}

execute in battlepaint:battlepaint if score paint_bucket paint_bucket matches 1 if block 0 7 0 minecraft:white_concrete run fill -10 7 -10 10 7 10 minecraft:white_concrete
execute in battlepaint:battlepaint if score paint_bucket paint_bucket matches 1 if block 0 7 0 minecraft:white_concrete run tellraw @a[tag=paint_joiner] {"text":"油漆桶已被白方打翻!","color":"white"}

execute in battlepaint:battlepaint if score paint_bucket paint_bucket matches 1 if block 0 7 0 minecraft:orange_concrete run fill -10 7 -10 10 7 10 minecraft:orange_concrete
execute in battlepaint:battlepaint if score paint_bucket paint_bucket matches 1 if block 0 7 0 minecraft:orange_concrete run tellraw @a[tag=paint_joiner] {"text":"油漆桶已被橙方打翻!","color":"gold"}

execute in battlepaint:battlepaint if score paint_bucket paint_bucket matches 1 if block 0 7 0 minecraft:yellow_concrete run fill -10 7 -10 10 7 10 minecraft:yellow_concrete
execute in battlepaint:battlepaint if score paint_bucket paint_bucket matches 1 if block 0 7 0 minecraft:yellow_concrete run tellraw @a[tag=paint_joiner] {"text":"油漆桶已被黄方打翻!","color":"yellow"}

execute in battlepaint:battlepaint if score paint_bucket paint_bucket matches 1 if block 0 7 0 minecraft:lime_concrete run fill -10 7 -10 10 7 10 minecraft:lime_concrete
execute in battlepaint:battlepaint if score paint_bucket paint_bucket matches 1 if block 0 7 0 minecraft:lime_concrete run tellraw @a[tag=paint_joiner] {"text":"油漆桶已被绿方打翻!","color":"green"}

execute in battlepaint:battlepaint if score paint_bucket paint_bucket matches 1 if block 0 7 0 minecraft:light_blue_concrete run fill -10 7 -10 10 7 10 minecraft:light_blue_concrete
execute in battlepaint:battlepaint if score paint_bucket paint_bucket matches 1 if block 0 7 0 minecraft:light_blue_concrete run tellraw @a[tag=paint_joiner] {"text":"油漆桶已被蓝方打翻!","color":"aqua"}

execute in battlepaint:battlepaint if score paint_bucket paint_bucket matches 1 if block 0 7 0 minecraft:pink_concrete run fill -10 7 -10 10 7 10 minecraft:pink_concrete
execute in battlepaint:battlepaint if score paint_bucket paint_bucket matches 1 if block 0 7 0 minecraft:pink_concrete run tellraw @a[tag=paint_joiner] {"text":"油漆桶已被粉方打翻!","color":"light_purple"}

execute in battlepaint:battlepaint if score paint_bucket paint_bucket matches 1 if block 0 7 0 minecraft:purple_concrete run fill -10 7 -10 10 7 10 minecraft:purple_concrete
execute in battlepaint:battlepaint if score paint_bucket paint_bucket matches 1 if block 0 7 0 minecraft:purple_concrete run tellraw @a[tag=paint_joiner] {"text":"油漆桶已被紫方打翻!","color":"dark_purple"}

execute in battlepaint:battlepaint if score paint_bucket paint_bucket matches 1 if block 0 7 0 minecraft:green_concrete run fill -10 7 -10 10 7 10 minecraft:green_concrete
execute in battlepaint:battlepaint if score paint_bucket paint_bucket matches 1 if block 0 7 0 minecraft:green_concrete run tellraw @a[tag=paint_joiner] {"text":"油漆桶已被绿方打翻!","color":"dark_green"}

execute in battlepaint:battlepaint if score paint_bucket paint_bucket matches 1 run playsound minecraft:entity.generic.explode master @a 0 7 0 255 0

execute if score paint_bucket paint_bucket matches 1 run scoreboard players set paint_bucket paint_bucket 2