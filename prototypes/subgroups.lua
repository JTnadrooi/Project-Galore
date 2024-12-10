function subGroup(name, newSubgroup)
    if data.raw["item"][name] then
        data.raw["item"][name].subgroup = newSubgroup
    elseif data.raw["tool"][name] then
        data.raw["tool"][name].subgroup = newSubgroup
    elseif data.raw["fluid"][name] then
        data.raw["fluid"][name].subgroup = newSubgroup
    else
        error("item '" .. name .. "' does not exist")
    end
    if data.raw["recipe"][name] then
        data.raw["recipe"][name].subgroup = nil
        data.raw["recipe"][name].order = nil
    end
end

local subgroups = {
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
        name = subgroup.name,
        group = subgroup.group,
        order = subgroup.order
    })

    for _, value in ipairs(subgroup.values) do
        subGroup(value, subgroup.name)
    end
end

data:extend(subgroupDefinitions)
