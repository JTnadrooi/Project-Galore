local missing_smelting_recipe = table.deepcopy(data.raw["recipe"]["angelsore1-crushed-smelting"])
missing_smelting_recipe.name = "angelsore2-crushed-smelting"
missing_smelting_recipe.ingredients[1].name = "angels-ore2-crushed"
---@diagnostic disable-next-line: assign-type-mismatch
data:extend({ missing_smelting_recipe })
