vgal.item = vgal.item or {}

---@param item_or_item_name string|data.ItemPrototype
function vgal.item.hide(item_or_item_name)
    local item = vgal.get_from_prototype_or_prototype_name(item_or_item_name, "item")

    vgal.data.hide(item)
end
