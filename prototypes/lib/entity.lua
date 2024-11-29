function vgal.entity.unhide(entityName, entityType)
    entityType = entityType or "assembling-machine"
    local entity = data.raw[entityType][entityName]
    for i, v in ipairs(entity.flags) do
        if v == "hidden" then
          return table.remove(entity.flags, i)
        end
    end
end
function vgal.entity.set_effectivity(entityName, entityType, effectivity)
    if data.raw[entityType][entityName] and data.raw[entityType][entityName].burner then
        data.raw[entityType][entityName].burner.effectivity = effectivity
    else
		error(entityType.." with name "..entityName.." has invalid burner values.")
    end
end
function vgal.entity.is_modded(entityName, entityType, modtag)
  	entityType = entityType or "assembling-machine"
	if not data.raw[entityType][entityName] then
		error(entityType.." with name "..entityName.." not found.")
	end
    if data.raw[entityType][entityName].icon then
        return string.find(data.raw[entityType][entityName].icon, modtag)
    else
        return false
    end
	--vgal.any.is_modded(data.raw["technology"][techName], modtag)
end