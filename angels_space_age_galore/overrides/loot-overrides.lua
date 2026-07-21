for _, tree_name in ipairs({
    "ashland-lichen-tree",
    "ashland-lichen-tree-flaming",
}) do
    local tree = data.raw["tree"][tree_name]
    local results = vgal.build.table({
        { "angels-wood-charcoal", nil, { amount_min = 1, amount_max = 4 } },
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

vgal.entity.set_results(data.raw["tree"]["water-cane"], vgal.build.table({
    { "angels-cellulose-fiber", nil, { amount_min = 1, amount_max = 2 } }
}))
