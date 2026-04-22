vgal.locale = vgal.locale or {}

---@param prototype_name string
---@return data.LocalisedString
function vgal.locale.guess_locale(prototype_name)
    vgal.throw.if_param_nil(prototype_name, "prototype_name")

    if prototype_name:sub(-9) == "equipment" then return { "equipment-name." .. prototype_name } end

    local item = data.raw.item[prototype_name]
    if item then return { (item.place_result and "entity" or "item") .. "-name." .. prototype_name } end

    if data.raw.fluid[prototype_name] then return { "fluid-name." .. prototype_name } end

    return { (data.raw["item-with-entity-data"][prototype_name] and "entity" or "item") .. "-name." .. prototype_name }
end

---@param recipeable_name string
---@param locale_domain "name"|"description"|string?
---@return data.LocalisedString
function vgal.locale.get_backup_locale_for_recipeable(recipeable_name, locale_domain)
    locale_domain = locale_domain or "name"

    return { "?", { "item-" .. locale_domain .. "." .. recipeable_name }, { "entity-" .. locale_domain .. "." .. recipeable_name }, { "fluid-" .. locale_domain .. "." .. recipeable_name } }
end
