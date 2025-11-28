Community autocast enhancements for vanilla.

Modifies simulation - all players in multiplayer must have this mod.

Built for patch 1.45 (Eivonn's fine) , 2025-10-06+


# Features
- 2025-11-21 - 1.0.0 - work in progress, around 20-30% done
- list of reviewed / pending abilities: https://github.com/dr-evo/sins2-autocast/blob/master/docs/bug-tracking/backlog/ability_list.md

## Advent
- acolyte - refill antimatter - prioritize capitals, ignore crippled
- subjugator - suppression - prioritize cruisers, don't target carriers, don't target ships without weapons
- subjugator - nullify - use only on capitals, don't target ships below 90% antimatter, ignore crippled
- radiance - detonate antimatter - target only capitals, ignore crippled, ignore ships below 80% antimatter
- radiance - animosity - at least 5 targets, does not cast if another animosity active in area, do not cast if low on shields or hull
- radiance - cleansing brilliance - prioritize capitals with frigates in radius, then just caps, ignore frigates
- halcyon - shield blessing - don't cast if another is already in effect
- revelation - reverie - prioritize capitals, ignore if no shields, ignore structures (you have quell), ignore noncombat and carriers
- revelation - guidance - ignore subcaps, ignore crippled, ignore ships with less than 20% antimatter
- rapture - vertigo - at least 5 targets, ignore ships without weapons
- rapture - vengeance - don't overwrite existing buff, prioritize radiance with animosity, then caps and structures with 20% missing shields, then everything else
- rapture - domination - prioritize combat cruisers, don't use if target hull damaged
- rapture - malice - cast only if at least 5 targets would be hit

## TEC
- items - flak burst - avoid casting if another flak burst is active in its area

## Vasari
- jarrasul evacuator - gravity warhead - don't target subcaps
- jarrasul evacuator - subspace rupture - prioritizes targets with gravity warhead
- skirantra carrier - replicate forces - target only combat units with a weapon
- orkulus starbase - debris vortex - enable autocast, cast if 10% armor is missing and was recently damaged

# References
- https://mod.io/g/sins2/m/vanilla-autocast-enhancements
- https://discord.com/channels/266693357093257216/1441505924530569319/1441505924530569319
- https://github.com/dr-evo/sins2-autocast
- https://github.com/dr-evo/sins2-autocast/tree/master/docs/bug-tracking
- https://github.com/dr-evo/sins2-autocast/tree/master/docs/patterns

# Other autocast mods
Inspiration and identification of autocast issues:
- https://mod.io/g/sins2/m/improved-auto-casts
- https://mod.io/g/sins2/m/improved-auto-cast-logic
- https://mod.io/g/sins2/m/better-auto-cast-argonev-docking-booms
- https://mod.io/g/sins2/m/auto-cast-4th-ankylon-ability

# Contact
- discord: drevo#6922