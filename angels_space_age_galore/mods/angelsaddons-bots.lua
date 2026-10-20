if not mods["angelsaddons-bots"] then return end

-- make post fulgora
vgal.tech.add_science_pack_prerequisite_and_unit("angels-cargo-robots-3", "electromagnetic-science-pack")
vgal.tech.add_science_pack_prerequisite_and_unit("angels-construction-robots-3", "electromagnetic-science-pack")

-- update recipes
-- for _, post_network_tech_name in ipairs({ "angels-zone-expander-3", "angels-relay-station-3" }) do
--     vgal.recipe.set_ingredient_amount("angels-relay-station-3", 25, "processing-unit")
--     vgal.recipe.set_ingredient_amount("angels-relay-station-3", 25, "processing-unit")
-- end
data.raw["recipe"]["angels-relay-station-3"].ingredients = vgal.build.io({
    { "electrolyte",            50 },
    { "supercapacitor",         5 },
    { "steel-plate",            20 },
    { "processing-unit",        25 },
    { "angels-relay-station-2", 2 },
})
data.raw["recipe"]["angels-relay-station-3"].surface_conditions = vgal.get_surface_conditions_for("fulgora")
data.raw["item"]["angels-relay-station-3"].default_import_location = "fulgora"
vgal.recipe.replace_category("angels-relay-station-3", "crafting", "crafting-with-fluid")

data.raw["recipe"]["angels-zone-expander-3"].ingredients = vgal.build.io({
    { "superconductor",         15 },
    { "steel-plate",            20 },
    { "processing-unit",        25 },
    { "angels-zone-expander-2", 2 },
})
data.raw["recipe"]["angels-zone-expander-3"].surface_conditions = vgal.get_surface_conditions_for("fulgora")
data.raw["item"]["angels-zone-expander-3"].default_import_location = "fulgora"

data.raw["recipe"]["angels-construction-zone-expander-3"].ingredients = vgal.build.io({
    { "superconductor",                      15 },
    { "steel-plate",                         20 },
    { "processing-unit",                     25 },
    { "angels-construction-zone-expander-2", 2 },
})
data.raw["recipe"]["angels-construction-zone-expander-3"].surface_conditions = vgal.get_surface_conditions_for("fulgora")
data.raw["item"]["angels-construction-zone-expander-3"].default_import_location = "fulgora"

vgal.recipe.add_ingredient("angels-cargo-hub", { "superconductor", 20 })
data.raw["recipe"]["angels-cargo-hub"].surface_conditions = vgal.get_surface_conditions_for("fulgora")
data.raw["item"]["angels-cargo-hub"].default_import_location = "fulgora"

data.raw["recipe"]["angels-cargo-robot-2"].ingredients = vgal.build.io({
    { "superconductor",       1 },
    { "steel-plate",          5 },
    { "processing-unit",      5 },
    { "electric-engine-unit", 5 },
    { "angels-cargo-robot",   1 },
})
data.raw["recipe"]["angels-cargo-robot-2"].surface_conditions = vgal.get_surface_conditions_for("fulgora")
data.raw["item"]["angels-cargo-robot-2"].default_import_location = "fulgora"

vgal.tech.move_recipe("angels-cargo-robots-2", "angels-cargo-robots-3", "angels-cargo-robot-2")

vgal.item.set_rocket_capacity("angels-cargo-robot-2", 50)
vgal.item.set_rocket_capacity("angels-cargo-box", 20)
vgal.item.set_rocket_capacity("angels-cargo-roboport", 10)
vgal.item.set_rocket_capacity("angels-cargo-hub", 5)

local expander_groups = {
    "angels-zone-expander",
    "angels-construction-zone-expander",
    "angels-relay-station",
}

local capacities = {
    50,
    20,
    10,
}

for _, base_name in ipairs(expander_groups) do
    for tier, capacity in ipairs(capacities) do
        local name = (tier == 1) and base_name or (base_name .. "-" .. tier)

        vgal.item.set_rocket_capacity(name, capacity)
    end
end

-- heat
data.raw["roboport"]["angels-cargo-box"].heating_energy = "100kW"
data.raw["roboport"]["angels-cargo-roboport"].heating_energy = "200kW"
data.raw["roboport"]["angels-cargo-hub"].heating_energy = "400kW"
data.raw["roboport"]["angels-zone-expander"].heating_energy = "40kW"
data.raw["roboport"]["angels-zone-expander-2"].heating_energy = "100kW"
data.raw["roboport"]["angels-zone-expander-3"].heating_energy = "200kW"
data.raw["roboport"]["angels-construction-zone-expander"].heating_energy = "40kW"
data.raw["roboport"]["angels-construction-zone-expander-2"].heating_energy = "100kW"
data.raw["roboport"]["angels-construction-zone-expander-3"].heating_energy = "200kW"
data.raw["roboport"]["angels-relay-station"].heating_energy = "40kW"
data.raw["roboport"]["angels-relay-station-2"].heating_energy = "100kW"
data.raw["roboport"]["angels-relay-station-3"].heating_energy = "200kW"
data.raw["roboport"]["angels-charging-station"].heating_energy = "300kW"
