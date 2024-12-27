---@param recipe vgal.VgalRecipe
function vgal.localise.get_from_group(recipe)
    for _, group in ipairs(recipe.groups or {}) do
        if group == "analog-circuit" then
            return { "recipe-description.vgal-analog-circuit" }
        end
    end
    return { "recipe-description." .. recipe.name }
end
function vgal.localise.get_lazy(product)
    if data.raw.item[product] then
        if data.raw.item[product].place_result then
            return { "entity-name." .. product }
        end
        return { "item-name." .. product }
    elseif data.raw.fluid[product] then
        return { "fluid-name." .. product }
    elseif data.raw["item-with-entity-data"][product] then
        return { "entity-name." .. product }
    else
        return { "item-name." .. product }
    end
end
