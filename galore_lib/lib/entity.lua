vgal.entity = vgal.entity or {}

-- I have no idea how entity programming works so please forgive the ai slop (that does work at least)

---Get the tile size (width/height) of an entity prototype from its collision box, squares only
---@param prototype data.EntityPrototype The entity prototype containing a collision_box
---@return integer size The dimensions of the entity in tiles (e.g., 3 for a 3x3 entity)
function vgal.entity.get_size(prototype)
    local box = prototype.collision_box

    if not box then
        return 0
    end

    local width = math.abs(box[2][1] - box[1][1])
    local height = math.abs(box[2][2] - box[1][2])

    if math.abs(width - height) > 0.001 then
        error(string.format(
            "Entity prototype '%s' has non-square collision box: %.2f x %.2f",
            prototype.name or "unknown",
            width,
            height
        ))
    end

    return math.ceil(width)
end
