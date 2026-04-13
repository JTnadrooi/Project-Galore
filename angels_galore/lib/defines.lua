agal = agal or {} -- to make it loadable in settings phase.

agal.defines = agal.defines or {}

---@type string[]
agal.defines.geodes = { -- sorted from most to least valuable
    "angels-geode-cyan",
    "angels-geode-lightgreen",
    "angels-geode-yellow",
    "angels-geode-purple",
    "angels-geode-red",
    "angels-geode-blue",
}

---@type string[]
agal.defines.environments = { "angels-temperate", "angels-swamp", "angels-desert" }

---@type string[]
agal.defines.ore_states = { "crushed", "chunk", "crystal", "pure" }

---@type string[]
agal.defines.alt_ore_states = { "crushed", "powder", "dust", "crystal" } -- see ore8 and 9, they have a dust states.

---@type string[]
agal.defines.fluid_alt_ore_states = { "sludge", "slime", "solution" } -- see ore8 and 9, they also have some extra fluid states.

---@type integer[]
agal.defines.ore_indexes = { 2, 3 }

---@type integer[]
agal.defines.removed_ore_indexes = { 1, 4, 5, 6 }

---@type integer[]
agal.defines.removed_alt_ore_indexes = { 8, 9 } -- these ores are kinda different. (they have slightly different ore states, and dont generate)

---@type string[]
agal.defines.removed_metal_names = { -- I guess silicon is a metalloid but im not calling this "REMOVED_METALS_AND_SILICON"
    "manganese",
    "aluminium",
    "nickel",
    "silicon",
    "cobalt",
    "titanium",
    "tungsten",
    "chrome",
}

---@type table
agal.defines.metal_steel = {
    name = "steel",
    plate = "steel-plate",
    molten = "angels-liquid-molten-steel",
    ingot = "angels-ingot-steel",
    roll = "angels-roll-steel",
}
