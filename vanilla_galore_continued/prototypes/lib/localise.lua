---@param recipe vgal.VgalRecipe
function vgal.localise.get_from_group(recipe)
    -- for _, group in ipairs(recipe.groups or {}) do
    --     if group == "analog-circuit" then
    --         return { "recipe-description.vgal-analog-circuit" }
    --     end
    -- end
    return { "recipe-description." .. recipe.name }
end

-- function vgal.localise.get_lazy(product)
--     vgal.log("LL_PRODUCT:" .. product) -- this does log 'LL_PRODUCT:battery-equipment'
--     if product:match("equipment$") then
--         return { "equipment-name." .. product }
--     end
--     local types = {
--         ["item"] = function(p) return data.raw.item[p].place_result and "entity" or "item" end,
--         ["fluid"] = function(_) return "fluid" end,
--         ["item-with-entity-data"] = function(_) return "entity" end,
--     }
--     for categoryKey, func in pairs(types) do
--         if data.raw[categoryKey][product] then
--             return { func(product) .. "-name." .. product }
--         end
--     end
--     return { "item-name." .. product }
-- end

-- function vgal.localise.get_lazy(product)
--     -- vgal.log("LL_PRODUCT:" .. product) -- logs 'LL_PRODUCT:battery-equipment'

--     if product:sub(-9) == "equipment" then
--         return { "equipment-name." .. product }
--     end

--     local item = data.raw.item[product]
--     if item then
--         return { (item.place_result and "entity" or "item") .. "-name." .. product }
--     end

--     if data.raw.fluid[product] then
--         return { "fluid-name." .. product }
--     end

--     if data.raw["item-with-entity-data"][product] then
--         return { "entity-name." .. product }
--     end

--     return { "item-name." .. product }
-- end
function vgal.localise.get_lazy(product)
    if product:sub(-9) == "equipment" then return { "equipment-name." .. product } end
    local item = data.raw.item[product]
    if item then return { (item.place_result and "entity" or "item") .. "-name." .. product } end
    if data.raw.fluid[product] then return { "fluid-name." .. product } end
    return { (data.raw["item-with-entity-data"][product] and "entity" or "item") .. "-name." .. product }
end
