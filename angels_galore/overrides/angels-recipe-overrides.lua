--- plastic buff ---
vgal.subgroup.clean("solid-plastic")
vgal.recipe.multiply("solid-plastic", 1.25)

--- ore removal ---
vgal.recipe.all.replace_ingredient("catalyst-metal-yellow", { type = "item", name = "catalyst-metal-red", amount = 1 })
vgal.recipe.all.replace_ingredient("catalyst-metal-blue", { type = "item", name = "catalyst-metal-green", amount = 1 })
vgal.data.trim("catalyst-metal-blue")
vgal.data.trim("catalyst-metal-yellow")
local UNNEEDED_ORES = { "2", "4" }
for _, ore in ipairs(UNNEEDED_ORES) do
    vgal.data.deep_hide(data.raw["item"]["angels-ore" .. ore])
    for _, state in ipairs(agal.constants.ORE_STATES) do
        vgal.data.trim("angelsore" .. ore .. "-" .. state .. "-processing")
        vgal.data.trim("angelsore" .. ore .. "-" .. state)
        vgal.data.deep_hide(data.raw["item"]["angels-ore" .. ore .. "-" .. state])
    end
end


--- funny yellow module removal ---
local BIO_MODULES = { "angels-bio-yield-module", "angels-bio-yield-module-2", "angels-bio-yield-module-3" }
for _, bio_module in ipairs(BIO_MODULES) do
    vgal.data.deep_hide(data.raw["module"][bio_module])
    vgal.data.trim(bio_module)
end

--- remove the alien tokens things ---
vgal.recipe.all.remove_ingredient("token-bio")
vgal.recipe.all.remove_result("token-bio")

for _, environment in ipairs(agal.constants.ENVIRONMENTS) do
    vgal.recipe.deep_hide(environment .. "-garden-b")
    vgal.recipe.deep_hide(environment .. "-garden-cultivating-a")
end


--- casting recipe tweaks ---
for _, metal in ipairs(vgal.constants.METALS) do
    data.raw.recipe["angels-" .. metal .. "-pebbles-smelting"].energy_required = 6.4
    data.raw.recipe["angels-" .. metal .. "-nugget-smelting"].energy_required = 6.4

    data.raw.recipe[metal .. "-plate"].energy_required = 9.6
    data.raw.recipe["angels-plate-" .. metal].energy_required = 1
    vgal.recipe.multiply("angels-plate-" .. metal, 1.25)
end
data.raw.recipe["angelsore1-crushed-smelting"].energy_required = 6.4
data.raw.recipe["angelsore3-crushed-smelting"].energy_required = 6.4

--- recipe buffs ---
vgal.recipe.set_result_amount("ingot-iron-smelting", 8)

--- plastic buff ---
local PLASTIC_MULTIPLIER = 5
vgal.recipe.multiply_results("liquid-plastic-1", PLASTIC_MULTIPLIER)
vgal.recipe.multiply_results("liquid-plastic-2", PLASTIC_MULTIPLIER)
vgal.recipe.multiply_results("liquid-plastic-3", PLASTIC_MULTIPLIER)
vgal.recipe.set_result_amount("bio-plastic-1", 80)
vgal.recipe.set_result_amount("bio-plastic-2", 150)

--- chain simplifications ---

-- bio plastic
vgal.data.trim("liquid-cellulose-acetate")
vgal.data.deep_hide(data.raw["fluid"]["liquid-cellulose-acetate"])
vgal.recipe.replace_ingredient("bio-plastic-1", "liquid-cellulose-acetate", "liquid-cellulose-acetate-mixture")

--- misc normalising ---
-- data.raw.recipe["bio-tile"].results = vgal.build.table({
--     { "bio-tile", 2 },
-- })

vgal.recipe.set_result_amount("bio-tile", 2)
vgal.recipe.set_result_amount("alien-goo", 10)

--- misc ---
vgal.data.trim("powder-silicon")
vgal.data.trim("solid-salt-from-saline")
data.raw["recipe"]["anode-copper-smelting"].category = "blast-smelting" -- bc the chem furnace is removed.
data.raw["recipe"]["solid-soil"].energy_required = 1.5
data.raw["recipe"]["solid-soil-alternative"].energy_required = 1.5
