--- barrel hiding ---
for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.category == "barreling-pump" then
        recipe.hide_from_player_crafting = true
    end
end

--- clean subgroups bc anywhere else this code is just a suggestion ---
local subgroups_to_clean = {
    ["angels-copper"] = true,
    ["angels-copper-casting"] = true,
    ["angels-iron"] = true,
    ["angels-iron-casting"] = true,
    ["angels-steel-casting"] = true,
    ["angels-stone"] = true,
    ["angels-stone-casting"] = true,
}
for _, recipe in pairs(data.raw["recipe"]) do
    if subgroups_to_clean[recipe.subgroup] then
        recipe.order = nil
        recipe.subgroup = nil
    end
end

--- restore refining recipes ---
local function unhide(name)
    local recipe = data.raw["recipe"][name]
    if recipe then
        recipe.hidden = false
        recipe.hidden_in_factoriopedia = false
    end

    local item = data.raw["item"][name]
    if item then
        item.hidden = false
        item.hidden_in_factoriopedia = false
    end
end

-- unhide nuggets and pebbles
for _, metal in pairs(vgal.constants.METALS) do
    unhide(metal.pebbles)
    -- unhide("angels-" .. metal .. "-pebbles-smelting")
    unhide(metal.nugget)
    -- unhide("angels-" .. metal .. "-nugget-smelting")
    unhide(metal.slag)
    -- unhide("angels-" .. metal .. "-slag-smelting")
    unhide(metal.plate)
end

-- prepare recipe for next loop. (the recipe amount will not apply otherwise)
vgal.recipe.replace_ingredient("angels-ore2-crystal", "angels-liquid-hydrofluoric-acid", "angels-liquid-sulfuric-acid")

--- ores (see docs/ore-density) ---
for _, ore_index in ipairs(agal.constants.ORE_INDEXES) do
    -- chunk
    data.raw["recipe"]["angels-ore" .. ore_index .. "-chunk"].energy_required = 1.6
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-chunk", 6, "angels-ore" .. ore_index .. "-crushed")
    vgal.recipe.set_result_amount("angels-ore" .. ore_index .. "-chunk", 4, "angels-ore" .. ore_index .. "-chunk")
    vgal.recipe.set_result_amount("angels-ore" .. ore_index .. "-chunk", 50, "angels-water-yellow-waste")

    -- chunk geode removal
    if ore_index == 2 then
        vgal.recipe.set_result_amount("angels-ore" .. ore_index .. "-chunk", 0, "angels-geode-purple")
    else
        vgal.recipe.set_result_amount("angels-ore" .. ore_index .. "-chunk", 0, "angels-geode-yellow")
    end

    -- crystal
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-crystal", 5, "angels-liquid-sulfuric-acid")
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-crystal", 5, "angels-ore" .. ore_index .. "-chunk")
    vgal.recipe.set_result_amount("angels-ore" .. ore_index .. "-crystal", 4, "angels-ore" .. ore_index .. "-crystal")

    -- pure
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-pure", 4, "angels-ore" .. ore_index .. "-crystal")
    vgal.recipe.set_result_amount("angels-ore" .. ore_index .. "-pure", 2, "angels-ore" .. ore_index .. "-pure")

    -- processing
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-chunk-processing", 4,
        "angels-ore" .. ore_index .. "-chunk")
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-crystal-processing", 4,
        "angels-ore" .. ore_index .. "-crystal")
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-pure-processing", 2, -- should be 2.25
        "angels-ore" .. ore_index .. "-pure")
end

--- restore processing recipes ---
data.raw["recipe"]["angels-ore3-crushed-processing"].results = vgal.build.table({
    { "iron-ore",            1 },
    { "angels-iron-nugget",  1 },
    { "angels-iron-pebbles", 2 },
})
data.raw["recipe"]["angels-ore3-chunk-processing"].results = vgal.build.table({
    { "iron-ore",            1 },
    { "angels-iron-nugget",  2 },
    { "angels-iron-pebbles", 4 },
})
data.raw["recipe"]["angels-ore3-crystal-processing"].results = vgal.build.table({
    { "iron-ore",            2 },
    { "angels-iron-nugget",  3 },
    { "angels-iron-pebbles", 3 },
    { "angels-iron-slag",    1 },
})
data.raw["recipe"]["angels-ore3-pure-processing"].results = vgal.build.table({
    { "iron-ore",            2 },
    { "angels-iron-nugget",  5 },
    { "angels-iron-pebbles", 3 },
    { "angels-iron-slag",    1 },
})

data.raw["recipe"]["angels-ore2-crushed-processing"].results = vgal.build.table({
    { "copper-ore",           2 },
    { "angels-copper-nugget", 1 },
})
data.raw["recipe"]["angels-ore2-chunk-processing"].results = vgal.build.table({
    { "copper-ore",            2 },
    { "angels-copper-nugget",  2 },
    { "angels-copper-pebbles", 2 },
})
data.raw["recipe"]["angels-ore2-crystal-processing"].results = vgal.build.table({
    { "copper-ore",            4 },
    { "angels-copper-nugget",  2 },
    { "angels-copper-pebbles", 3 },
    { "angels-copper-slag",    1 },
})
data.raw["recipe"]["angels-ore2-pure-processing"].results = vgal.build.table({
    { "copper-ore",            3 },
    { "angels-copper-nugget",  4 },
    { "angels-copper-pebbles", 5 },
    { "angels-copper-slag",    1 },
})

for _, metal in pairs(vgal.constants.METALS) do
    data.raw["recipe"][metal.plate].ingredients = vgal.build.table({
        { metal.crushed, 3 }
    })
end


--- ore gen removal ---
for _, ore_index in pairs(agal.constants.REMOVED_ORE_INDEXES) do
    local ore = "angels-ore" .. ore_index

    vgal.data.deep_hide(data.raw["resource"][ore])
    data.raw["autoplace-control"][ore] = nil
    data.raw["planet"]["nauvis"].map_gen_settings.autoplace_controls[ore] = nil
    data.raw["planet"]["nauvis"].map_gen_settings.autoplace_settings.entity.settings[ore] = nil

    for _, map_gen_preset in pairs(data.raw["map-gen-presets"]) do
        for key, value in pairs(map_gen_preset) do
            if key == "name" or key == "type" then
                goto continue
            end
            --- @type MapGenPreset
            value = value -- for docs.

            if value.basic_settings and value.basic_settings.autoplace_controls then
                value.basic_settings.autoplace_controls[ore] = nil
            end

            ::continue::
        end
    end
end
