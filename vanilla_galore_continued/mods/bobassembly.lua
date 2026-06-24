if not mods["bobassembly"] then return end

if settings.startup["bobmods-assembly-electronicmachines"].value then
    for _, recipe in vgal.data.domain_pairs("vgal", "recipe") do
        ---@cast recipe data.RecipePrototype

        if
            (
                (recipe.main_product == "electronic-circuit") or
                (recipe.main_product == "advanced-circuit") or
                (recipe.main_product == "processing-unit") or
                (recipe.main_product == "speed-module") or
                (recipe.main_product == "speed-module-2") or
                (recipe.main_product == "speed-module-3") or
                (recipe.main_product == "quality-module") or
                (recipe.main_product == "quality-module-2") or
                (recipe.main_product == "quality-module-3") or
                (recipe.main_product == "productivity-module") or
                (recipe.main_product == "productivity-module-2") or
                (recipe.main_product == "productivity-module-3") or
                (recipe.main_product == "efficiency-module") or
                (recipe.main_product == "efficiency-module-2") or
                (recipe.main_product == "efficiency-module-3")
            ) and
            ((not vgal.recipe.has_category(recipe.name, "organic")) and (vgal.recipe.has_category(recipe.name, "crafting") or vgal.recipe.has_category(recipe.name, "crafting-with-fluid")))
        then
            recipe.additional_categories = recipe.additional_categories or {}
            table.insert(recipe.additional_categories, "electronics")
        end
    end
end
