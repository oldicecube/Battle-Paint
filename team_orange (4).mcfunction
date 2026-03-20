# 清除玩家状态
execute in battlepaint:battlepaint as @a[tag=!paint_joiner,tag=battlepaint] run effect clear @s
execute in battlepaint:battlepaint as @a[tag=!paint_joiner,tag=battlepaint] run attribute @s minecraft:player.entity_interaction_range base set 3
execute in battlepaint:battlepaint as @a[tag=!paint_joiner,tag=battlepaint] run attribute @s minecraft:generic.attack_knockback base set 0
execute in battlepaint:battlepaint as @a[tag=!paint_joiner,tag=battlepaint] run attribute @s minecraft:generic.attack_damage base set 1

# 清除分队与玩家状态
execute as @a[x=-3,y=67,z=2,dx=8,dy=6,dz=10] run tag @s remove paint_joiner
execute as @a[x=-3,y=67,z=2,dx=8,dy=6,dz=10] run tag @s remove team_red
execute as @a[x=-3,y=67,z=2,dx=8,dy=6,dz=10] run tag @s remove team_white
execute as @a[x=-3,y=67,z=2,dx=8,dy=6,dz=10] run tag @s remove team_orange
execute as @a[x=-3,y=67,z=2,dx=8,dy=6,dz=10] run tag @s remove team_yellow
execute as @a[x=-3,y=67,z=2,dx=8,dy=6,dz=10] run tag @s remove team_lime
execute as @a[x=-3,y=67,z=2,dx=8,dy=6,dz=10] run tag @s remove team_light_blue
execute as @a[x=-3,y=67,z=2,dx=8,dy=6,dz=10] run tag @s remove team_pink
execute as @a[x=-3,y=67,z=2,dx=8,dy=6,dz=10] run tag @s remove team_purple
execute as @a[x=-3,y=67,z=2,dx=8,dy=6,dz=10] run tag @s remove team_green
execute as @a[x=-3,y=67,z=2,dx=8,dy=6,dz=10] run tag @s add battlepaint

# 重置玩家的trigger状态
execute as @a[x=-3,y=67,z=2,dx=8,dy=6,dz=10] run scoreboard players reset @s battlepaint_start
execute as @a[x=-3,y=67,z=2,dx=8,dy=6,dz=10] run scoreboard players reset @s battlepaint_tplobby

# 重置玩家出生点
execute in battlepaint:battlepaint as @a[tag=!paint_joiner,tag=battlepaint] run spawnpoint @s 0 68 7

execute in battlepaint:battlepaint as @a[tag=!paint_joiner,tag=battlepaint] run effect give @s minecraft:regeneration 1 30 true