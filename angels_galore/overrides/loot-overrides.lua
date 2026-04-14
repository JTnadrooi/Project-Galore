-- Add wreck loot
local WRECK_SIZES = {
    ["small"] = {
        name = "small",
        mining_time = 0.75,
        results = {
            { "steel-plate", 1,   { probability = 0.25 } },
            { "iron-plate",  nil, { amount_min = 0, amount_max = 2 } },
        }
    },
    ["medium"] = {
        name = "medium",
        mining_time = 1,
        results = {
            { "steel-plate", nil, { amount_min = 0, amount_max = 3 } },
            { "iron-plate",  nil, { amount_min = 0, amount_max = 5 } },
        }
    },
    ["big"] = {
        name = "big",
        mining_time = 1.5,
        results = {
            { "steel-plate",     nil, { amount_min = 0, amount_max = 6 } },
            { "iron-plate",      nil, { amount_min = 0, amount_max = 10 } },
            { "copper-plate",    nil, { amount_min = 1, amount_max = 5 } },

            { "iron-gear-wheel", nil, { amount_min = 0, amount_max = 8 } },
            { "copper-cable",    nil, { amount_min = 2, amount_max = 8 } },
        }
    },
}

for _, size in pairs(WRECK_SIZES) do
    for i = 1, 6 do
        local entity_name = "crash-site-spaceship-wreck-" .. size.name .. "-" .. i
        local entity = data.raw["container"][entity_name] or
            data.raw["simple-entity-with-owner"][entity_name]

        if entity then
            local copy = table.deepcopy(entity)

            copy.type = "simple-entity"

            -- commentedbc: not needed, add and it breaks
            -- copy.localised_name = { "entity-name." .. entity.name }
            -- copy.localised_description = { "entity-description." .. entity.name }

            copy.minable =
            {
                mining_time = size.mining_time,
                results = vgal.build.table(size.results),
            }
            copy.flags = { "placeable-neutral", "placeable-off-grid" }
            copy.hidden = false
            copy.name = "vgal-" .. copy.name

            data:extend({ copy })
        end
    end
end

do
    local entity = data.raw["container"]["crash-site-spaceship"]
    local copy = table.deepcopy(entity)

    copy.type = "simple-entity"

    copy.localised_name = { "entity-name." .. entity.name }
    copy.localised_description = { "entity-description." .. entity.name }

    copy.minable =
    {
        mining_time = 2,
        results = vgal.build.table({
            { "steel-plate",      nil, { amount_min = 6, amount_max = 20 } },
            { "iron-plate",       nil, { amount_min = 12, amount_max = 40 } },

            { "iron-gear-wheel",  nil, { amount_min = 8, amount_max = 20 } },
            { "copper-cable",     nil, { amount_min = 2, amount_max = 8 } },
            { "firearm-magazine", nil, { amount_min = 6, amount_max = 10 } },

            { "rocket-fuel",      2 },
        }),
    }
    copy.flags = { "placeable-neutral", "placeable-off-grid" }
    copy.hidden = false
    copy.name = "vgal-" .. copy.name

    data:extend({ copy })
end


-- add tree loot (add seeds)
for _, tree in pairs(data.raw["tree"]) do
    if (not (string.find(tree.name, "dry") or string.find(tree.name, "dead") or string.find(tree.name, "trunk"))) and tree.minable then
        local results = vgal.build.table({
            { "angels-tree-seed",   1,   { probability = 0.025 } },
            { "angels-solid-leafs", nil, { amount_min = 1, amount_max = 3 } } -- leafs... peculiar. (its not a mispelling but still)
        })

        if tree.minable.result then
            table.insert(results, { type = "item", name = tree.minable.result, amount = tree.minable.count or 1 })
            tree.minable.result = nil
            tree.minable.count = nil
        end

        if tree.minable.results then
            for _, result in ipairs(tree.minable.results) do
                table.insert(results, result)
            end
        end

        tree.minable.results = results
    end
end

-- add crystal rock loot (add geodes)
do
    local crystal_rock_results = {
        { "stone",               nil, { amount_min = 10, amount_max = 15 } },
        { "angels-crystal-dust", nil, { amount_min = 2, amount_max = 5 } },
    }

    for i, geode in ipairs(agal.defines.geodes) do
        table.insert(crystal_rock_results, { geode, 1, { probability = i * 0.05 } })
    end

    data.raw["simple-entity"]["angels-crystal-rock"].minable.results = vgal.build.table(crystal_rock_results)
end

-- I could add limestone to rocks, but I think thats overdoing it a bit.
