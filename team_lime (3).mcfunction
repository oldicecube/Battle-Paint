execute in battlepaint_battlepaint unless score #main_timer paintmain matches 0..3600 as @a[tag=paint_start] run tag @s add error_exit
execute as @a[tag=error_exit] run tp @s 0 68 7
execute as @a[tag=error_exit] run title @a title {"text":"检测到您未正常退出游戏，已将您传送回大厅","color":"red"}
execute as @a[tag=error_exit] run tag @s add battlepaint
execute as @a[tag=error_exit] run tag @s remove paint_start
execute as @a[tag=error_exit] run tag @s remove error_exit