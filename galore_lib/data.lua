vgal.log("loading galore..")
vgal = require("lib.vgal")
vgal.log("the *core-of-galore* has loaded.")
vgal.log("setting galorelib variables..")

vgal.recipe.add_productivity_entry("coal")
vgal.recipe.add_productivity_entry("iron-ore")
vgal.recipe.add_productivity_entry("copper-ore")
vgal.recipe.add_productivity_entry("uranium-ore")
vgal.recipe.add_productivity_entry("stone")

-- vgal.recipe.add_productivity_entry("light-oil")
-- vgal.recipe.add_productivity_entry("heavy-oil")
-- vgal.recipe.add_productivity_entry("petroleum-gas")
-- vgal.recipe.add_productivity_entry("solid-fuel")
-- vgal.recipe.add_productivity_entry("crude-oil")

-- if mods["space-age"] then
--     vgal.recipe.add_productivity_entry("ammonia")
--     vgal.recipe.add_productivity_entry("ammoniacal-solution")
-- end
