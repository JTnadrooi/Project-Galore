data:extend({
    {
        type = "fluid",
        name = "vgal-naphtha-sludge",
        icons = angelsmods.functions.create_viscous_liquid_fluid_icon(
            nil,
            { { 138, 053, 060 }, { 178, 102, 036 }, nil, nil, { 171, 161, 055 } }
        ),
        -- icons = angelsmods.functions.create_viscous_liquid_fluid_icon(nil, { { 196, 075, 085 }, { 171, 161, 055 } }),
        subgroup = "vgal-fulgora-fluids",
        order = "a",
        default_temperature = 0,
        heat_capacity = "0.1kJ",
        base_color = { r = 0.7, g = 0.4, b = 0.4 },
        flow_color = { r = 0.8, g = 0.5, b = 0.5 },
        max_temperature = 0,
    },
})

for _, atm in pairs(vgal.defines.atmospheres) do
    data:extend({
        {
            type = "fluid",
            name = atm.name,
            icons = angelsmods.functions.create_gas_fluid_icon(
                nil,
                atm.colors
            ),
            subgroup = "angels-petrochem-basic-fluids",
            order = "b" .. vgal.subgroup.order_from_number(atm.index),
            default_temperature = 0,
            gas_temperature = 0,
            heat_capacity = "0.1kJ",
            base_color = { r = atm.colors[1][1] / 255, g = atm.colors[1][2] / 255, b = atm.colors[1][3] / 255 },
            flow_color = { r = atm.colors[3][1] / 255, g = atm.colors[3][2] / 255, b = atm.colors[3][3] / 255 },
            max_temperature = 0,
        },
    })
end
