for _, metal in pairs(vgal.defines.metals) do
    -- vgal.recipe.use_recipe_locale(metal.ingot)
    vgal.recipe.use_recipe_locale(metal.ingot .. "-2")
    vgal.recipe.use_recipe_locale(metal.ingot .. "-3")

    -- remove sorting descs referencing removes ores
    data.raw["item"][metal.base_ore].localised_description = { "item-description." .. metal.base_ore }
    for _, state in ipairs(metal.ore_states) do
        data.raw["item"][metal.base_ore .. "-" .. state].localised_description =
        {
            "item-description." .. metal.base_ore .. "-" .. state,
        }
    end
end

data.raw["recipe"]["angels-cellulose-fiber"].show_amount_in_title = false
vgal.recipe.use_recipe_locale("angels-cellulose-fiber")

data.raw["recipe"]["angels-solid-sulfur"].show_amount_in_title = true
data.raw["recipe"]["angels-solid-sulfur"].localised_name = nil

for _, metal in pairs(vgal.defines.metals) do
    for _, ore_state in ipairs(agal.defines.ore_states) do
        -- commentedbc: ugly
        -- local previous = nil
        -- if ore_state == "crushed" then
        --     previous = "angels-ore" .. metal.ore_index
        -- elseif ore_state == "chunk" then
        --     previous = "angels-ore" .. metal.ore_index .. "-crushed"
        -- elseif ore_state == "crystal" then
        --     previous = "angels-ore" .. metal.ore_index .. "-chunk"
        -- elseif ore_state == "pure" then
        --     previous = "angels-ore" .. metal.ore_index .. "-crystal"
        -- end

        data.raw["recipe"][metal[ore_state]].localised_name =
        { "?",
            {
                "",
                { "agal-internal.ore-" .. metal.ore_index },
                " ",
                { "agal-internal.act-" .. ore_state },
            },
            { "item-name." .. metal[ore_state] },
        }
    end
end

vgal.tech.use_tech_locale("angels-stone-smelting-1")
vgal.tech.use_tech_locale("angels-stone-smelting-2")

-- prevent oopsie locale
data.raw["recipe"]["angels-iron-pebbles"].localised_name = nil
data.raw["recipe"]["angels-copper-pebbles"].localised_name = nil

-- prevent tiered locale
data.raw["technology"]["angels-fusion-power-1"].localised_name = nil
data.raw["technology"]["angels-fusion-power-1"].localised_description = nil
