#summon a dummy armor stand that spawns the positioning of lightning bolts. spawnLocations sets how many armor stands can be active at once
execute store result score gamemaster curSpawnLocations if entity @e[tag=lightningspawn]
execute unless score gamemaster curSpawnLocations = gamemaster maxSpawnLocations run summon minecraft:armor_stand 0 -10 0 {ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["lightningspawn"],Motion:[0.0,-1.0,0.0]}
execute if score gamemaster GameTime matches 50 run scoreboard players set gamemaster maxSpawnLocations 7
execute if score gamemaster GameTime matches 100 run scoreboard players set gamemaster maxSpawnLocations 15
#summon armor stands at dummy armor stands
execute as @e[tag=lightningspawn] at @s run summon minecraft:armor_stand ~ ~-2 ~ {ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["lightningstand"],Motion:[0.0,-1.0,0.0]}
#randomize armor stand positions
spreadplayers 0 0 0.001 24 under -10 false @e[tag=lightningstand]
#check if the armor stand is on the floor or not
execute align xyz as @e[tag=lightningstand] at @s unless block ~ ~-1 ~ minecraft:air run summon minecraft:lightning_bolt ~ ~ ~
#clean up
execute align xyz as @e[tag=lightningstand] at @s unless block ~ ~-1 ~ minecraft:air run kill @s

#this is for scheduling appropriately. disaster prog iterates every 20 seconds
execute if score gamemaster GameTime matches 0..20 run schedule function mcdisaster:lightningdisaster 10s append
execute if score gamemaster GameTime matches 20..60 run schedule function mcdisaster:lightningdisaster 5s append
execute if score gamemaster GameTime matches 60..80 run schedule function mcdisaster:lightningdisaster 2.5s append
execute if score gamemaster GameTime matches 80..100 run schedule function mcdisaster:lightningdisaster 2.5s append
execute if score gamemaster GameTime matches 100..120 run schedule function mcdisaster:lightningdisaster 1s append
execute if score gamemaster GameTime matches 120.. run function mcdisaster:gameend