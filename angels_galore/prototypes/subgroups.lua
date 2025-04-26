local subgroups = {
    -- {
    --     name = "module-angels-bio-yield",
    --     tab = "production",
    --     order = "yd",
    --     entries = { "angels-bio-yield-module", "angels-bio-yield-module-2", "angels-bio-yield-module-3" },
    --     when_settings = { "vgal-modules" },
    -- },
    -- {
    --     name = "refining-machines",
    --     tab = "production",
    --     order = "yd",
    --     entries = { "" },
    -- },
}

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
