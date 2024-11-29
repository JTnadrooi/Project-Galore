local rocket_part_recipe = util.table.deepcopy(data.raw.recipe["rocket-part"])
rocket_part_recipe.category = "crafting"
rocket_part_recipe.hidden = false
rocket_part_recipe.name = "vgal-rocket-part"
vgal.data.extend { rocket_part_recipe }
vgal.tech.add_recipe("rocket-silo", "vgal-rocket-part")

data.raw["rocket-silo"]["rocket-silo"].fixed_recipe = nil
