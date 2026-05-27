vgal.data.trim("vgal-ammonia-water-crude-oil")
vgal.data.trim("vgal-spoilage-crude-oil")
vgal.data.trim("vgal-yumako-mash-light-oil")
vgal.data.trim("vgal-carbon-sulfur-lubricant")
vgal.data.trim("vgal-jelly-crude-oil-solid-fuel")
vgal.data.trim("vgal-jelly-sulfur-lubricant")
vgal.data.trim("vgal-fluorine-kovarex-enrichment-process")
vgal.data.trim("vgal-ammonia-thruster-oxidizer")
vgal.data.trim("vgal-crude-oil-thruster-fuel")
vgal.data.trim("vgal-iron-bacteria-ammonia")
vgal.data.trim("vgal-copper-bacteria-ammonia")
vgal.data.trim("vgal-water-coal-ammonia")
vgal.data.trim("vgal-ammonia-artificial-yumako-soil")
vgal.data.trim("vgal-ammonia-artificial-jellynut-soil")
vgal.data.trim("vgal-ammonia-explosives")
vgal.data.trim("vgal-carbon-uranium-ore")
vgal.data.trim("vgal-wood-carbon")
vgal.data.trim("vgal-spoilage-sulfuric-acid-carbon")
vgal.data.trim("vgal-ammoniacal-solution-raw-fish")
vgal.data.trim("vgal-carbon-stone-thruster-fuel")
vgal.data.trim("vgal-iron-ore-stone-thruster-oxidizer")
vgal.data.trim("vgal-stone-crushing") -- agal already adds a stone crushing recipe kinda, for sand. Limestone will be source of calcite
vgal.data.trim("casting-iron")
vgal.data.trim("casting-copper")
vgal.data.trim("casting-steel")
vgal.data.trim("casting-iron-stick")
vgal.data.trim("casting-iron-gear-wheel")
vgal.data.trim("casting-copper-cable")
-- vgal.data.trim("casting-low-density-structure")
vgal.data.trim("concrete-from-molten-iron")
vgal.data.trim("casting-pipe")
vgal.data.trim("casting-pipe-to-ground")
-- vgal.data.trim("vgal-molten-iron-rail")
vgal.data.trim("vgal-molten-iron-refined-concrete")
-- vgal.data.trim("vgal-molten-copper-carbon-fiber-low-density-structure")
-- vgal.data.trim("vgal-molten-iron-molten-copper-space-platform-foundation")
vgal.data.trim("molten-iron")
vgal.data.trim("molten-copper")
vgal.data.trim("vgal-iron-ore-coal-molten-iron")
vgal.data.trim("vgal-copper-ore-coal-molten-copper")
vgal.data.trim("vgal-ammonia-calcite-molten-iron")
vgal.data.trim("vgal-sulfuric-acid-calcite-molten-copper")
vgal.data.trim("vgal-sulfuric-acid-sulfur")
vgal.data.trim("vgal-holmium-ore-holmium-plate")
vgal.data.trim("vgal-angels-liquid-molten-steel-low-density-structure")
vgal.data.trim("vgal-calcite-carbon-concrete")

vgal.recipe.replace_ingredient("vgal-ammonia-agricultural-science-pack", "ammonia", "angels-gas-urea")
vgal.recipe.replace_ingredient("vgal-ammonia-artificial-yumako-soil", "ammonia", "angels-gas-urea")
vgal.recipe.replace_ingredient("vgal-ammonia-artificial-jellynut-soil", "ammonia", "angels-gas-urea")
vgal.recipe.replace_ingredient("vgal-jelly-ammonia-electronic-circuit", "ammonia", "angels-gas-urea")
vgal.recipe.replace_ingredient("vgal-petroleum-gas-barrel-biter-egg", "petroleum-gas-barrel",
    "angels-gas-carbon-dioxide-barrel")

-- data.raw.recipe["vgal-ammonia-artificial-yumako-soil"].icons = vgal.icon.register {
--     vgal.icon.get("artificial-yumako-soil"),
--     vgal.icon.get_in("urea", "molecule"),
-- }

-- data.raw.recipe["vgal-ammonia-artificial-jellynut-soil"].icons = vgal.icon.register {
--     vgal.icon.get("artificial-jellynut-soil"),
--     vgal.icon.get_in("urea", "molecule"),
-- }

data.raw["recipe"]["vgal-molten-copper-carbon-fiber-low-density-structure"].category = "angels-casting"
data.raw["recipe"]["tungsten-carbide"].category = "angels-chemical-smelting"
