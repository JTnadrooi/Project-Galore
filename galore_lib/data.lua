vgal = require("lib.vgal")

vgal.recipe.add_productivity_entry("coal")
vgal.recipe.add_productivity_entry("iron-ore")
vgal.recipe.add_productivity_entry("copper-ore")
vgal.recipe.add_productivity_entry("uranium-ore")
vgal.recipe.add_productivity_entry("stone")
vgal.recipe.add_productivity_entry("uranium-235")
vgal.recipe.add_productivity_entry("uranium-238")
vgal.recipe.add_productivity_entry("solid-fuel")

if mods["space-age"] then
    vgal.recipe.add_productivity_entry("ice")
    vgal.recipe.add_productivity_entry("tungsten-ore")
    vgal.recipe.add_productivity_entry("holmium-ore")
    vgal.recipe.add_productivity_entry("calcite")
    vgal.recipe.add_productivity_entry("scrap")
    vgal.recipe.add_productivity_entry("nutrients")
end
