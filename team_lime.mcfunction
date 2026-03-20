# 不参与玩家的死亡计分板不应当起作用
scoreboard players set @a[tag=!paint_joiner] is_dead 0

# 死亡检测逻辑
execute as @a[tag=paint_joiner,scores={is_dead=1..}] run scoreboard players set @s paint_main 100
execute as @a[tag=paint_joiner,scores={paint_main=100}] run scoreboard players set @s is_dead 0
execute as @a[tag=paint_joiner,scores={paint_main=98}] run gamemode spectator @s
execute as @a[tag=paint_joiner,scores={paint_main=98}] run title @s title {"text":"你已死亡","color":"red","bold":true}
execute as @a[tag=paint_joiner,scores={paint_main=98}] run title @s subtitle {"text":"5秒后复活","color":"yellow"}
execute as @a[tag=paint_joiner,scores={paint_main=1..}] at @s run tp @s @s
# 计时逻辑在主程序计时器当中
execute as @a[tag=paint_joiner,scores={paint_main=0}] run gamemode adventure @s
scoreboard players reset @a[tag=paint_joiner,scores={paint_main=0}] paint_main