vgal.throw = vgal.throw or {}


---@param recipe_name string
function vgal.throw.if_recipe_not_found(recipe_name)
    vgal.throw.if_param_nil(recipe_name, "recipe_name")

    local recipe = data.raw["recipe"][recipe_name]
    if not recipe then
        error("Recipe '" .. recipe_name .. "' not found")
    end

    return recipe
end

---@param tech_name string
function vgal.throw.if_tech_not_found(tech_name)
    vgal.throw.if_param_nil(tech_name, "tech_name")

    local tech = data.raw["technology"][tech_name]
    if not tech then
        error("Technology '" .. tech_name .. "' not found")
    end

    return tech
end

---@param fluid_name string
function vgal.throw.if_fluid_not_found(fluid_name)
    vgal.throw.if_param_nil(fluid_name, "fluid_name")

    local fluid = data.raw["fluid"][fluid_name]
    if not fluid then
        error("Fluid '" .. fluid_name .. "' not found")
    end

    return fluid
end

---@param param_value any?
---@param param_name string
function vgal.throw.if_param_nil(param_value, param_name)
    if param_value == nil then
        if param_name then
            error("Parameter with name '" .. param_name .. "' cannot be nil.")
        end
    end
end

function vgal.throw.not_implemented()
    error("Function not implemented.")
end
