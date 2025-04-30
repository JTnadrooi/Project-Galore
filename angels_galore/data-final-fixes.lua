require("overrides.angels-overrides-final-fixes")

for _, tech in pairs(data.raw.technology) do
    if tech.unit then
        -- for index, value in ipairs(tech.unit.ingredients or {}) do
        --     if value[1] == "military-science-pack" then
        --         table.remove(tech.unit.ingredients, index)
        --     end
        -- end
        tech.unit.time = 5
    end
end
