vgal.data.finalise()

if settings.startup["vgal-show-prod-descs"].value then
    for _, recipe in pairs(data.raw["recipe"]) do
        local info_lines = {}

        if recipe.allow_productivity then
            table.insert(info_lines, "Allows productivity")
        else
            recipe.localised_description = "" -- for easier skimming
            goto continue
        end

        local ignored_prod = {}
        local ignored_out_stats = {}
        local ignored_in_stats = {}
        for _, ingredient in ipairs(recipe.ingredients or {}) do
            if ingredient.ignored_by_stats then
                if not ingredient.amount or ingredient.ignored_by_stats < ingredient.amount then
                    table.insert(ignored_in_stats, ingredient.name .. "(" .. ingredient.ignored_by_stats .. ")")
                else
                    table.insert(ignored_in_stats, ingredient.name)
                end
            end
        end
        for _, result in ipairs(recipe.results or {}) do
            if result.ignored_by_productivity then
                if not result.amount or result.ignored_by_productivity < result.amount then
                    table.insert(ignored_prod, result.name .. "(" .. result.ignored_by_productivity .. ")")
                else
                    table.insert(ignored_prod, result.name)
                end
                if result.ignored_by_stats then
                    if not result.amount or result.ignored_by_stats < result.amount then
                        table.insert(ignored_out_stats, result.name .. "(" .. result.ignored_by_stats .. ")")
                    else
                        table.insert(ignored_out_stats, result.name)
                    end
                end
            end
        end

        if #ignored_prod > 0 then
            table.insert(info_lines, "    Ignored(prod): ")
            for _, item in ipairs(ignored_prod) do
                table.insert(info_lines, "        " .. item .. ",")
            end
        end
        if #ignored_in_stats > 0 then
            table.insert(info_lines, "    Ignored(stats, in): ")
            for _, item in ipairs(ignored_in_stats) do
                table.insert(info_lines, "        " .. item .. ",")
            end
        end
        if #ignored_out_stats > 0 then
            table.insert(info_lines, "    Ignored(stats, out): ")
            for _, item in ipairs(ignored_out_stats) do
                table.insert(info_lines, "        " .. item .. ",")
            end
        end

        recipe.localised_description = vgal.locale.bypass_max_locale_length(table.concat(info_lines, "\n"))
        ::continue::
    end
end
