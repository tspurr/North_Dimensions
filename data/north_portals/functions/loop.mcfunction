# Raycast if water used
execute as @a[scores={moo_Portal=1..}] at @s rotated as @s anchored eyes positioned ^ ^ ^ run function north_portals:moo_portal/cast

# Run cloud checks on raycast clouds if not cancelled
execute as @e[type=minecraft:area_effect_cloud,tag=mooPortal_cloud] at @s run function north_portals:moo_portal/cloud
execute as @e[tag=mooPortal] at @s run function north_portals:moo_portal/moo_portal