vgal.throw = vgal.throw or {}

function vgal.throw.if_recipe_not_found(recipe_name)
    local recipe = data.raw["recipe"][recipe_name]
    if not recipe then
        error("Recipe '" .. recipe_name .. "' not found")
    end
    return recipe
end

function vgal.throw.if_tech_not_found(tech_name)
    local tech = data.raw["technology"][tech_name]
    if not tech then
        error("Technology '" .. tech_name .. "' not found")
    end
    return tech
end

function vgal.throw.if_fluid_not_found(fluid_name)
    local fluid = data.raw["fluid"][fluid_name]
    if not fluid then
        error("Fluid '" .. fluid_name .. "' not found")
    end
    return fluid
end
