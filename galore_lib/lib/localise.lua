function vgal.locale.get_lazy(product)
    if product:sub(-9) == "equipment" then return { "equipment-name." .. product } end
    local item = data.raw.item[product]
    if item then return { (item.place_result and "entity" or "item") .. "-name." .. product } end
    if data.raw.fluid[product] then return { "fluid-name." .. product } end
    return { (data.raw["item-with-entity-data"][product] and "entity" or "item") .. "-name." .. product }
end
