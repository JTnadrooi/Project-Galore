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

agal.defines.nutrientables = {
    "angels-solid-pips",
    "angels-solid-beans",
    "angels-solid-leafs",
    "angels-solid-fruit",
    "angels-solid-nuts",
    "angels-solid-corn",
}

---@type table<string, {name: string, order: data.Order, farm: string, garden: string, seeds: string[]}>
agal.defines.environments = {
    ["temperate"] = {
        name = "temperate",
        order = "a",
        farm = "angels-temperate-farm",
        garden = "angels-temperate-garden",
        seeds = {
            "angels-temperate-1-seed",
            "angels-temperate-2-seed",
            "angels-temperate-3-seed",
            "angels-temperate-4-seed",
            "angels-temperate-5-seed",
        }
    },
    ["swamp"] = {
        name = "swamp",
        order = "b",
        farm = "angels-swamp-farm",
        garden = "angels-swamp-garden",
        seeds = {
            "angels-swamp-1-seed",
            "angels-swamp-2-seed",
            "angels-swamp-3-seed",
            "angels-swamp-4-seed",
            "angels-swamp-5-seed",
        }
    },
    ["desert"] = {
        name = "desert",
        order = "c",
        farm = "angels-desert-farm",
        garden = "angels-desert-garden",
        seeds = {
            "angels-desert-1-seed",
            "angels-desert-2-seed",
            "angels-desert-3-seed",
            "angels-desert-4-seed",
            "angels-desert-5-seed",
        }
    },
}

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
