execute as @e[type=minecraft:armor_stand,tag=lavatsunami] at @s run tp @s ^-1 ^ ^
execute as @e[type=minecraft:armor_stand,tag=lavatsunami] at @s run fill ~ ~-1 ~ ~ ~-1 ~50 minecraft:lava replace minecraft:air
execute as @e[type=minecraft:armor_stand,tag=lavatsunami] at @s run fill ~7 ~-1 ~ ~7 ~-1 ~50 minecraft:air replace minecraft:lava

execute if score gamemaster GameTime matches 90.. as @e[type=minecraft:armor_stand,tag=lavatsunami] at @s run fill ~-10 ~ ~ ~10 ~-15 ~50 minecraft:air replace minecraft:lava
execute if score gamemaster GameTime matches 90.. run kill @e[tag=lavatsunami]
execute if score gamemaster GameTime matches 90.. run function mcdisaster:cleanup 

execute unless score gamemaster GameTime matches 90.. run schedule function mcdisaster:lavatsunamidisaster 0.5s replace

