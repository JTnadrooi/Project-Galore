vgal.item = vgal.item or {}

---@param item_or_item_name string|data.ItemPrototype
function vgal.item.hide(item_or_item_name)
    local item = vgal.get_from_prototype_or_prototype_name(item_or_item_name, "recipeable-item")

    vgal.data.hide(item)
end

---@param item_or_item_name string|data.ItemPrototype
---@param spoil_minutes number
---@param spoil_result string?
function vgal.item.set_spoil_minutes(item_or_item_name, spoil_minutes, spoil_result)
    local item = vgal.get_from_prototype_or_prototype_name(item_or_item_name, "recipeable-item")

    if spoil_minutes == 0 then
        error("Invalid spoil_minutes: " .. spoil_minutes)
    end

    item.spoil_ticks = spoil_minutes * 3600
    item.spoil_result = spoil_result or "spoilage"
end

---@param item_or_item_name string|data.ItemPrototype
---@param rocket_capacity integer|"too-heavy"
function vgal.item.set_rocket_capacity(item_or_item_name, rocket_capacity)
    local item = vgal.get_from_prototype_or_prototype_name(item_or_item_name, "recipeable-item")

    if rocket_capacity == "too-heavy" then
        item.weight = 2000000
    else
        item.weight = 1000000 / rocket_capacity
    end
end
