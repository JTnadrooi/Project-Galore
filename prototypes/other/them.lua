data.raw.item["wood"].stack_size = 200
data.raw.item["plastic-bar"].stack_size = 200

-- data.raw.fluid["light-oil"].order = "b[fluid-chemistry]-a[heavy-oil-cracking]"
-- data.raw.fluid["light-oil"].subgroup = "fluid"

-- data.raw.fluid["heavy-oil"].order = "b[fluid-chemistry]-a[heavy-oil-cracking]-b"
-- data.raw.fluid["heavy-oil"].subgroup = "fluid"

-- data.raw.fluid["petroleum-gas"].order = "b[fluid-chemistry]-b[light-oil-cracking]"
-- data.raw.fluid["petroleum-gas"].subgroup = "fluid"

-- data.raw.fluid["crude-oil"].order = "ab"
-- data.raw.fluid["crude-oil"].subgroup = "fluid"

-- data.raw.fluid["steam"].order = "ab"
-- data.raw.fluid["steam"].subgroup = "fluid"

-- data.raw.fluid["water"].order = "aaa"
-- data.raw.fluid["water"].subgroup = "fluid"

-- data.raw.recipe["sulfuric-acid"].subgroup = "fluid"
-- data.raw.recipe["basic-oil-processing"].subgroup = "fluid"
-- data.raw.recipe["basic-oil-processing"].order = data.raw.fluid["petroleum-gas"].order
-- data.raw.recipe["advanced-oil-processing"].subgroup = "fluid"
-- data.raw.recipe["coal-liquefaction"].subgroup = "fluid"
-- data.raw.recipe["heavy-oil-cracking"].subgroup = "fluid"
-- data.raw.recipe["light-oil-cracking"].subgroup = "fluid"
-- data.raw.recipe["lubricant"].subgroup = "fluid"

-- data.raw.item["solid-fuel"].subgroup = "fluid-recipes"
-- data.raw.item["solid-fuel"].order = "a"

data.raw.technology["coal-liquefaction"].prerequisites = { "advanced-oil-processing" }
data.raw.technology["coal-liquefaction"].unit.ingredients = {
	{ "automation-science-pack", 1 },
	{ "logistic-science-pack",   1 },
	{ "chemical-science-pack",   1 }
}
--table.insert(data.raw.technology["concrete"].prerequisites, {"landfill"})
data.raw.technology["concrete"].prerequisites = { "automation-2", "landfill" }
data.raw.recipe["rocket-part"].hidden = false
data.raw["rocket-silo"]["rocket-silo"].fixed_recipe = nil

--data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories = {"crafting", "crafting-with-fluid", "rocket-building"}
--data.raw["assembling-machine"]["assembling-machine-2"].crafting_categories = {"crafting", "crafting-with-fluid", "rocket-building"}
--data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories = {"crafting", "crafting-with-fluid", "rocket-building"}
--[[
vgal.data.extend({
	{
	  type = "recipe",
	  name = "electronic-circuit",
	  ingredients =
	  {
		{"iron-plate", 1},
		{"copper-cable", 3}
	  },
	  result = "electronic-circuit",
	  result_count = 2
	},
	{
	  type = "recipe",
	  name = "advanced-circuit",
          enabled = false,
	  ingredients =
	  {
		{"electronic-circuit", 2},
		{"copper-cable", 4},
		{"plastic-bar", 2}
	  },
	  result = "advanced-circuit",
	  result_count = 2
	},
	{
	  type = "recipe",
	  name = "processing-unit",
          enabled = false,
	  category = "crafting-with-fluid",
	  ingredients =
	  {
		{"electronic-circuit", 20},
		{"advanced-circuit", 2},
		{type="fluid", name="sulfuric-acid", amount=5}
	  },
	  result = "processing-unit",
	  result_count = 2
	},
}) ]] --

-- data.raw["assembling-machine"]["bob-greenhouse"].crafting_speed = 1
-- --data.raw.recipe["bob-fertiliser"] = nil
-- data.raw.recipe["bob-seedling"].hidden = true
-- data.raw.recipe["bob-basic-greenhouse-cycle"].hidden = true
-- data.raw.recipe["bob-advanced-greenhouse-cycle"].hidden = true
-- data.raw.recipe[vgal.item.get_item_or_invalid_name("wood-pellet")].hidden = true
-- data.raw.technology["bob-greenhouse"].hidden = true
-- data.raw.technology["bob-fertiliser"].hidden = true

-- vgal.tech.add_recipe("vgal-wood-processing", "bob-greenhouse")

--.prerequisites = {"advanced-material-processing"}
