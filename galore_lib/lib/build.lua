vgal.build = vgal.build or {}

---@param prefix string?
---@param name string
---@param tier integer?
---@return string
function vgal.build.name(prefix, name, tier)
    tier = tier == 1 and nil or tier
    return (prefix and (prefix .. "-") or "") .. name .. (tier and ("-" .. tier) or "")
end

---@param items_and_fluids vgal.ShorthandRecipeEntry[]?
---@return data.ProductPrototype[]|data.IngredientPrototype[]
function vgal.build.io(items_and_fluids)
    local result = {}
    for _, item_or_fluid in ipairs(items_and_fluids or {}) do
        if data.raw["fluid"][item_or_fluid[1]] then
            table.insert(result, vgal.table.to_longform_io(item_or_fluid, "fluid"))
        else
            table.insert(result, vgal.table.to_longform_io(item_or_fluid, "item"))
        end
    end
    return result
end
