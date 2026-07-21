-- add tree loot (add seeds)
for _, tree in pairs(data.raw["tree"]) do
    if tree.minable and vgal.string.starts_with(tree.name, "tree-0") and not vgal.string.contains(tree.name, "stump") then
        local results = vgal.build.table({
            { "angels-tree-seed",   1,   { independent_probability = 0.025 } },
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

    for i, geode in ipairs(vgal.defines.geodes) do
        table.insert(crystal_rock_results, { geode, 1, { independent_probability = i * 0.05 } })
    end

    data.raw["simple-entity"]["angels-crystal-rock"].minable.results = vgal.build.table(crystal_rock_results)
end

-- I could add limestone to rocks, but I think thats overdoing it a bit.
