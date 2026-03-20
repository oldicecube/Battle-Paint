tag @s add battlepaint
execute in battlepaint:battlepaint run tp @s 0 68 7
title @s title {"text":"欢迎来到油漆大战","color":"yellow","bold":true}
title @s subtitle {"text":"输入 /trigger battlepaint_help 可获取游戏指南","color":"green"}
tellraw @s {"text":"欢迎来到油漆大战","color":"yellow","bold":true}
tellraw @s {"text":"输入 /trigger battlepaint_help 可获取游戏指南","color":"green"}
clear @s
scoreboard players set @s battlepaint_help 0
scoreboard players enable @s battlepaint_help