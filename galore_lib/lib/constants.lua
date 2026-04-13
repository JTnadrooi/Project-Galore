vgal.constants = vgal.constants or {}

vgal.constants.METALS = {
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

vgal.constants.MODULES = {
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

vgal.constants.RECIPEABLE_CATEGORIES = { "item", "fluid", "tool", "ammo", "capsule", "module", "repair-tool", "armor",
    "item-with-entity-data",
    "rail-planner", "gun" }

-- commentedbc: this list would be huge.
-- vgal.constants.ENTITYABLE_CATEGORIES = { "entity-with-owner", "simple-entity", "container" }
