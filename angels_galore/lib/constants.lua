agal.constants = agal.constants or {}
agal.constants.GEODES = { -- sorted from most to least valuable
    "angels-geode-cyan",
    "angels-geode-lightgreen",
    "angels-geode-yellow",
    "angels-geode-purple",
    "angels-geode-red",
    "angels-geode-blue",
}
agal.constants.ENVIRONMENTS = { "angels-temperate", "angels-swamp", "angels-desert" }
agal.constants.ORE_STATES = { "crushed", "chunk", "crystal", "pure" }
agal.constants.ALT_ORE_STATES = { "crushed", "powder", "dust", "crystal" } -- see ore8 and 9, they have a dust states.
agal.constants.FLUID_ALT_ORE_STATES = { "sludge", "slime", "solution" }    -- see ore8 and 9, they also have some extra fluid states.
agal.constants.ORE_INDEXES = { 2, 3 }
agal.constants.REMOVED_ORE_INDEXES = { 1, 4, 5, 6 }
agal.constants.REMOVED_ALT_ORE_INDEXES = { 8, 9 } -- these ores are kinda different. (they have slightly different ore states, and dont generate)
agal.constants.REMOVED_METALS = {                 -- I guess silicon is a metalloid but im not calling this "REMOVED_METALS_AND_SILICON"
    "manganese",
    "aluminium",
    "nickel",
    "silicon",
    "cobalt",
    "titanium",
    "tungsten",
    "chrome",
}
agal.constants.METAL_STEEL = {
    name = "steel",
    plate = "steel-plate",
    molten = "angels-liquid-molten-steel",
    ingot = "angels-ingot-steel",
    roll = "angels-roll-steel",
}
