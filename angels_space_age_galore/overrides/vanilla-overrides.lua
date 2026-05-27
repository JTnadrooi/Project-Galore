-- trim unsaveble vanilla recipes
-- bio stuff will be obtained through bioprocessing
vgal.data.trim("biolubricant")
vgal.data.trim("bioplastic")
vgal.data.trim("biosulfur")
vgal.data.trim("rocket-fuel-from-jelly")

-- might be saveble
vgal.data.trim("simple-coal-liquefaction")
vgal.data.trim("carbon")

-- other more angel-ish ways avalible
vgal.data.trim("solid-fuel-from-ammonia")
vgal.data.trim("ammonia-rocket-fuel")

-- not needed now there are alt methods for coal recipes that don't use coal.
vgal.data.trim("coal-synthesis")

-- add spoilage to fiber recipe instead
vgal.data.trim("burnt-spoilage")

-- angels already adds a fish breeding recipe
vgal.data.trim("fish-breeding")

-- remove solid fuel from scrap
-- no throw bc other mods like to do this as well
vgal.recipe.remove_result("scrap-recycling", "solid-fuel", true)

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

    -- fix foundry recipes
    -- data.raw["recipe"]["foundry"].energy_required = 5                  -- og; 10
    -- data.raw["recipe"]["big-mining-drill"].energy_required = 15        -- og; 30
    -- data.raw["recipe"]["metallurgic-science-pack"].energy_required = 5 -- og; 10
    -- data.raw["recipe"]["tungsten-plate"].energy_required = 5           -- og; 10
    for _, recipe in pairs(data.raw["recipe"]) do
        if recipe.energy_required and recipe.energy_required >= 8
            and (not (vgal.recipe.has_category(recipe.name, "crafting") or vgal.recipe.has_category(recipe.name, "crafting-with-fluid") or vgal.recipe.has_category(recipe.name, "pressing")) and vgal.recipe.has_category(recipe.name, "metallurgy")) then
            local final_energy_required = recipe.energy_required / 2

            if final_energy_required > 3 then
                final_energy_required = math.ceil(final_energy_required)
            end

            recipe.energy_required = final_energy_required
        end
    end
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
