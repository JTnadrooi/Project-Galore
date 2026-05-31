require("overrides.loot-overrides")
require("overrides.vanilla-overrides")

require("overrides.angels-order-overrides")
require("overrides.angels-overrides")
require("overrides.angels-recipe-overrides")

require("overrides.vgal-overrides")
require("overrides.angels-icon-overrides")
require("overrides.angels-machine-overrides")
require("overrides.angels-purge")
require("overrides.angels-tech-overrides")

require("overrides.angels-tips-overrides")

require("overrides.angels-locale-overrides")

require("mods.angelsaddons-bots")
require("mods.angelsaddons-cab")
require("mods.angelsaddons-mobility")
require("mods.angelsaddons-storage")
require("mods.angelsinfiniteores")

require("mods.bobmodules")
require("mods.boblogistics")

-- hmm i wonder what this is doing here
-- (it doesnt listen in any other stage)
for metal in vgal.table.iter_all(vgal.defines.metals, { agal.defines.metal_steel }) do
    data.raw["recipe"][metal.angels_plate_recipe_name .. "-2"].allow_productivity = false -- works but galorelib prod desc runs before this so bla bla
end
