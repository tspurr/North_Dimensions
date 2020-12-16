# AS AT Player who placed water

# Summon Area Effect cloud at player eyes
summon minecraft:area_effect_cloud ^ ^ ^ {Duration:120,Tags:["mooPortal_clouds"]}
say Cloud Casted

# Match player rotation
execute as @e[type=minecraft:area_effect_cloud, tag=mooPortal_cloud] run tp @s ^ ^ ^ ~ ~
say cloud matched rotation

# Reset Scoreboard
scoreboard players reset @s mooPortal
say Scoreboard reset