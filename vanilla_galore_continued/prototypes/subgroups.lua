local subgroups = {
    -- LOGISTICS
    {
        name = "belt-t1",
        tab = "logistics",
        order = "baa",
        entries = { "transport-belt", "splitter", "underground-belt" }
    },
    {
        name = "belt-t2",
        tab = "logistics",
        order = "bab",
        entries = { "fast-transport-belt", "fast-splitter", "fast-underground-belt" }
    },
    {
        name = "belt-t3",
        tab = "logistics",
        order = "bac",
        entries = { "express-transport-belt", "express-splitter", "express-underground-belt" }
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
        entries = { "automation-science-pack" }
    },
    {
        name = "logistic-science-pack",
        tab = "intermediate-products",
        order = "ya",
        entries = { "logistic-science-pack" }
    },
    {
        name = "military-science-pack",
        tab = "intermediate-products",
        order = "yb",
        entries = { "military-science-pack" }
    },
    {
        name = "chemical-science-pack",
        tab = "intermediate-products",
        order = "yc",
        entries = { "chemical-science-pack" }
    },
    {
        name = "production-science-pack",
        tab = "intermediate-products",
        order = "yd",
        entries = { "production-science-pack" }
    },
    {
        name = "utility-science-pack",
        tab = "intermediate-products",
        order = "ye",
        entries = { "utility-science-pack" }
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
    vgal.subgroup.new("vgal-" .. value.name, value.entries, value.tab, value.order)
end

vgal.subgroup.set_item_or_fluid("heavy-oil", "fluid-recipes")
vgal.subgroup.set_item_or_fluid("light-oil", "fluid-recipes")
vgal.subgroup.set_item_or_fluid("petroleum-gas", "fluid-recipes")
