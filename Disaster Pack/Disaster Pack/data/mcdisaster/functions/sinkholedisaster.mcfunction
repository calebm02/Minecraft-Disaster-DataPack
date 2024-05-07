#summon bat for armor stand position
execute store result score gamemaster curSpawnLocations if entity @e[tag=sinkhole]
execute unless score gamemaster curSpawnLocations = gamemaster maxSpawnLocations run summon minecraft:armor_stand 0 -63 0 {ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["sinkhole"],Motion:[0.0,-1.0,0.0]}
execute if score gamemaster GameTime matches 50 run scoreboard players set gamemaster maxSpawnLocations 10
execute if score gamemaster GameTime matches 100 run scoreboard players set gamemaster maxSpawnLocations 20

#grab the block below the armor stand and set it as the head of the armor stand


#summon armor stand at bat position
execute as @e[tag=sinkhole] at @s align xyz run summon armor_stand ~0.5 ~0.5 ~0.5 {ShowArms:0b,Pose:{Head:[45f,0f,90f]},Small:1b,Invisible:1b,NoBasePlate:1b,NoGravity:1b,Tags:["sinkholeblock"],Passengers:[{id:"minecraft:block_display",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.5f,-1f,-0.5f],scale:[1.01f,1.01f,1.01f]},block_state:{Name:"minecraft:air"}}]}
#randomize spread
execute at @e[tag=sinkhole] run spreadplayers 0 0 0.001 26 under -10 false @e[tag=sinkholeblock,distance=..2]
#turn on gravity of sinkhole blocks so that they can continue falling
execute as @e[tag=sinkholeblock] run data merge entity @s {NoGravity:0b}
#if the armor stand is not currently falling, run setfallingblock
execute as @e[tag=sinkholeblock] at @s unless block ~ ~-0.5 ~ minecraft:air unless block ~ ~-0.5 ~ minecraft:barrier run function mcdisaster:setfallingblock

#cleanup entities
execute positioned 0 0 0 run kill @e[tag=sinkholeblock,y=-120,dy=-64]
execute as @e[type=minecraft:block_display] at @s unless entity @e[tag=sinkholeblock,distance=0..2] run kill @s
#this is for scheduling appropriately
execute if score gamemaster GameTime matches 0..20 run schedule function mcdisaster:sinkholedisaster 7.5s append
execute if score gamemaster GameTime matches 20..40 run schedule function mcdisaster:sinkholedisaster 5s append
execute if score gamemaster GameTime matches 40..80 run schedule function mcdisaster:sinkholedisaster 2.5s append
execute if score gamemaster GameTime matches 80..100 run schedule function mcdisaster:sinkholedisaster 1s append
execute if score gamemaster GameTime matches 100..120 run schedule function mcdisaster:sinkholedisaster 1s append
execute if score gamemaster GameTime matches 120..140 run schedule function mcdisaster:sinkholedisaster 0.5s append
execute if score gamemaster GameTime matches 140.. run function mcdisaster:gameend