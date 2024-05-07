
loot replace entity @s armor.head mine ~0.5 ~-0.2 ~0.5 minecraft:diamond_pickaxe[minecraft:enchantments={levels:{'silk_touch':1}}]
data modify entity @e[type=minecraft:block_display,limit=1,sort=nearest] block_state.Name set from entity @s ArmorItems[3].id
#summon falling block & block display and set their blockstates accordingly to the armor stands
execute unless block ~ ~-1 ~ minecraft:air run summon falling_block ~ ~1 ~ {BlockState:{Name:"minecraft:tripwire"},NoGravity:0b}
data modify entity @e[type=minecraft:block_display,limit=1,sort=nearest] block_state.Name set from entity @s ArmorItems[3].id
data modify entity @e[type=minecraft:falling_block,limit=1,sort=nearest] BlockState.Name set from entity @s ArmorItems[3].id
#fill with air
fill ~ ~2 ~ ~ ~-2 ~ minecraft:air
