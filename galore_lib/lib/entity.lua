vgal.entity = vgal.entity or {}

---@param entity_prototype data.EntityPrototype
---@return integer size
function vgal.entity.get_size(entity_prototype)
    local box = entity_prototype.collision_box

    if not box then
        return 0
    end

    local width = math.abs(box[2][1] - box[1][1])
    local height = math.abs(box[2][2] - box[1][2])

    if math.abs(width - height) > 0.001 then
        error(string.format(
            "Entity prototype '%s' has non-square collision box: %.2f x %.2f",
            entity_prototype.name or "unknown",
            width,
            height
        ))
    end

    return math.ceil(width)
end

local function ensure_results(entity_prototype)
    if not entity_prototype.minable then
        error("Entity " .. entity_prototype.name .. " is not minable.")
    end
    local minable = entity_prototype.minable

    if minable.result then
        local result    = {
            name   = minable.result,
            amount = minable.count or 1,
            type   = "item"
        }
        minable.results = { result }
        minable.result  = nil
        minable.count   = nil
    end

    if not minable.results then
        minable.results = {}
    end

    return minable
end

---@param entity_prototype data.EntityPrototype
---@param results (data.FluidProductPrototype|data.ItemProductPrototype)[]
function vgal.entity.set_results(entity_prototype, results)
    if not entity_prototype.minable then
        error("Entity " .. entity_prototype.name .. " is not minable.")
    end

    entity_prototype.minable.result  = nil
    entity_prototype.minable.count   = nil

    entity_prototype.minable.results = results
end

---@param entity_prototype data.EntityPrototype
---@param result (data.FluidProductPrototype|data.ItemProductPrototype)
function vgal.entity.add_result(entity_prototype, result)
    local minable = ensure_results(entity_prototype)
    table.insert(minable.results, result)
end
