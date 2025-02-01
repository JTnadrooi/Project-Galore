if mods["DemolisherScales"] then
    for _, recipe in pairs(data.raw["recipe"]) do
        if recipe.name:match("^vgal%-.+%-big%-mining%-drill$") then
            table.insert(recipe.ingredients,
                { type = "item", name = "demolisher-scale", amount = 1 })
        end
    end
end