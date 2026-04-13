vgal.locale = vgal.locale or {}

function vgal.locale.guess_key(item_name)
    if item_name:sub(-9) == "equipment" then return { "equipment-name." .. item_name } end

    local item = data.raw.item[item_name]
    if item then return { (item.place_result and "entity" or "item") .. "-name." .. item_name } end

    if data.raw.fluid[item_name] then return { "fluid-name." .. item_name } end

    return { (data.raw["item-with-entity-data"][item_name] and "entity" or "item") .. "-name." .. item_name }
end
