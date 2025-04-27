local subgroups = {
    { -- not in use
        name = "module-angels-bio-yield",
        tab = "production",
        order = "yd",
        entries = { "angels-bio-yield-module", "angels-bio-yield-module-2", "angels-bio-yield-module-3" },
        when_settings = { "vgal-modules" },
    },
}

for _, ore_index in ipairs(agal.constants.ORE_INDEXES) do
    local ore_entries = {}
    for _, ore_state in ipairs(agal.constants.ORE_STATES) do
        local ore = "angels-ore" .. ore_index .. "-" .. ore_state
        table.insert(ore_entries, ore)
        vgal.subgroup.clean("angelsore" .. ore_index .. "-" .. ore_state)
        data.raw["recipe"]["angelsore" .. ore_index .. "-" .. ore_state .. "-processing"].subgroup = "vgal-angels-ore" ..
            ore_index
    end
    local order_post
    if ore_index == 3 then
        order_post = "b"
    else
        order_post = "a"
    end
    table.insert(subgroups,
        {
            name = "angels-ore" .. ore_index,
            tab = "resource-refining",
            order = "b[processing]-" .. order_post,
            entries = vgal.table.merge({ "angels-ore1" }, ore_entries),
        }
    )
end

data.raw["item-subgroup"]["geode-processing-1"].order = "e-aa"

-- local ore1_subgroup = {
--     name = "angels-ore1",
--     tab = "production",
--     order = "b[processing]-a",
--     entries = { "angels-ore1", },
-- }
-- local ore3_subgroup = {
--     name = "angels-ore3",
--     tab = "production",
--     order = "b[processing]-a",
--     entries = { "angels-ore3", },
-- }

for _, ore_index, ore_state in vgal.table.nipairs(agal.constants.ORE_INDEXES, agal.constants.ORE_STATES) do
    local ore = "angelsore" .. ore_index .. "-" .. ore_state
end

local toClean = {
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
