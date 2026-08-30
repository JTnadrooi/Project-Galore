vgal.defines = vgal.defines or {}

---@type "vgal"|"sagal"|"asagal"|nil
vgal.defines.gal_mode = nil
---@type table<"vgal"|"agal"|"sagal"|"asagal", boolean?>
vgal.defines.flags = {}

vgal.defines.is_setting_phase = false

if not data.raw["recipe"] then
    vgal.defines.is_setting_phase = true
end

if mods["vanilla_galore_continued"] then
    vgal.defines.gal_mode = "vgal"
    vgal.defines.flags["vgal"] = true
end
if mods["angels_galore"] then
    vgal.defines.gal_mode = "agal"
    vgal.defines.flags["agal"] = true
end
if mods["space_age_galore"] then
    vgal.defines.gal_mode = "sagal"
    vgal.defines.flags["sagal"] = true
end
if mods["angels_space_age_galore"] then
    vgal.defines.gal_mode = "asagal"
    vgal.defines.flags["asagal"] = true
end

vgal.defines.ignored_by_productivity_max = 65535

---@type table<string, vgal.Metal>
vgal.defines.metals = {
    ["iron"] = {
        name = "iron",
        ore = "iron-ore",
        plate = "iron-plate",
    },
    ["copper"] = {
        name = "copper",
        ore = "copper-ore",
        plate = "copper-plate",
    },
}

if vgal.defines.flags["sagal"] then
    for _, metal in pairs(vgal.defines.metals) do
        metal.bacteria = metal.name .. "-bacteria"
        metal.molten = "molten-" .. metal.name
    end
end

if vgal.defines.flags["agal"] then
    for _, metal in pairs(vgal.defines.metals) do
        metal.ore_index = (metal.name == "copper") and 2 or 3
        metal.base_ore = "angels-ore" .. metal.ore_index

        metal.nugget = "angels-" .. metal.name .. "-nugget"
        metal.slag = "angels-" .. metal.name .. "-slag"
        metal.pebbles = "angels-" .. metal.name .. "-pebbles"

        metal.molten = "angels-liquid-molten-" .. metal.name
        metal.ingot = "angels-ingot-" .. metal.name
        metal.processed = "angels-processed-" .. metal.name
        metal.pellet = "angels-pellet-" .. metal.name
        metal.roll = "angels-roll-" .. metal.name
        metal.angels_plate_recipe_name = "angels-plate-" .. metal.name
        metal.solution = (metal.name == "copper") and "angels-liquid-cupric-chloride-solution" or "angels-liquid-ferric-chloride-solution"

        metal.ore_states = { "crushed", "chunk", "crystal", "pure" }

        for _, ore_state in ipairs(metal.ore_states) do
            metal[ore_state] = "angels-ore" .. metal.ore_index .. "-" .. ore_state
        end
    end
end

---@type { name: string, plate: string, molten: string?, angels_plate_recipe_name: string?, ingot: string?, roll: string? }
vgal.defines.metal_steel = {
    name = "steel",
    plate = "steel-plate",
}

if vgal.defines.flags["agal"] then
    vgal.defines.metal_steel["molten"] = "angels-liquid-molten-steel"
    vgal.defines.metal_steel["angels_plate_recipe_name"] = "angels-plate-steel"
    vgal.defines.metal_steel["ingot"] = "angels-ingot-steel"
    vgal.defines.metal_steel["roll"] = "angels-roll-steel"
end

---@type table<string, {name: string, order: string, tiers: string[], unique_ingredient: string?, unique_ingredient_amount: integer?}>
vgal.defines.modules = {
    ["speed-module"] = {
        name = "speed-module",
        order = "a",
        unique_ingredient = "tungsten-carbide",
        unique_ingredient_amount = 1,
        tiers = {
            "speed-module",
            "speed-module-2",
            "speed-module-3",
        },
    },
    ["efficiency-module"] = {
        name = "efficiency-module",
        order = "b",
        unique_ingredient = "spoilage",
        unique_ingredient_amount = 1,
        tiers = {
            "efficiency-module",
            "efficiency-module-2",
            "efficiency-module-3",
        },
    },
    ["productivity-module"] = {
        name = "productivity-module",
        order = "c",
        unique_ingredient = "biter-egg",
        unique_ingredient_amount = 5,
        tiers = {
            "productivity-module",
            "productivity-module-2",
            "productivity-module-3",
        },
    },
}

if mods["quality"] then
    vgal.defines.modules["quality-module"] = {
        name = "quality-module",
        order = "d",
        unique_ingredient = "superconductor",
        unique_ingredient_amount = 1,
        tiers = {
            "quality-module",
            "quality-module-2",
            "quality-module-3",
        }
    }
end

---@type table<string, boolean>
vgal.defines.recipeable_types = {
    ["item"] = true,
    ["fluid"] = true,
    ["ammo"] = true,
    ["capsule"] = true,
    ["module"] = true,
    ["repair-tool"] = true,
    ["armor"] = true,
    ["item-with-entity-data"] = true,
    ["rail-planner"] = true,
    ["gun"] = true,
}

-- commentedbc: this list would be huge.
-- vgal.defines.entityable_categories = { "entity-with-owner", "simple-entity", "container" }

if not vgal.defines.is_setting_phase then
    ---@type table<string, data.RecipeTints>
    vgal.defines.tints = {
        ["light-oil"] = data.raw["recipe"]["light-oil-cracking"].crafting_machine_tint,
        ["heavy-oil"] = data.raw["recipe"]["heavy-oil-cracking"].crafting_machine_tint,
        ["petroleum-gas"] = data.raw["recipe"]["plastic-bar"].crafting_machine_tint,
        ["crude-oil"] = {
            primary = { r = 0.1, g = 0.05, b = 0.02, a = 1.000 },
            secondary = { r = 0.15, g = 0.1, b = 0.05, a = 1.000 },
            tertiary = { r = 0.2, g = 0.15, b = 0.1, a = 1.000 },
            quaternary = { r = 0.05, g = 0.03, b = 0.01, a = 1.000 }
        },
    }
    vgal.defines.tints["black"] = vgal.defines.tints["crude-oil"]
end

if vgal.defines.flags["sagal"] then
    ---@type table<string, {name: string, tree: string, seed: string, result: string, dormant_seed: string?}>
    vgal.defines.gleba_plants = {
        ["yumako"] = {
            name = "yumako",
            tree = "yumako-tree",
            seed = "yumako-seed",
            result = "yumako-mash"
        },
        ["jellynut"] = {
            name = "jellynut",
            tree = "jellystem",
            seed = "jellynut-seed",
            result = "jelly"
        }
    }

    if vgal.defines.flags["asagal"] then
        for _, plant in pairs(vgal.defines.gleba_plants) do
            plant.dormant_seed = "vgal-" .. plant.seed .. "-dormant"
        end
    end
end

if vgal.defines.flags["agal"] then
    vgal.defines.geodes = { -- sorted from most to least valuable
        "angels-geode-cyan",
        "angels-geode-lightgreen",
        "angels-geode-yellow",
        "angels-geode-purple",
        "angels-geode-red",
        "angels-geode-blue",
    }

    ---@type table<string, {name: string, keeping_recipe: string, breeding_recipe: string}>
    vgal.defines.fish = {
        ["raw-fish"] = {
            name = "raw-fish",
            keeping_recipe = "angels-fish-keeping-0",
            breeding_recipe = "angels-alien-fish-0-raw",
        },
        ["angels-alien-fish-1-raw"] = {
            name = "angels-alien-fish-1-raw",
            keeping_recipe = "angels-fish-keeping-1",
            breeding_recipe = "angels-alien-fish-1-raw",
        },
        ["angels-alien-fish-2-raw"] = {
            name = "angels-alien-fish-2-raw",
            keeping_recipe = "angels-fish-keeping-2",
            breeding_recipe = "angels-alien-fish-2-raw",
        },
        ["angels-alien-fish-3-raw"] = {
            name = "angels-alien-fish-3-raw",
            keeping_recipe = "angels-fish-keeping-3",
            breeding_recipe = "angels-alien-fish-3-raw",
        },
    }

    vgal.defines.nutrientables = {
        "angels-solid-pips",
        "angels-solid-beans",
        "angels-solid-leafs",
        "angels-solid-fruit",
        "angels-solid-nuts",
        "angels-solid-corn",
    }

    ---@type table<string, {name: string, color: string, result: string, secondary_result_water: string, purification_recipe_palette: vgal.AngelsColorPalette, purification_recipe: string, index: integer}>
    vgal.defines.waste_waters = {
        ["angels-water-yellow-waste"] = {
            name = "angels-water-yellow-waste",
            color = "yellow",
            result = "sulfur",
            secondary_result_water = "angels-water-mineralized",
            purification_recipe_palette = "WsSS",
            purification_recipe = "angels-yellow-waste-water-purification",
            index = 1,
        },
        ["angels-water-greenyellow-waste"] = {
            name = "angels-water-greenyellow-waste",
            color = "greenyellow",
            result = "angels-fluorite-ore",
            secondary_result_water = "angels-water-mineralized",
            purification_recipe_palette = "WsFF",
            purification_recipe = "angels-greenyellow-waste-water-purification",
            index = 2,
        },
        ["angels-water-green-waste"] = {
            name = "angels-water-green-waste",
            color = "green",
            result = "angels-solid-salt",
            secondary_result_water = "angels-water-saline",
            purification_recipe_palette = "WsClCl",
            purification_recipe = "angels-green-waste-water-purification",
            index = 3,
        },
        ["angels-water-red-waste"] = {
            name = "angels-water-red-waste",
            color = "red",
            result = "angels-solid-sodium-nitrate",
            secondary_result_water = "angels-water-mineralized",
            purification_recipe_palette = "WsOO",
            purification_recipe = "angels-red-waste-water-purification",
            index = 4,
        },
    }

    ---@type table<string, {name: string, order: data.Order, farm: string, garden: string, seeds: string[], plants: string[]}>
    vgal.defines.environments = {
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
            },
            plants = {
                "angels-temperate-1",
                "angels-temperate-2",
                "angels-temperate-3",
                "angels-temperate-4",
                "angels-temperate-5",
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
            },
            plants = {
                "angels-swamp-1",
                "angels-swamp-2",
                "angels-swamp-3",
                "angels-swamp-4",
                "angels-swamp-5",
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
            },
            plants = {
                "angels-desert-1",
                "angels-desert-2",
                "angels-desert-3",
                "angels-desert-4",
                "angels-desert-5",
            }
        },
    }

    ---@type {[1]: "crushed", [2]: "chunk", [3]: "crystal", [4]: "pure"}
    vgal.defines.ore_states = { "crushed", "chunk", "crystal", "pure" }

    ---@type string[]
    vgal.defines.alt_ore_states = { "crushed", "powder", "dust", "crystal" } -- see ore8 and 9, they have a dust states.

    ---@type string[]
    vgal.defines.fluid_alt_ore_states = { "sludge", "slime", "solution" } -- see ore8 and 9, they also have some extra fluid states.

    ---@type integer[]
    vgal.defines.ore_indexes = { 2, 3 }

    ---@type integer[]
    vgal.defines.removed_ore_indexes = { 1, 4, 5, 6 }

    ---@type integer[]
    vgal.defines.removed_alt_ore_indexes = { 8, 9 } -- these ores are kinda different. (they have slightly different ore states, and dont generate)

    ---@type string[]
    vgal.defines.removed_metal_names = { -- urhm actually, sil-
        "manganese",
        "aluminium",
        "nickel",
        "silicon",
        "cobalt",
        "titanium",
        "tungsten",
        "chrome",
    }

    ---@type table<string, integer>
    vgal.defines.machine_max_tiers = {
        ["angels-oil-refinery"] = 1,
        ["oil-refinery"] = 1,
        ["angels-steam-cracker"] = 1,
        ["angels-liquifier"] = 1,
        ["angels-electrolyser"] = 1,
        ["angels-chemical-plant"] = 1,
        ["chemical-plant"] = 1,
        ["angels-advanced-chemical-plant"] = 1,
        ["angels-separator"] = 1,
        ["angels-gas-refinery-small"] = 1,
        ["angels-gas-refinery"] = 1,
        ["angels-air-filter"] = 1,

        ["angels-hydro-plant"] = 1,
        ["angels-washing-plant"] = 1,
        ["angels-electric-boiler"] = 1,
        ["angels-salination-plant"] = 1,

        ["angels-algae-farm"] = 2,

        ["angels-induction-furnace"] = 1,
        ["angels-casting-machine"] = 1,
        ["angels-strand-casting-machine"] = 1,

        ["angels-ore-sorting-facility"] = 2,
        ["angels-ore-crusher"] = 1,
        ["angels-ore-floatation-cell"] = 1,
        ["angels-ore-leaching-plant"] = 1,
        ["angels-ore-processing-machine"] = 1,
        ["angels-ore-refinery"] = 1,
        ["angels-powderizer"] = 1,
        ["angels-filtration-unit"] = 1,
        ["angels-crystallizer"] = 1,

        ["angels-pellet-press"] = 1,
        ["angels-powder-mixer"] = 1,
        ["angels-blast-furnace"] = 1,
        ["angels-chemical-furnace"] = 1,
        ["angels-sintering-oven"] = 1,
        ["angels-electro-whinning-cell"] = 0, -- removes it.
    }
end

if vgal.defines.flags["asagal"] then
    ---@type table<string, vgal.Atmosphere>
    vgal.defines.atmospheres = {
        ["nauvis"] = { -- not relevant in agal
            name = "vgal-atm-nauvis",
            planet = "nauvis",
            index = 1,
            energy_required = 1,
            colors = { { 180, 180, 225 }, { 150, 150, 187 }, { 120, 120, 150 } },
            fluid_results = {
                { "angels-gas-oxygen",   20 },
                { "angels-gas-nitrogen", 80 },
            }
        },
        ["vulcanus"] = {
            name = "vgal-atm-vulcanus",
            planet = "vulcanus",
            index = 2,
            energy_required = 0.5,
            colors = { { 220, 200, 160 }, { 190, 170, 130 }, { 160, 140, 100 } },
            fluid_results = {
                { "angels-gas-oxygen",         10 },
                -- { "angels-gas-sulfur-dioxide", 20 },
                { "angels-gas-carbon-dioxide", 60 },
                { "angels-gas-nitrogen",       30 },
            }
        },
        ["fulgora"] = {
            name = "vgal-atm-fulgora",
            planet = "fulgora",
            index = 3,
            energy_required = 2,
            colors = { { 200, 170, 190 }, { 170, 140, 160 }, { 140, 110, 130 } },
            fluid_results = {
                { "angels-gas-oxygen",   10 },
                { "angels-gas-nitrogen", 60 },
                { "angels-gas-residual", 30 },
            }
        },
        ["gleba"] = {
            name = "vgal-atm-gleba",
            planet = "gleba",
            index = 4,
            energy_required = 0.5,
            colors = { { 180, 210, 180 }, { 150, 180, 150 }, { 120, 150, 120 } },
            fluid_results = {
                { "angels-gas-oxygen",            40 },
                { "angels-gas-nitrogen",          50 },
                { "angels-gas-hydrogen-fluoride", 10 },
            }
        },
        ["aquilo"] = {
            name = "vgal-atm-aquilo",
            planet = "aquilo",
            index = 5,
            energy_required = 5,
            colors = { { 200, 210, 250 }, { 140, 150, 215 }, { 80, 90, 180 } },
            fluid_results = {
                { "angels-gas-oxygen",            5 },
                { "angels-gas-ammonia",           70 },
                { "angels-gas-hydrogen-fluoride", 25 },
            }
        },
    }
end
