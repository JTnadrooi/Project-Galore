function vgal.item.unhide(itemName)
    local item = data.raw["item"][itemName]
    for i, v in ipairs(item.flags or {}) do
        if v == "hidden" then
          return table.remove(item.flags, i)
        end
    end
end
function vgal.item.set_subgroup(itemName, newSubgroup)
	data.raw["item"][itemName].subgroup = newSubgroup
end
function vgal.item.hide(itemName)
    local item = data.raw["item"][itemName]
	item.flags = item.flags or {}
    table.insert(item.flags, "hidden")
end
function vgal.item.is_hidden(itemName)
    local item = data.raw["item"][itemName]
    for i, v in ipairs(item.flags or {}) do
        if v == "hidden" then
          return true
        end
    end
	return false
end
function vgal.item.set_order(itemName, newOrder)
	data.raw["item"][itemName].order = newOrder
end

function vgal.item.get_vgal_invalid_item()
	return data.raw["item"]["vgal-invalid-item"]
end

function vgal.item.is_modded(itemName, modtag)
	if modtag == "bitumen" and data.raw["item"][itemName].subgroup then
		local group = data.raw["item-subgroup"][data.raw["item"][itemName].subgroup].group
		return group == "tooling" or group == "precision-machining" or group == "bitumen"
	end

	if data.raw["item"][itemName].icon then
		return string.find(data.raw["item"][itemName].icon, modtag)
	else
		return false
	end
end

function vgal.item.get_item_or_invalid(itemTag)
	if itemTag == "wood-pellet" then
		if mods["apm_power_ldinc"] then
			return data.raw["item"]["apm_wood_pellets"] or error("a")
		end
		if mods["bobgreenhouse"] then
			return data.raw["item"]["wood-pellets"] or error("b")
		end
		return data.raw["item"]["vgal-invalid-item"]
	end
	error("No placeholder found for: ".. itemTag)
end
function vgal.item.get_item_or_invalid_name(itemTag)
	return vgal.item.get_item_or_invalid(itemTag).name
end
function vgal.item.set_as_refined_fuel(itemName)
	if mods["apm_power_ldinc"] then
		vgal.item.set_fuel_category(itemName, "apm_refined_chemical")
	else
		error()
	end
end
function vgal.item.set_fuel_category(itemName, fuelCategory)
	data.raw["item"][itemName].fuel_category = fuelCategory
end
function vgal.item.set_stack_size(itemName, newStackSize)
	data.raw["item"][itemName].stack_size = newStackSize
end
function vgal.item.multiply_stack_size(itemName, multiplier)
	data.raw["item"][itemName].stack_size = (data.raw["item"][itemName].stack_size or 1) * multiplier
end
function vgal.item.get_galorified_stack_size(itemName)
	local newStack = (data.raw["item"][itemName].stack_size or 1) * 2
	if string.find(itemName, "transport-belt") then
		newStack = 400
	end
	if itemName == "wood" then
		newStack = 1000
	end
	if itemName == "sulfur" then
		newStack = 500
	end
	return newStack
end