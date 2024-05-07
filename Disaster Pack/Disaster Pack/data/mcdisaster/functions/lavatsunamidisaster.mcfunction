execute as @e[type=minecraft:armor_stand,tag=lavatsunami] at @s run tp @s ^-1 ^ ^
execute as @e[type=minecraft:armor_stand,tag=lavatsunami] at @s run fill ~ ~-1 ~ ~ ~-1 ~50 minecraft:lava replace minecraft:air
execute as @e[type=minecraft:armor_stand,tag=lavatsunami] at @s run fill ~7 ~-1 ~ ~7 ~-1 ~50 minecraft:air replace minecraft:lava

scoreboard players set gamemaster EndTime 100

execute if score gamemaster GameTime >= gamemaster EndTime as @e[type=minecraft:armor_stand,tag=lavatsunami] at @s run fill ~-10 ~ ~ ~10 ~-15 ~50 minecraft:air replace minecraft:lava
execute if score gamemaster GameTime >= gamemaster EndTime run kill @e[tag=lavatsunami]
execute if score gamemaster GameTime >= gamemaster EndTime run function mcdisaster:gameend 

execute unless score gamemaster GameTime >= gamemaster EndTime run schedule function mcdisaster:lavatsunamidisaster 0.75s replace

