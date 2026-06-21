for _, atm in pairs(vgal.defines.atmospheres) do
    local unlock_tech = "planet-discovery-" .. atm.planet
    local separation_category = "angels-advanced-chemistry"
    if #atm.fluid_results < 3 then
        separation_category = "chemistry"
    end

    if atm.planet == "nauvis" then
        unlock_tech = "angels-nitrogen-processing-1"
    end

    vgal.data.extend({
        {
            name = atm.name,
            domain = "vgal",
            icons = angelsmods.functions.create_gas_recipe_icon(
                { atm.name },
                atm.colors
            ),
            energy_required = atm.energy_required,
            technology = unlock_tech,
            fluid_results = {
                { atm.name, 200 }
            },
            category = "angels-petrochem-air-filtering",
            surface_conditions = vgal.get_surface_conditions_for(atm.planet)
        },
        {
            name = atm.name .. "-separation",
            domain = "vgal",
            icons = angelsmods.functions.create_gas_recipe_icon(
                vgal.icon.map_to_angels_molecule_icons(vgal.table.select(atm.fluid_results, function(f)
                    return f[1]
                end)),
                atm.colors
            ),
            energy_required = 1,
            technology = unlock_tech,
            fluid_ingredients = {
                { atm.name, 100 }
            },
            results = atm.results,
            fluid_results = atm.fluid_results,
            category = separation_category,
            order = "c" .. vgal.subgroup.order_from_number(atm.index),
        },
    }, {
        type = "recipe",
    })
end

vgal.data.extend({
    {
        name = "simple-angels-gas-puffer-atmosphere",
        prefix = "vgal",
        icons = angelsmods.functions.create_gas_recipe_icon(
            nil,
            { { 194, 227, 091 }, { 184, 239, 000 }, { 156, 207, 000 } }, { "vgal-atm-gleba", }
        ),
        energy_required = 2,
        technology = "angels-bio-refugium-puffer-1",
        fluid_ingredients = {
            { "vgal-atm-gleba",            100 },
            { "angels-gas-sulfur-dioxide", 25 },
        },
        fluid_results = {
            { "angels-gas-puffer-atmosphere", 50 },
        },
        category = "chemistry",
    },
}, {
    type = "recipe",
})
