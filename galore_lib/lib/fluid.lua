vgal.fluid = vgal.fluid or {}

---@param fluid_name string
---@return data.RecipeTints
function vgal.fluid.get_recipe_tint(fluid_name)
    local function to_rgba(color)
        return {
            r = color[1] or 1,
            g = color[2] or 1,
            b = color[3] or 1,
            a = color[4] or 1,
        }
    end

    local fluid = vgal.throw.if_fluid_not_found(fluid_name)
    return {
        primary = to_rgba(fluid.base_color),
        secondary = to_rgba(fluid.flow_color or fluid.base_color or { 0.8, 0.8, 0.8, 1 }),
        tertiary = to_rgba(fluid.base_color),
        quaternary = to_rgba(fluid.base_color),
    }
end

---@param fluid_or_fluid_name string|data.FluidPrototype
function vgal.fluid.hide(fluid_or_fluid_name)
    local fluid = vgal.get_from_prototype_or_prototype_name(fluid_or_fluid_name, "fluid")

    vgal.data.hide(fluid)
end
