#summon a bat that controls positioning of lightning bolts
summon bat 0 -10 0 {Silent:1b,Invulnerable:1b,Tags:["lightningbat"],active_effects:[{id:"minecraft:speed",amplifier:5b,duration:20000,show_particles:0b},{id:"minecraft:invisibility",amplifier:2b,duration:10000,show_particles:0b}]}
#summon an armor stand that falls to the floor at the bats location
execute as @e[tag=lightningbat] at @s run summon minecraft:armor_stand ~ ~-2 ~ {ShowArms:0b,Small:1b,Invisible:1b,NoBasePlate:1b,Tags:["lightningstand"],Motion:[0.0,-1.0,0.0]}
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