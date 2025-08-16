if not mods["Cerys-Moon-of-Fulgora"] then return end
local handlers = {
    ["engine-unit"] = "engine-unit",
    ["electric-engine-unit"] = "engine-unit",
    ["holmium-plate"] = "holmium-plate",
}
for _, recipe in vgal.data.domain_pairs("vgal", "recipe") do
    if handlers[recipe.main_product] then
        local tech_pre_name = "cerys-" .. handlers[recipe.main_product] .. "-productivity-"
        for i = 1, 10 do
            local tech_key = tech_pre_name .. i
            if data.raw["technology"][tech_key] then
                vgal.tech.add_productivity_change(tech_key, recipe.name)
            else
                break
            end
        end
    end
end
