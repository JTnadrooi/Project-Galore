--- ore removal ---

-- (actual)catalyst fixes
vgal.recipe.all.replace_ingredient("angels-catalyst-metal-yellow",
    { type = "item", name = "angels-catalyst-metal-red", amount = 1 })
vgal.recipe.all.replace_ingredient("angels-catalyst-metal-blue",
    { type = "item", name = "angels-catalyst-metal-green", amount = 1 })

vgal.data.trim("angels-catalyst-metal-blue")
vgal.data.trim("angels-catalyst-metal-yellow")

-- remove the NORMAL ores and their processing recipes
for _, ore in ipairs(agal.constants.REMOVED_ORE_INDEXES) do
    vgal.data.deep_hide(data.raw["item"]["angels-ore" .. ore])

    for _, state in ipairs(agal.constants.ORE_STATES) do
        vgal.data.trim("angels-ore" .. ore .. "-" .. state .. "-processing")
        vgal.data.trim("angels-ore" .. ore .. "-" .. state)
        vgal.data.deep_hide(data.raw["item"]["angels-ore" .. ore .. "-" .. state])
    end
end

-- remove the ALT ores and their processing recipes
for _, ore in ipairs(agal.constants.REMOVED_ALT_ORE_INDEXES) do
    for _, state in ipairs(agal.constants.ALT_ORE_STATES) do
        vgal.data.trim("angels-ore" .. ore .. "-" .. state .. "-processing")
        vgal.data.trim("angels-ore" .. ore .. "-" .. state)
        vgal.data.deep_hide(data.raw["item"]["angels-ore" .. ore .. "-" .. state])
    end

    for _, state in ipairs(agal.constants.FLUID_ALT_ORE_STATES) do
        vgal.data.trim("angels-ore" .. ore .. "-" .. state)
        vgal.data.deep_hide(data.raw["fluid"]["angels-ore" .. ore .. "-" .. state])
    end

    vgal.data.trim("angels-ore" .. ore .. "-anode-sludge")
end

-- remove mix recipes (I will have my own ones)
for i = 1, 6 do
    for _, state in ipairs(agal.constants.ORE_STATES) do
        local recipe = data.raw["recipe"]["angels-ore-" .. state .. "-mix" .. i .. "-processing"]

        if recipe then
            vgal.data.deep_hide(recipe)
        end
    end
end

-- remove mineral sludge to ores recipes (I will have my own ones)
vgal.recipe.deep_hide("angels-slag-processing-1")
vgal.recipe.deep_hide("angels-slag-processing-2")
vgal.recipe.deep_hide("angels-slag-processing-3")







--- funny yellow module removal ---
local BIO_MODULES = { "angels-bio-yield-module", "angels-bio-yield-module-2", "angels-bio-yield-module-3" }
for _, bio_module in ipairs(BIO_MODULES) do
    vgal.data.deep_hide(data.raw["module"][bio_module])
    vgal.data.trim(bio_module)
end
