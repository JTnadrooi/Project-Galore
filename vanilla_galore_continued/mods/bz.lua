if mods["bzcarbon"] then
    vgal.recipe.all.link_ingredient({ type = "item", name = "diamond", amount = 1 }, "low-density-structure", 1)
    vgal.recipe.all.link_result({ type = "item", name = "diamond", amount = 1 }, "low-density-structure", 0.5)
end
