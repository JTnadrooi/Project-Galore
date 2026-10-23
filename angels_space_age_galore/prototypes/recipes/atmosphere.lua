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
    local compressing_energy_required = 1
    if not data.raw["planet"][atm.planet] then
        error("Planet doesn't exist: " .. atm.planet)
    elseif data.raw["planet"][atm.planet].surface_properties and data.raw["planet"][atm.planet].surface_properties["pressure"] then
        compressing_energy_required = (1000 / data.raw["planet"][atm.planet].surface_properties["pressure"]) ^ (10 / 7)
        if compressing_energy_required > 5 then
            compressing_energy_required = math.floor(compressing_energy_required)
        elseif compressing_energy_required < 1 then
            compressing_energy_required = 0.5
        else
            compressing_energy_required = math.ceil(compressing_energy_required)
        end
        compressing_energy_required = vgal.math.vanillize_number(compressing_energy_required, "time")
    end

    vgal.extend({
        {
            name = atm.name,
            domain = "vgal",
            icons = vgal.icon.create({
                style   = "angels-gas",
                outputs = { atm.name },
                palette = atm.colors,
            }),
            energy_required = compressing_energy_required,
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
            categories = { separation_category, "cryogenics" },
            order = "c" .. atm.order,

            localised_description = { "", "[img=fluid/" .. atm.name .. "]", { "vgal-internal.atm-recipe-prepending" }, "[img=space-location/" .. atm.planet .. "]", { "vgal-internal.atm-recipe-appending" } }
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
