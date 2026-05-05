---@type vgal.SubgroupOverrideCollection[]
local subgroups = {
    -- LOGISTICS
    {
        name = "belt-t1",
        group = "logistics",
        order = "baa",
        entries = { "transport-belt", "splitter", "underground-belt" },
        when_settings = { "vgal-belts" },
    },
    {
        name = "belt-t2",
        group = "logistics",
        order = "bab",
        entries = { "fast-transport-belt", "fast-splitter", "fast-underground-belt" },
        when_settings = { "vgal-belts" },
    },
    {
        name = "belt-t3",
        group = "logistics",
        order = "bac",
        entries = { "express-transport-belt", "express-splitter", "express-underground-belt" },
        when_settings = { "vgal-belts" },
    },
    {
        name = "fluid-distribution",
        group = "logistics",
        order = "da",
        entries = { "pipe", "pipe-to-ground", "storage-tank", "pump" },
        when_settings = { "vgal-buildings" },
    },
    {
        name = "rolling-stock",
        group = "logistics",
        order = "eb",
        entries = { "locomotive", "cargo-wagon", "fluid-wagon", "artillery-wagon" },
    },
    -- PRODUCTION
    {
        name = "assembing-machine",
        group = "production",
        order = "eb",
        entries = { "assembling-machine-1", "assembling-machine-2", "assembling-machine-3" }
    },
    {
        name = "beacon",
        group = "production",
        order = "fb",
        entries = { "beacon" }
    },
    {
        name = "nuclear-energy",
        group = "production",
        order = "bb",
        entries = { "nuclear-reactor", "heat-exchanger", "heat-pipe", "steam-turbine" }
    },
    -- INTERMEDIATES
    {
        name = "oil",
        group = "intermediate-products",
        order = "ab",
        entries = {},
        recipe_entries = {
            "advanced-oil-processing",
            "basic-oil-processing",
            "coal-liquefaction",
            "heavy-oil-cracking",
            "light-oil-cracking",
        }
    },
    {
        name = "chemistry-products",
        group = "intermediate-products",
        order = "cb",
        entries = { "battery", "plastic-bar", "explosives" }
    },
    {
        name = "basic-intermediate-products",
        group = "intermediate-products",
        order = "cb",
        entries = { "iron-gear-wheel", "copper-cable", "iron-stick" }
    },
    {
        name = "smelting",
        group = "intermediate-products",
        order = "cc",
        entries = { "iron-plate", "copper-plate", "steel-plate" }
    },
    {
        name = "fuels", -- but not uranium fuel cells.
        group = "intermediate-products",
        order = "ga",
        entries = { "solid-fuel", "rocket-fuel", "nuclear-fuel" },
        cleaning_entries = { "solid-fuel-from-light-oil", "solid-fuel-from-heavy-oil", "solid-fuel-from-petroleum-gas", }
    },
    {
        name = "engines",
        group = "intermediate-products",
        order = "gb",
        entries = { "engine-unit", "electric-engine-unit" }
    },
    {
        name = "circuits-t1",
        group = "intermediate-products",
        order = "gca",
        entries = { "electronic-circuit" }
    },
    {
        name = "circuits-t2",
        group = "intermediate-products",
        order = "gcb",
        entries = { "advanced-circuit", }
    },
    {
        name = "circuits-t3",
        group = "intermediate-products",
        order = "gcc",
        entries = { "processing-unit" }
    },
    {
        name = "ammo-magazine",
        group = "combat",
        order = "bb",
        entries = {
            "firearm-magazine",
            "piercing-rounds-magazine",
            "uranium-rounds-magazine",
            "shotgun-shell",
            "piercing-shotgun-shell",
        }
    },
    {
        name = "vehicle-ammo",
        group = "combat",
        order = "bc",
        entries = {
            "cannon-shell",
            "explosive-cannon-shell",
            "uranium-cannon-shell",
            "explosive-uranium-cannon-shell",
            "rocket",
            "explosive-rocket",
            "atomic-bomb",
        }
    },
    {
        name = "barrels",
        group = "intermediate-products",
        order = "gd",
        entries = { "barrel" }
    },
    {
        name = "rocket-parts",
        group = "intermediate-products",
        order = "ge",
        entries = { "rocket-part" }
    },
    {
        name = "automation-science-pack",
        group = "intermediate-products",
        order = "y",
        entries = { "automation-science-pack" },
        when_settings = { "vgal-science-packs" },
    },
    {
        name = "logistic-science-pack",
        group = "intermediate-products",
        order = "ya",
        entries = { "logistic-science-pack" },
        when_settings = { "vgal-science-packs" },
    },
    {
        name = "military-science-pack",
        group = "intermediate-products",
        order = "yb",
        entries = { "military-science-pack" },
        when_settings = { "vgal-science-packs" },
    },
    {
        name = "chemical-science-pack",
        group = "intermediate-products",
        order = "yc",
        entries = { "chemical-science-pack" },
        when_settings = { "vgal-science-packs" },
    },
    {
        name = "production-science-pack",
        group = "intermediate-products",
        order = "yd",
        entries = { "production-science-pack" },
        when_settings = { "vgal-science-packs" },
    },
    {
        name = "utility-science-pack",
        group = "intermediate-products",
        order = "ye",
        entries = { "utility-science-pack" },
        when_settings = { "vgal-science-packs" },
    },
    -- {
    --     name = "chests",
    --     group = "production",
    --     order = "a",
    --     entries = { "wooden-chest", "iron-chest", "steel-chest", "active-provider-chest", "passive-provider-chest", "storage-chest", "buffer-chest", "requester-chest" },
    -- },
    {
        name = "module-speed",
        group = "production",
        order = "fb-a",
        entries = { "speed-module", "speed-module-2", "speed-module-3" },
        when_settings = { "vgal-modules" },
    },
    {
        name = "module-efficiency",
        group = "production",
        order = "fb-b",
        entries = { "efficiency-module", "efficiency-module-2", "efficiency-module-3" },
        when_settings = { "vgal-modules" },
    },
    {
        name = "module-productivity",
        group = "production",
        order = "fb-c",
        entries = { "productivity-module", "productivity-module-2", "productivity-module-3" },
        when_settings = { "vgal-modules" },
    },
    {
        name = "module-quality",
        group = "production",
        order = "fb-d",
        entries = { "quality-module", "quality-module-2", "quality-module-3" },
        when_settings = { "vgal-modules" },
        when = not not mods["quality"]
    },
}

vgal.subgroup.process_override_subgroups(subgroups)

vgal.subgroup.set_for("heavy-oil", "fluid-recipes")
vgal.subgroup.set_for("light-oil", "fluid-recipes")
vgal.subgroup.set_for("petroleum-gas", "fluid-recipes")
vgal.subgroup.set_for("sulfuric-acid", "fluid-recipes")
vgal.subgroup.set_for("lubricant", "fluid-recipes")
vgal.subgroup.set_for("steam", "fluid-recipes")
