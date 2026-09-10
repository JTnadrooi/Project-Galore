if not mods["recycler"] then return end

-- local recycling = require("__recycler__/recycling")
-- local missing_recylce_recipes = {
--     "processing-unit",
--     "rocket-fuel",
-- }
-- for _, recipe_name in ipairs(missing_recylce_recipes) do
--     recycling.generate_recycling_recipe(data.raw.recipe[recipe_name])
-- end
-- for machine_name, _ in pairs(vgal.defines.machine_max_tiers) do
--     recycling.generate_recycling_recipe(data.raw.recipe[machine_name])
-- end

-- data.raw["recipe"]["iron-plate"].auto_recycle = false
-- data.raw["recipe"]["copper-plate"].auto_recycle = false

-- copied from recyling mod, will be sped up later:
local recycling = require("__recycler__.recycling")

for _, recipe in pairs(data.raw.recipe) do
    recycling.generate_recycling_recipe(recipe)
end

local function generate_self_recycling_recipe(item)
    if item.auto_recycle == false then return end
    if item.parameter then return end

    if not data.raw.recipe[item.name .. "-recycling"] then
        if not string.find(item.name, "-barrel") then
            recycling.generate_self_recycling_recipe(item)
        end
    end
end

for type_name in pairs(defines.prototypes.item) do
    if data.raw[type_name] then
        for _, item in pairs(data.raw[type_name]) do
            generate_self_recycling_recipe(item)
        end
    end
end
recycling.generate_self_recycling_recipe(data.raw["item"]["copper-plate"])
recycling.generate_self_recycling_recipe(data.raw["item"]["iron-plate"])
recycling.generate_self_recycling_recipe(data.raw["item"]["angels-stone-crushed"])
