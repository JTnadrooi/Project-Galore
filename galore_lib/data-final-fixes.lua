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

        local ignored = {}
        for _, result in ipairs(recipe.results or {}) do
            if result.ignored_by_productivity then
                if not result.amount or result.ignored_by_productivity < result.amount then
                    table.insert(ignored, result.name .. "(" .. result.ignored_by_productivity .. ")")
                else
                    table.insert(ignored, result.name)
                end
            end
        end

        if #ignored > 0 then
            table.insert(info_lines, "    Ignored: " .. table.concat(ignored, ", "))
        end

        recipe.localised_description = vgal.locale.bypass_max_locale_length(table.concat(info_lines, "\n"))
        ::continue::
    end
end
