vgal = require("lib.vgal")
vgal.log("the *core-of-galore* has loaded.")
vgal.log("setting galorelib variables..")

vgal.recipe.add_productivity_entry("coal")
vgal.recipe.add_productivity_entry("iron-ore")
vgal.recipe.add_productivity_entry("copper-ore")
vgal.recipe.add_productivity_entry("uranium-ore")
vgal.recipe.add_productivity_entry("stone")
vgal.recipe.add_productivity_entry("uranium-235")
vgal.recipe.add_productivity_entry("uranium-238")
vgal.recipe.add_productivity_entry("solid-fuel")
vgal.recipe.add_productivity_entry("ice")

if mods["space-age"] then
    vgal.recipe.add_productivity_entry("ice")
    vgal.recipe.add_productivity_entry("tungsten-ore")
    vgal.recipe.add_productivity_entry("holmium-ore")
    vgal.recipe.add_productivity_entry("calcite")
    vgal.recipe.add_productivity_entry("scrap")
end
vgal.log("galorelib variables set.")
