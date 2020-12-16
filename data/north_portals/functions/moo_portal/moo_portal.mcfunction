# AS AT ALL mooPortal ARMORSTANDS
tag @s remove stable

# Ensure stability
execute if block ^-0.5 ^-2 ^ minecraft:crying_obsidian if block ^-1.5 ^-2 ^ minecraft:crying_obsidian if block ^0.5 ^-2 ^ minecraft:crying_obsidian if block ^1.5 ^-2 ^ minecraft:crying_obsidian if block ^1.5 ^-1 ^ minecraft:crying_obsidian if block ^-1.5 ^-1 ^ minecraft:crying_obsidian if block ^1.5 ^ ^ minecraft:crying_obsidian if block ^-1.5 ^ ^ minecraft:crying_obsidian if block ^1.5 ^1 ^ minecraft:crying_obsidian if block ^-1.5 ^1 ^ minecraft:crying_obsidian if block ^1.5 ^2 ^ minecraft:crying_obsidian if block ^-1.5 ^2 ^ minecraft:crying_obsidian if block ^0.5 ^2 ^ minecraft:crying_obsidian if block ^-0.5 ^2 ^ minecraft:crying_obsidian run tag @s add stable
execute as @s[tag=!stable] at @s run function north_portals:moo_portal/destroy

# If teleportable nearby, use better detection
execute as @s[tag=!dead] if entity @e[tag=!mooPortal_extra,tag=!mooPortal,type=#north_portals:moo_can_tp,distance=0..3] unless entity @e[tag=mooPortal_extra1,distance=0..2] run summon armor_stand ^0.5 ^ ^ {Invisible:1b,NoGravity:1b,Small:1b,Tags:["mooPortal_extra1","mooPortal_extra"]}
execute as @s[tag=!dead] if entity @e[tag=!mooPortal_extra,tag=!mooPortal,type=#north_portals:moo_can_tp,distance=0..3] unless entity @e[tag=mooPortal_extra2,distance=0..2] run summon armor_stand ^-0.5 ^ ^ {Invisible:1b,NoGravity:1b,Small:1b,Tags:["mooPortal_extra2","mooPortal_extra"]}
execute as @s[tag=!dead] if entity @e[tag=!mooPortal_extra,tag=!mooPortal,type=#north_portals:moo_can_tp,distance=0..3] unless entity @e[tag=mooPortal_extra3,distance=0..2] run summon armor_stand ^0.5 ^1 ^ {Invisible:1b,NoGravity:1b,Small:1b,Tags:["mooPortal_extra3","mooPortal_extra"]}
execute as @s[tag=!dead] if entity @e[tag=!mooPortal_extra,tag=!mooPortal,type=#north_portals:moo_can_tp,distance=0..3] unless entity @e[tag=mooPortal_extra4,distance=0..2] run summon armor_stand ^-0.5 ^1 ^ {Invisible:1b,NoGravity:1b,Small:1b,Tags:["mooPortal_extra4","mooPortal_extra"]}
execute as @s[tag=!dead] if entity @e[tag=!mooPortal_extra,tag=!mooPortal,type=#north_portals:moo_can_tp,distance=0..3] unless entity @e[tag=mooPortal_extra5,distance=0..2] run summon armor_stand ^0.5 ^-1 ^ {Invisible:1b,NoGravity:1b,Small:1b,Tags:["mooPortal_extra5","mooPortal_extra"]}
execute as @s[tag=!dead] if entity @e[tag=!mooPortal_extra,tag=!mooPortal,type=#north_portals:moo_can_tp,distance=0..3] unless entity @e[tag=mooPortal_extra6,distance=0..2] run summon armor_stand ^-0.5 ^-1 ^ {Invisible:1b,NoGravity:1b,Small:1,Tags:["mooPortal_extra6","mooPortal_extra"]}

#### Teleport ####
# Overworld to Custom
execute as @e[type=#north_portals:moo_can_tp,tag=!mooPortal_teleported] at @s if predicate north_portals:in_overworld if entity @e[tag=mooPortal_extra,distance=..0.8] at @e[tag=mooPortal,distance=0..2] rotated as @e[tag=mooPortal,distance=0..2] in test_dimensions:aether_test run function north_portals:moo_portal/teleport
# Custom to Overworld
execute as @e[type=#north_portals:moo_can_tp,tag=!mooPortal_teleported] at @s if predicate north_portals:in_aether_test if entity @e[tag=mooPortal_extra,distance=..0.8] at @e[tag=mooPortal,distance=0..2] rotated as @e[tag=mooPortal,distance=0..2] in minecraft:overworld run function north_portals:moo_portal/teleport

# Kill extras if nothing nearby
execute unless entity @e[tag=!mooPortal_extra,tag=!mooPortal,type=#north_portals:moo_can_tp,distance=0..3] if entity @e[tag=mooPortal_extra,distance=0..2] run kill @e[tag=mooPortal_extra,distance=0..2]

# Remove teleported tag if left portal
execute as @e[type=#north_portals:moo_can_tp] at @s unless entity @e[tag=mooPortal_extra,distance=..0.8] if entity @e[tag=mooPortal_extra,distance=0.8..] run tag @s remove mooPortal_teleported