execute as @a if score @s fish_total > @s fish_previous run scoreboard players add @s player_points 1
execute as @a if score @s fish_total > @s fish_previous run scoreboard players add community community_points 1

execute as @a unless score @s activity_timer matches 0.. run scoreboard players set @s activity_timer 0

# Notify when a player starts earning points
execute as @a[scores={activity_timer=0}] if score @s fish_total > @s fish_previous run tellraw @s {"text":"You're now earning Community Points!","color":"gold"}

# Reset the timer whenever points are earned
execute as @a if score @s fish_total > @s fish_previous run scoreboard players set @s activity_timer 2400

# Count down the timer
execute as @a[scores={activity_timer=1..}] run scoreboard players remove @s activity_timer 1



execute as @a run scoreboard players operation @s fish_previous = @s fish_total