#reset all scores
function mcdisaster:intialize

#clear schedules
schedule clear mcdisaster:lightningdisaster 
schedule clear mcdisaster:lavatsunamidisaster
schedule clear mcdisaster:iterateprogression 
schedule clear mcdisaster:timer

#kill entities
kill @e[type=!player]
say clean!