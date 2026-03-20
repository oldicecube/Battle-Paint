tag @a remove paint_joiner
tag @a remove team_red
tag @a remove team_white
tag @a remove team_orange
tag @a remove team_yellow
tag @a remove team_lime
tag @a remove team_light_blue
tag @a remove team_pink
tag @a remove team_purple
tag @a remove team_green
tag @a remove team_cyan
tag @a remove battlepaint
tag @a remove paint_start
tellraw @a "tag重置成功"

scoreboard objectives remove armor_stand_delay_timer
scoreboard objectives remove paint_main
scoreboard objectives remove battlepaint_start
scoreboard objectives remove battlepaint_tplobby
scoreboard objectives remove dealt_damage
scoreboard objectives remove is_dead
scoreboard objectives remove blocks_count
scoreboard objectives remove max_blocks
scoreboard objectives remove winner
scoreboard objectives remove paint_bucket
scoreboard objectives remove battlepaint_help
tellraw @a "计分板移除成功"

scoreboard objectives add armor_stand_delay_timer dummy
scoreboard objectives add paint_main dummy
scoreboard objectives add battlepaint_start trigger
scoreboard objectives add battlepaint_tplobby trigger
scoreboard objectives add dealt_damage minecraft.custom:minecraft.damage_dealt
scoreboard objectives add is_dead deathCount
scoreboard objectives add blocks_count dummy
scoreboard objectives add max_blocks dummy
scoreboard objectives add winner dummy
scoreboard objectives add paint_bucket dummy
scoreboard objectives add battlepaint_help trigger
tellraw @a "计分板添加成功"

scoreboard players set #paint_prepare paint_main -3
scoreboard players set #main_timer paint_main -3
scoreboard players set global max_blocks 1
tellraw @a "计分板初始化成功"

execute in battlepaint:battlepaint run kill @e[type=armor_stand]
execute in battlepaint:battlepaint run clone -50 3 -50 50 3 50 -50 7 -50
tellraw @a "地图初始化成功"

tellraw @a {"text":"油漆大战数据包加载完成","color":"green"}
tellraw @a {"text":"本数据包由oldicecube制作，专用于GSMPS的油漆大战小游戏，未经允许禁止移植","color":"red"}
tellraw @a {"text":"若初次加载数据包，请务必先在数据包自动生成的battlepaint:battlepaint维度使用创世神模组或投影模组粘贴地图，务必使用-o参数保证位置准确","color":"yellow"}