if not mods["bobassembly"] then return end

if settings.startup["bobmods-assembly-electronicmachines"].value then
    for _, recipe in pairs(vgal.recipes) do
        if recipe.main_product then
            if ((recipe.main_product == "electronic-circuit") or (recipe.main_product == "advanced-circuit") or (recipe.main_product == "processing-unit")) then
                recipe.category = "bob-electronics"
            end
        end
    end
end
