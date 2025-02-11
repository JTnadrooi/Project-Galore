if not mods["DemolisherScales"] then return end

for _, recipe in pairs(vgal.recipes) do
    if recipe.main_product == "big-mining-drill" then
        table.insert(recipe.ingredients, { type = "item", name = "demolisher-scale", amount = 1 })
    end
end
