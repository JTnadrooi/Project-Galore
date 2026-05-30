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

---@param prototype data.PrototypeBase
function vgal.locale.clear(prototype)
    prototype.localised_name = nil
    prototype.localised_description = nil
end

---@param str string
---@return data.LocalisedString
function vgal.locale.bypass_max_locale_length(str)
    local max_key_lenght = 200
    local max_concat_count = 20           -- the "" key counts as one, so usable slots = 19

    local chunk_size = max_key_lenght - 1 -- 199 characters per chunk

    local num_chunks = math.ceil(#str / chunk_size)

    if num_chunks > max_concat_count then
        error("String too long: requires " .. num_chunks .. " chunks, but maximum is " .. max_concat_count)
    end

    local chunks = {}
    for i = 0, num_chunks - 1 do
        local start_pos = i * chunk_size + 1
        local end_pos = math.min(start_pos + chunk_size - 1, #str)
        table.insert(chunks, string.sub(str, start_pos, end_pos))
    end

    -- first element is "" (concatenation mode), then all chunks
    local result = { "" }
    for _, chunk in ipairs(chunks) do
        table.insert(result, chunk)
    end

    return result
end
