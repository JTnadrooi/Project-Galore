vgal.defines = vgal.defines or {}

vgal.defines.metals = {
    iron = {
        name = "iron",
        ore = "iron-ore",
        plate = "iron-plate",
    },
    copper = {
        name = "copper",
        ore = "copper-ore",
        plate = "copper-plate",
    },
}

vgal.defines.modules = {
    ["productivity-module"] = {
        name = "productivity-module",
        tiers = {
            "productivity-module",
            "productivity-module-2",
            "productivity-module-3",
        },
    },
    ["speed-module"] = {
        name = "speed-module",
        tiers = {
            "speed-module",
            "speed-module-2",
            "speed-module-3",
        },
    },
    ["efficiency-module"] = {
        name = "efficiency-module",
        tiers = {
            "efficiency-module",
            "efficiency-module-2",
            "efficiency-module-3",
        },
    },
}

vgal.defines.recipeable_categories = { "item", "fluid", "tool", "ammo", "capsule", "module", "repair-tool", "armor",
    "item-with-entity-data",
    "rail-planner", "gun" }

-- commentedbc: this list would be huge.
-- vgal.defines.entityable_categories = { "entity-with-owner", "simple-entity", "container" }

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
