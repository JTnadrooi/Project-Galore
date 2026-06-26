data.raw["underground-belt"]["turbo-underground-belt"].max_distance = 14

-- foundry fixes
do
    local foundry = data.raw["assembling-machine"]["foundry"]

    -- first reduce crafting speed
    -- why? so I can use the base angels galore casting recipes without adding new slower ones (that would be as fast as the game) and/or make the casting machine speeds weird
    -- 4 is way to fast anyways....
    foundry.crafting_speed = 2 -- og; 4

    -- allow angels casting
    table.insert(foundry.crafting_categories, "angels-casting")
    table.insert(foundry.crafting_categories, "angels-strand-casting")
end

-- remove vanilla tree farming
for _, tower in pairs(data.raw["agricultural-tower"]) do
    if tower.accepted_seeds then
        vgal.table.remove(tower.accepted_seeds, "tree-seed")
    end
end
vgal.data.trim("tree-seed")
vgal.data.deephide(data.raw["item"]["tree-seed"])
data.raw["item"]["tree-seed"].plant_result = nil -- needs to be done even if item is hidden

-- gleba tree seed overhaul
for _, plant in pairs(vgal.defines.gleba_plants) do
    data.raw["plant"][plant.tree].minable.results = vgal.build.table({
        { plant.name,         50 },
        { plant.dormant_seed, 1 }
    })
    data.raw["plant"][plant.tree].minable.result = nil
    data.raw["plant"][plant.tree].minable.count = nil
end

vgal.data.deephide(data.raw["plant"]["tree-plant"])

-- commentedbc; carbon from solid fuel
-- -- remove solid fuel from scrap
-- -- no throw bc other mods like to do this as well
-- vgal.recipe.remove_result("scrap-recycling", "solid-fuel", true)

-- data.raw.recipe["vgal-ammonia-artificial-yumako-soil"].icons = vgal.icon.register {
--     vgal.icon.get("artificial-yumako-soil"),
--     vgal.icon.get_in("urea", "molecule"),
-- }

-- data.raw.recipe["vgal-ammonia-artificial-jellynut-soil"].icons = vgal.icon.register {
--     vgal.icon.get("artificial-jellynut-soil"),
--     vgal.icon.get_in("urea", "molecule"),
-- }

-- allow more modules in bio machines (they are later game now + biochamber has like 4)
data.raw["assembling-machine"]["angels-bio-processor"].module_slots = 4
data.raw["assembling-machine"]["angels-seed-extractor"].module_slots = 3

-- surface conditions fixes
-- readd crusher surface condition after is was removed in sagal
data.raw["assembling-machine"]["crusher"].surface_conditions = vgal.get_surface_conditions_for("space")
data.raw["assembling-machine"]["angels-blast-furnace"].surface_conditions = vgal.get_surface_conditions_for("atmosphere")
data.raw["assembling-machine"]["angels-burner-ore-crusher"].surface_conditions = vgal.get_surface_conditions_for("atmosphere")
data.raw["assembling-machine"]["angels-crop-farm"].surface_conditions = vgal.get_surface_conditions_for("atmosphere")
for _, environment in pairs(vgal.defines.environments) do
    data.raw["assembling-machine"][environment.farm].surface_conditions = vgal.get_surface_conditions_for("atmosphere")
end
data.raw["assembling-machine"]["angels-algae-farm"].surface_conditions = vgal.get_surface_conditions_for("atmosphere")
data.raw["assembling-machine"]["angels-algae-farm-2"].surface_conditions = vgal.get_surface_conditions_for("atmosphere")
-- data.raw["assembling-machine"]["angels-bio-refugium-puffer"].surface_conditions = vgal.get_surface_conditions_for("gravity")
data.raw["assembling-machine"]["angels-bio-refugium-biter"].surface_conditions = vgal.get_surface_conditions_for("nauvis")
data.raw["assembling-machine"]["angels-seed-extractor"].surface_conditions = vgal.get_surface_conditions_for("atmosphere")
data.raw["assembling-machine"]["angels-bio-arboretum-1"].surface_conditions = vgal.get_surface_conditions_for("atmosphere")
data.raw["assembling-machine"]["angels-bio-generator-temperate-1"].surface_conditions = vgal.get_surface_conditions_for("atmosphere")
data.raw["assembling-machine"]["angels-air-filter"].surface_conditions = vgal.get_surface_conditions_for("atmosphere")
data.raw["furnace"]["angels-clarifier"].surface_conditions = vgal.get_surface_conditions_for("gravity")

-- recipe surface_conditions fixes
data.raw["recipe"]["angels-gas-compressed-air"].surface_conditions = vgal.get_surface_conditions_for("nauvis")
data.raw["recipe"]["vgal-temperate-seeds"].surface_conditions = vgal.get_surface_conditions_for("nauvis")
data.raw["recipe"]["vgal-swamp-seeds"].surface_conditions = vgal.get_surface_conditions_for("nauvis")
data.raw["recipe"]["vgal-desert-seeds"].surface_conditions = vgal.get_surface_conditions_for("nauvis")

data.raw["recipe"]["angels-pellet-press"].surface_conditions = vgal.get_surface_conditions_for("vulcanus")
data.raw["recipe"]["angels-gas-refinery"].surface_conditions = vgal.get_surface_conditions_for("fulgora")
for _, environment in pairs(vgal.defines.environments) do
    data.raw["recipe"][environment.farm].surface_conditions = vgal.get_surface_conditions_for("gleba")
end

data.raw["offshore-pump"]["angels-ground-water-pump"].surface_conditions = {
    {
        property = "pressure",
        min = 1000,
        max = 2000
    },
}

data.raw["offshore-pump"]["angels-seafloor-pump"].surface_conditions = {
    {
        property = "pressure",
        min = 1000,
        max = 2000
    },
}

-- move alien fish to gleba
for i = 1, 3 do
    data.raw["planet"]["gleba"].map_gen_settings.autoplace_settings.entity.settings["angels-alien-fish-" .. i] = {}
    data.raw["planet"]["nauvis"].map_gen_settings.autoplace_settings.entity.settings["angels-alien-fish-" .. i] = nil
end

do
    local vent = data.raw["resource"]["fluorine-vent"]
    vent.minable.results[1].name = "angels-gas-hydrogen-fluoride"

    for _, stateless_visualisation_entry in ipairs(vent.stateless_visualisation) do
        if stateless_visualisation_entry.animation and stateless_visualisation_entry.animation.tint then
            stateless_visualisation_entry.animation.tint = util.multiply_color(util.mix_color(angelsmods.functions.fluid_color("HF"), { r = 2, g = 2, b = 2 }), 0.2)
        end
    end

    vent.map_color = angelsmods.functions.fluid_color("HF")
    vent.icon = "__angels_space_age_galore__/graphics/icons/fluorine-vent.png"
end

data.raw.tile["oil-ocean-shallow"].fluid = "angels-liquid-naphtha"
data.raw.tile["oil-ocean-deep"].fluid = "angels-liquid-naphtha"
