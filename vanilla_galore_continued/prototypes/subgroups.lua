local subgroups = {
    -- LOGISTICS
    {
        name = "belt-t1",
        tab = "logistics",
        order = "baa",
        entries = { "transport-belt", "splitter", "underground-belt" },
        when_settings = { "vgal-belts" },
    },
    {
        name = "belt-t2",
        tab = "logistics",
        order = "bab",
        entries = { "fast-transport-belt", "fast-splitter", "fast-underground-belt" },
        when_settings = { "vgal-belts" },
    },
    {
        name = "belt-t3",
        tab = "logistics",
        order = "bac",
        entries = { "express-transport-belt", "express-splitter", "express-underground-belt" },
        when_settings = { "vgal-belts" },
    },
    {
        name = "fluid-distribution",
        tab = "logistics",
        order = "da",
        entries = { "pipe", "pipe-to-ground", "storage-tank", "pump" },
        when_settings = { "vgal-buildings" },
    },
    -- PRODUCTION
    {
        name = "assembing-machine",
        tab = "production",
        order = "eb",
        entries = { "assembling-machine-1", "assembling-machine-2", "assembling-machine-3" }
    },
    {
        name = "beacon",
        tab = "production",
        order = "fb",
        entries = { "beacon" }
    },
    {
        name = "nuclear-energy",
        tab = "production",
        order = "bb",
        entries = { "nuclear-reactor", "heat-exchanger", "heat-pipe", "steam-turbine" }
    },
    -- INTERMEDIATES
    {
        name = "oil",
        tab = "intermediate-products",
        order = "ab",
        entries = {}
    },
    {
        name = "chemistry-products",
        tab = "intermediate-products",
        order = "cb",
        entries = { "battery", "plastic-bar", "explosives" }
    },
    {
        name = "basic-intermediate-products",
        tab = "intermediate-products",
        order = "cb",
        entries = { "iron-gear-wheel", "copper-cable", "iron-stick" }
    },
    {
        name = "smelting",
        tab = "intermediate-products",
        order = "cc",
        entries = { "iron-plate", "copper-plate", "steel-plate" }
    },
    {
        name = "fuels", -- but not uranium fuel cells.
        tab = "intermediate-products",
        order = "ga",
        entries = { "solid-fuel", "rocket-fuel", "nuclear-fuel" }
    },
    {
        name = "engines",
        tab = "intermediate-products",
        order = "gb",
        entries = { "engine-unit", "electric-engine-unit" }
    },
    {
        name = "circuits-t1",
        tab = "intermediate-products",
        order = "gca",
        entries = { "electronic-circuit" }
    },
    {
        name = "circuits-t2",
        tab = "intermediate-products",
        order = "gcb",
        entries = { "advanced-circuit", }
    },
    {
        name = "circuits-t3",
        tab = "intermediate-products",
        order = "gcc",
        entries = { "processing-unit" }
    },
    {
        name = "ammo-magazine",
        tab = "combat",
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
        tab = "combat",
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
        tab = "intermediate-products",
        order = "gd",
        entries = { "barrel" }
    },
    {
        name = "rocket-parts",
        tab = "intermediate-products",
        order = "ge",
        entries = { "rocket-part" }
    },
    {
        name = "automation-science-pack",
        tab = "intermediate-products",
        order = "y",
        entries = { "automation-science-pack" },
        when_settings = { "vgal-science-packs" },
    },
    {
        name = "logistic-science-pack",
        tab = "intermediate-products",
        order = "ya",
        entries = { "logistic-science-pack" },
        when_settings = { "vgal-science-packs" },
    },
    {
        name = "military-science-pack",
        tab = "intermediate-products",
        order = "yb",
        entries = { "military-science-pack" },
        when_settings = { "vgal-science-packs" },
    },
    {
        name = "chemical-science-pack",
        tab = "intermediate-products",
        order = "yc",
        entries = { "chemical-science-pack" },
        when_settings = { "vgal-science-packs" },
    },
    {
        name = "production-science-pack",
        tab = "intermediate-products",
        order = "yd",
        entries = { "production-science-pack" },
        when_settings = { "vgal-science-packs" },
    },
    {
        name = "utility-science-pack",
        tab = "intermediate-products",
        order = "ye",
        entries = { "utility-science-pack" },
        when_settings = { "vgal-science-packs" },
    },
    -- {
    --     name = "chests",
    --     tab = "production",
    --     order = "a",
    --     entries = { "wooden-chest", "iron-chest", "steel-chest", "active-provider-chest", "passive-provider-chest", "storage-chest", "buffer-chest", "requester-chest" },
    -- },
    {
        name = "module-speed",
        tab = "production",
        order = "ya",
        entries = { "speed-module", "speed-module-2", "speed-module-3" },
        when_settings = { "vgal-modules" },
    },
    {
        name = "module-efficiency",
        tab = "production",
        order = "yb",
        entries = { "efficiency-module", "efficiency-module-2", "efficiency-module-3" },
        when_settings = { "vgal-modules" },
    },
    {
        name = "module-productivity",
        tab = "production",
        order = "yc",
        entries = { "productivity-module", "productivity-module-2", "productivity-module-3" },
        when_settings = { "vgal-modules" },
    },
    {
        name = "module-quality",
        tab = "production",
        order = "yd",
        entries = { "quality-module", "quality-module-2", "quality-module-3" },
        when_settings = { "vgal-modules" },
        when = not not mods["quality"]
    },
}

local toClean = {
    "solid-fuel-from-light-oil", "solid-fuel-from-heavy-oil", "solid-fuel-from-petroleum-gas", "nuclear-fuel"
}
for _, value in ipairs(toClean) do
    data.raw["recipe"][value].order = nil
    data.raw["recipe"][value].subgroup = nil
end

for _, value in ipairs(subgroups) do
    if value.when == nil then
        value.when = true
    end
    for _, whenItem in ipairs(value.when_settings or {}) do
        if not settings.startup[whenItem].value then
            value.entries = {}
        end
    end
    if not value.when then
        value.entries = {}
    end
    vgal.subgroup.new("vgal-" .. value.name, value.entries, value.tab, value.order)
end

-- if not settings.startup["vgal-science-packs"].value then
--     local packs = { "automation", "logistic", "military", "chemical", "production", "utility" }
--     for _, pack in ipairs(packs) do
--         data.raw["tool"][pack .. "-science-pack"].subgroup = "science-pack"
--     end
-- end

vgal.subgroup.set_item_or_fluid("heavy-oil", "fluid-recipes")
vgal.subgroup.set_item_or_fluid("light-oil", "fluid-recipes")
vgal.subgroup.set_item_or_fluid("petroleum-gas", "fluid-recipes")
vgal.subgroup.set_item_or_fluid("sulfuric-acid", "fluid-recipes")
vgal.subgroup.set_item_or_fluid("lubricant", "fluid-recipes")
vgal.subgroup.set_item_or_fluid("steam", "fluid-recipes")

data.raw["recipe"]["heavy-oil-cracking"].subgroup = "vgal-oil"
data.raw["recipe"]["light-oil-cracking"].subgroup = "vgal-oil"
data.raw["recipe"]["advanced-oil-processing"].subgroup = "vgal-oil"
data.raw["recipe"]["basic-oil-processing"].subgroup = "vgal-oil"

data.raw["recipe"]["coal-liquefaction"].subgroup = "vgal-oil"

for _, value in ipairs(toClean) do
    vgal.subgroup.restore(value)
end
