# 先清空周围的屏障，防止待会儿没人选这个颜色
execute as @a[scores={battlepaint_tplobby=1}] at @s run fill ~-1 8 ~ ~-1 9 ~ minecraft:air
execute as @a[scores={battlepaint_tplobby=1}] at @s run fill ~1 8 ~ ~1 9 ~ minecraft:air
execute as @a[scores={battlepaint_tplobby=1}] at @s run fill ~ 8 ~-1 ~ 9 ~-1 minecraft:air
execute as @a[scores={battlepaint_tplobby=1}] at @s run fill ~ 8 ~1 ~ 9 ~1 minecraft:air
execute as @a[scores={battlepaint_tplobby=1}] at @s run setblock ~ ~2 ~ minecraft:air
execute as @a[scores={battlepaint_tplobby=1}] at @s run fill ~1 7 ~1 ~-1 7 ~-1 minecraft:black_concrete
execute as @a[scores={battlepaint_tplobby=1}] at @s run scoreboard players add @s battlepaint_tplobby 1

# 最后执行传送
execute as @a[scores={battlepaint_tplobby=2}] run tellraw @s {"text":"已将您传送回大厅，您可重新选择队伍或退出游戏","color":"yellow","bold":true}
execute as @a[scores={battlepaint_tplobby=2}] run tp @s 0 68 7
execute as @a[scores={battlepaint_tplobby=2}] run tag @s add battlepaint