function subGroup(name, newSubgroup)
    if data.raw["item"][name] then
        data.raw["item"][name].subgroup = newSubgroup
    elseif data.raw["tool"][name] then
        data.raw["tool"][name].subgroup = newSubgroup
    elseif data.raw["fluid"][name] then
        data.raw["fluid"][name].subgroup = newSubgroup
    elseif data.raw["ammo"][name] then
        data.raw["ammo"][name].subgroup = newSubgroup
    else
        error("item '" .. name .. "' does not exist")
    end
    if data.raw["recipe"][name] then
        data.raw["recipe"][name].subgroup = nil
        data.raw["recipe"][name].order = nil
    end
end

local subgroups = {
    -- LOGISTICS
    {
        name = "belt-t1",
        group = "logistics",
        order = "baa",
        values = { "transport-belt", "splitter", "underground-belt" }
    },
    {
        name = "belt-t2",
        group = "logistics",
        order = "bab",
        values = { "fast-transport-belt", "fast-splitter", "fast-underground-belt" }
    },
    {
        name = "belt-t3",
        group = "logistics",
        order = "bac",
        values = { "express-transport-belt", "express-splitter", "express-underground-belt" }
    },
    -- PRODUCTION
    {
        name = "assembing-machine",
        group = "production",
        order = "eb",
        values = { "assembling-machine-1", "assembling-machine-2", "assembling-machine-3" }
    },
    {
        name = "beacon",
        group = "production",
        order = "fb",
        values = { "beacon" }
    },
    {
        name = "nuclear-energy",
        group = "production",
        order = "bb",
        values = { "nuclear-reactor", "heat-exchanger", "heat-pipe", "steam-turbine" }
    },
    -- INTERMEDIATES
    {
        name = "chemistry-products",
        group = "intermediate-products",
        order = "cb",
        values = { "battery", "plastic-bar", "explosives" }
    },
    {
        name = "basic-intermediate-products",
        group = "intermediate-products",
        order = "cb",
        values = { "iron-gear-wheel", "copper-cable", "iron-stick" }
    },
    {
        name = "smelting",
        group = "intermediate-products",
        order = "cc",
        values = { "iron-plate", "copper-plate", "steel-plate" }
    },
    {
        name = "fuels", -- but not uranium fuel cells.
        group = "intermediate-products",
        order = "ga",
        values = { "solid-fuel", "rocket-fuel", "nuclear-fuel" }
    },
    {
        name = "engines",
        group = "intermediate-products",
        order = "gb",
        values = { "engine-unit", "electric-engine-unit" }
    },
    {
        name = "circuits-t1",
        group = "intermediate-products",
        order = "gca",
        values = { "electronic-circuit" }
    },
    {
        name = "circuits-t2",
        group = "intermediate-products",
        order = "gcb",
        values = { "advanced-circuit", }
    },
    {
        name = "circuits-t3",
        group = "intermediate-products",
        order = "gcc",
        values = { "processing-unit" }
    },
    {
        name = "ammo-magazine",
        group = "combat",
        order = "bb",
        values = {
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
        values = {
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
        values = { "barrel" }
    },
    {
        name = "rocket-parts",
        group = "intermediate-products",
        order = "ge",
        values = { "rocket-part" }
    },
    {
        name = "automation-science-pack",
        group = "intermediate-products",
        order = "y",
        values = { "automation-science-pack" }
    },
    {
        name = "logistic-science-pack",
        group = "intermediate-products",
        order = "ya",
        values = { "logistic-science-pack" }
    },
    {
        name = "military-science-pack",
        group = "intermediate-products",
        order = "yb",
        values = { "military-science-pack" }
    },
    {
        name = "chemical-science-pack",
        group = "intermediate-products",
        order = "yc",
        values = { "chemical-science-pack" }
    },
    {
        name = "production-science-pack",
        group = "intermediate-products",
        order = "yd",
        values = { "production-science-pack" }
    },
    {
        name = "utility-science-pack",
        group = "intermediate-products",
        order = "ye",
        values = { "utility-science-pack" }
    },
}

local toClean = {
    "solid-fuel-from-light-oil", "solid-fuel-from-heavy-oil", "solid-fuel-from-petroleum-gas"
}
for _, value in ipairs(toClean) do
    data.raw["recipe"][value].order = nil
    data.raw["recipe"][value].subgroup = nil
end
local subgroupDefinitions = {}
for _, subgroup in ipairs(subgroups) do
    table.insert(subgroupDefinitions, {
        type = "item-subgroup",
        name = "vgal-" .. subgroup.name,
        group = subgroup.group,
        order = subgroup.order
    })
    for _, value in ipairs(subgroup.values) do
        subGroup(value, "vgal-" .. subgroup.name)
    end
end

data:extend(subgroupDefinitions)
