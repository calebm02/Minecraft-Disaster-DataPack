#add objectives for each progression count and to see of the objective is running
scoreboard objectives add bLightning dummy 
scoreboard players set gamemaster bLightning 0
scoreboard objectives add bHorse dummy 
scoreboard players set gamemaster bHorse 0
scoreboard objectives add bSinkhole dummy 
scoreboard players set gamemaster bSinkhole 0
scoreboard objectives add bSlime dummy 
scoreboard players set gamemaster bSlime 0
scoreboard objectives add bLavaTsunami dummy 
scoreboard players set gamemaster bLavaTsunami 0

scoreboard objectives add DisasterProg dummy 
scoreboard players set gamemaster DisasterProg 0

#add global gametimer
scoreboard objectives add GameTime dummy 
scoreboard players set gamemaster GameTime 0

schedule clear mcdisaster:iterateprogression