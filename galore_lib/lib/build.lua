vgal.build = vgal.build or {}

---@param prefix string?
---@param name string
---@param tier integer?
---@return string
function vgal.build.name(prefix, name, tier)
    tier = tier == 1 and nil or tier
    return (prefix and (prefix .. "-") or "") .. name .. (tier and ("-" .. tier) or "")
end

---@param items vgal.ShorthandRecipeEntry[]?
---@param fluids vgal.ShorthandRecipeEntry[]?
---@return data.ProductPrototype[]|data.IngredientPrototype[]
function vgal.build.table(items, fluids)
    items = items or {}
    fluids = fluids or {}
    local i = vgal.table.to_longform(items, "item")
    local f = vgal.table.to_longform(fluids, "fluid")
    return vgal.table.merge_array(i, f)
end
