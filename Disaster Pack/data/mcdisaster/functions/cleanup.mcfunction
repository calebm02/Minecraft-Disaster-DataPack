#clear schedules
schedule clear mcdisaster:lightningdisaster 
schedule clear mcdisaster:lavatsunamidisaster
schedule clear mcdisaster:timer
schedule clear mcdisaster:sinkholedisaster

#reset all scores
function mcdisaster:initialize
#kill entities
kill @e[type=!player]
say clean!