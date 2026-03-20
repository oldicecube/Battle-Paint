tag @s add team_light_blue
tag @s add paint_joiner
tp @s ~ 8 ~

scoreboard players enable @s battlepaint_start
scoreboard players set @s battlepaint_start 0
scoreboard players enable @s battlepaint_tplobby
scoreboard players set @s battlepaint_tplobby 0
spawnpoint @s ~ 8 ~

execute in battlepaint:battlepaint run tellraw @a[tag=battlepaint] {"text":"玩家 [蓝色] ","color":"aqua","extra":[{"selector":"@s"},{"text":" 加入了油漆大战","color":"gold"}]}
tellraw @s {"text":"你已成功加入蓝色队伍","color":"aqua","bold":true}
tellraw @s {"text":"请等待全部玩家到齐后，输入 /trigger battlepaint_start 开启游戏即可","color":"yellow","bold":true}
tellraw @s {"text":"如果想在游戏开始前退出游戏或重新选择颜色，请输入 /trigger battlepaint_tplobby 来回到大厅","color":"yellow","bold":true}


fill ~-1 7 ~-1 ~1 7 ~1 minecraft:light_blue_concrete
fill ~-1 8 ~ ~-1 9 ~ minecraft:barrier
fill ~1 8 ~ ~1 9 ~ minecraft:barrier
fill ~ 8 ~-1 ~ 9 ~-1 minecraft:barrier
fill ~ 8 ~1 ~ 9 ~1 minecraft:barrier
setblock ~ 10 ~ minecraft:barrier