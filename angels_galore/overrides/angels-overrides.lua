--- wipe alien samples of the planet ---
local alien_sample_tech_names = {}
for _, tech in pairs(data.raw.technology) do
    if tech.unit and tech.unit.ingredients then
        for i, ingredient in ipairs(tech.unit.ingredients) do
            if ingredient[1] == "token-bio" then
                table.remove(tech.unit.ingredients, i)
                table.insert(alien_sample_tech_names, tech.name)
                break;
            end
        end
    end
end

for _, tech_name in ipairs(alien_sample_tech_names) do
    local tech = data.raw["technology"][tech_name]
    local multiplier = 1
    for _, ingredient in ipairs(tech.unit.ingredients) do
        if ingredient[2] ~= 1 then
            multiplier = ingredient[2]
            ingredient[2] = 1
        end
    end
    if multiplier ~= 1 then
        tech.unit.count = multiplier * 40
    end
end

vgal.data.deep_hide(data.raw["tool"]["angels-token-bio"])

--- tech ---
data.raw["technology"]["angels-basic-chemistry"].unit.count = 40
data.raw["technology"]["angels-ore-crushing"].prerequisites = { "automation" }
vgal.tech.merge("angels-flare-stack", "angels-basic-chemistry")
table.insert(data.raw["technology"]["angels-water-treatment"].prerequisites, "angels-water-washing-1")
table.insert(data.raw["technology"]["angels-bio-processing-green"].unit.ingredients, { "logistic-science-pack", 1 })
table.insert(data.raw["technology"]["angels-bio-processing-green"].prerequisites, "angels-bio-nutrient-paste")
vgal.tech.move_recipe("angels-bio-processing-green", "angels-water-treatment", "angels-water-mineralized")
vgal.tech.replace_recipe("angels-ore-crushing", "angels-ore4-crushed", "angels-ore3-crushed")


--- align ores (ore2 is normally a tier 2 ore)
data.raw["resource"]["angels-ore2"].minable.mining_time = data.raw["resource"]["angels-ore3"].minable.mining_time
data.raw["resource"]["angels-ore2"].autoplace = data.raw["resource"]["angels-ore1"].autoplace

--- fuel ---
data.raw["item"]["angels-coal-crushed"].fuel_value = "2.5MJ"
data.raw["item"]["angels-solid-coke"].fuel_value = "3.5MJ"
data.raw["item"]["angels-pellet-coke"].fuel_value = "18MJ"
data.raw["item"]["solid-fuel"].fuel_value = "12MJ" -- angels changes it
data.raw["item"]["angels-red-cellulose-fiber"].fuel_category = "chemical"
data.raw["item"]["angels-red-cellulose-fiber"].fuel_value = "0.25MJ"
data.raw["item"]["angels-blue-cellulose-fiber"].fuel_category = "chemical"
data.raw["item"]["angels-blue-cellulose-fiber"].fuel_value = "3MJ"

--- remove bio token lab input ---
vgal.table.remove(data.raw["lab"]["lab"].inputs, "angels-token-bio")




-- vgal.recipe.unhide("thermal-water-purification")
-- vgal.tech.add_recipe("vgal-hydrochloric-intermediates", "thermal-water-purification")
