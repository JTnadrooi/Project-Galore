function vgal.fluid.get_tint(fluidName)
    local function to_rgba(color)
        return {
            r = color[1] or 1,
            g = color[2] or 1,
            b = color[3] or 1,
            a = color[4] or 1,
        }
    end
    local fluid = data.raw["fluid"][fluidName]
    return {
        primary = to_rgba(fluid.base_color or { 1, 1, 1, 1 }),
        secondary = to_rgba(fluid.flow_color or fluid.base_color or { 0.8, 0.8, 0.8, 1 }),
        tertiary = to_rgba(fluid.base_color or { 1, 1, 1, 1 }),
        quaternary = to_rgba(fluid.base_color or { 1, 1, 1, 1 }),
    }
end
