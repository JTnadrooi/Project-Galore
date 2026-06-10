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
vgal.data.trim("wood-processing")
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

-- readd crusher surface condition after is was removed in sagal
data.raw["assembling-machine"]["crusher"].surface_conditions =
{
    {
        property = "gravity",
        min = 0,
        max = 0
    }
}
