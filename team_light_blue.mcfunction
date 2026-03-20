# 统计部分
# 红色
execute store result score @a[tag=team_red] blocks_count run fill -51 7 -51 51 7 51 minecraft:red_wool replace minecraft:red_concrete

# 白色
execute store result score @a[tag=team_white] blocks_count run fill -51 7 -51 51 7 51 minecraft:white_wool replace minecraft:white_concrete

# 橙色
execute store result score @a[tag=team_orange] blocks_count run fill -51 7 -51 51 7 51 minecraft:orange_wool replace minecraft:orange_concrete

# 黄色
execute store result score @a[tag=team_yellow] blocks_count run fill -51 7 -51 51 7 51 minecraft:yellow_wool replace minecraft:yellow_concrete

# 草绿色
execute store result score @a[tag=team_lime] blocks_count run fill -51 7 -51 51 7 51 minecraft:lime_wool replace minecraft:lime_concrete

# 浅蓝色
execute store result score @a[tag=team_light_blue] blocks_count run fill -51 7 -51 51 7 51 minecraft:light_blue_wool replace minecraft:light_blue_concrete

# 粉色
execute store result score @a[tag=team_pink] blocks_count run fill -51 7 -51 51 7 51 minecraft:pink_wool replace minecraft:pink_concrete

# 紫色
execute store result score @a[tag=team_purple] blocks_count run fill -51 7 -51 51 7 51 minecraft:purple_wool replace minecraft:purple_concrete

# 绿色
execute store result score @a[tag=team_green] blocks_count run fill -51 7 -51 51 7 51 minecraft:green_wool replace minecraft:green_concrete

# 遍历寻找最大值
# 红队
execute as @a[tag=team_red] if score @s blocks_count > global max_blocks run scoreboard players operation global max_blocks = @s blocks_count
execute as @a[tag=team_red] if score @s blocks_count = global max_blocks run scoreboard players set global winner 1

# 白队
execute as @a[tag=team_white] if score @s blocks_count > global max_blocks run scoreboard players operation global max_blocks = @s blocks_count
execute as @a[tag=team_white] if score @s blocks_count = global max_blocks run scoreboard players set global winner 2

# 橙队
execute as @a[tag=team_orange] if score @s blocks_count > global max_blocks run scoreboard players operation global max_blocks = @s blocks_count
execute as @a[tag=team_orange] if score @s blocks_count = global max_blocks run scoreboard players set global winner 3

# 黄队
execute as @a[tag=team_yellow] if score @s blocks_count > global max_blocks run scoreboard players operation global max_blocks = @s blocks_count
execute as @a[tag=team_yellow] if score @s blocks_count = global max_blocks run scoreboard players set global winner 4

# 草绿色队
execute as @a[tag=team_lime] if score @s blocks_count > global max_blocks run scoreboard players operation global max_blocks = @s blocks_count
execute as @a[tag=team_lime] if score @s blocks_count = global max_blocks run scoreboard players set global winner 5

# 浅蓝队
execute as @a[tag=team_light_blue] if score @s blocks_count > global max_blocks run scoreboard players operation global max_blocks = @s blocks_count
execute as @a[tag=team_light_blue] if score @s blocks_count = global max_blocks run scoreboard players set global winner 6

# 粉色队
execute as @a[tag=team_pink] if score @s blocks_count > global max_blocks run scoreboard players operation global max_blocks = @s blocks_count
execute as @a[tag=team_pink] if score @s blocks_count = global max_blocks run scoreboard players set global winner 7

# 紫色队
execute as @a[tag=team_purple] if score @s blocks_count > global max_blocks run scoreboard players operation global max_blocks = @s blocks_count
execute as @a[tag=team_purple] if score @s blocks_count = global max_blocks run scoreboard players set global winner 8

# 绿色队
execute as @a[tag=team_green] if score @s blocks_count > global max_blocks run scoreboard players operation global max_blocks = @s blocks_count