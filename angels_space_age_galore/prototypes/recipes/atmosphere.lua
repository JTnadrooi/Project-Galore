for _, atm in pairs(vgal.defines.atmospheres) do
    local unlock_tech = "planet-discovery-" .. atm.planet
    local separation_category = "angels-advanced-chemistry"
    if #atm.results < 3 then
        separation_category = "chemistry"
    end

    if atm.planet == "nauvis" then
        unlock_tech = "angels-nitrogen-processing-1"
    end

    local separation_energy_required = (separation_category == "chemistry") and 1 or 0.5

    vgal.extend({
        {
            name = atm.name,
            domain = "vgal",
            icons = vgal.icon.create({
                style   = "angels-gas",
                outputs = { atm.name },
                palette = atm.colors,
            }),
            energy_required = atm.energy_required,
            technology = unlock_tech,
            results = {
                { atm.name, 200 }
            },
            category = "angels-petrochem-air-filtering",
            surface_conditions = vgal.get_surface_conditions_for(atm.planet)
        },
        {
            name = atm.name .. "-separation",
            domain = "vgal",
            icons = vgal.icon.create({
                style   = "angels-gas",
                outputs = vgal.table.select(atm.results, function(f) return f[1] end),
                palette = atm.colors,
            }),
            energy_required = separation_energy_required,
            technology = unlock_tech,
            ingredients = {
                { atm.name, 100 }
            },
            results = atm.results,
            category = separation_category,
            order = "c" .. vgal.subgroup.order_from_number(atm.index),
        },
    }, {
        type = "recipe",
    })
end

vgal.extend({
    {
        name = "simple-angels-gas-puffer-atmosphere",
        prefix = "vgal",
        icons = vgal.icon.create({
            style   = "angels-gas",
            inputs  = { "vgal-atm-gleba" },
            outputs = { "angels-gas-puffer-atmosphere" },
            palette = { { 194, 227, 091 }, { 184, 239, 000 }, { 156, 207, 000 } },
        }),
        energy_required = 2,
        technology = "angels-bio-refugium-puffer-1",
        ingredients = {
            { "vgal-atm-gleba",            100 },
            { "angels-gas-sulfur-dioxide", 25 },
        },
        results = {
            { "angels-gas-puffer-atmosphere", 50 },
        },
        category = "chemistry",
    },
}, {
    type = "recipe",
})
