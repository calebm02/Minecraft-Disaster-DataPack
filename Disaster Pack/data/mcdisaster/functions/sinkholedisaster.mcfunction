#summon bat for armor stand position
execute store result score gamemaster curSpawnLocations if entity @e[tag=sinkhole]
execute unless score gamemaster curSpawnLocations = gamemaster maxSpawnLocations run summon minecraft:armor_stand 0 10 0 {ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["sinkhole"],Motion:[0.0,-1.0,0.0]}
execute if score gamemaster GameTime matches 50 run scoreboard players set gamemaster maxSpawnLocations 10
execute if score gamemaster GameTime matches 100 run scoreboard players set gamemaster maxSpawnLocations 20
#replace existing armor stand's head with the block below
execute align xyz at @e[tag=sinkholeblock] unless block ~ ~-0.1 ~ minecraft:air run fill ~ ~-1 ~ ~ ~-2 ~ minecraft:air
execute align xyz at @e[tag=sinkholeblock] unless block ~ ~-0.1 ~ minecraft:air run loot replace entity @s armor.head mine ~0.5 ~-0.1 ~0.5
#summon armor stand at bat position
execute as @e[tag=sinkhole] at @s align xyz run summon armor_stand ~0.5 ~0.5 ~0.5 {ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["sinkholeblock"]}
#randomize spread
spreadplayers 0 0 0.001 26 under -10 false @e[tag=sinkholeblock,distance=..2]
#cleanup entities
execute positioned 0 0 0 run kill @s[tag=sinkholeblock,distance=70..]
#this is for scheduling appropriately
execute if score gamemaster GameTime matches 0..20 run schedule function mcdisaster:sinkholedisaster 10s append
execute if score gamemaster GameTime matches 20..40 run schedule function mcdisaster:sinkholedisaster 5s append
execute if score gamemaster GameTime matches 40..80 run schedule function mcdisaster:sinkholedisaster 2.5s append
execute if score gamemaster GameTime matches 80..100 run schedule function mcdisaster:sinkholedisaster 1s append
execute if score gamemaster GameTime matches 100..120 run schedule function mcdisaster:sinkholedisaster 0.5s append
execute if score gamemaster GameTime matches 120..140 run schedule function mcdisaster:sinkholedisaster 0.25s append
execute if score gamemaster GameTime matches 140.. run function mcdisaster:gameend