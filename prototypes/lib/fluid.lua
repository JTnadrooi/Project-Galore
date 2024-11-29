function vgal.fluid.unhide(fluidName)
    data.raw["fluid"][fluidName].hidden = false
end
function vgal.fluid.hide(fluidName)
    data.raw["fluid"][fluidName].hidden = true
end
function vgal.fluid.is_modded(fluidName, modtag)
	if modtag == "bitumen" and data.raw["fluid"][fluidName].subgroup then
		local group = data.raw["item-subgroup"][data.raw["fluid"][fluidName].subgroup].group
		return group == "tooling" or group == "precision-machining" or group == "bitumen"
	end

	if data.raw["fluid"][fluidName].icon then
		return string.find(data.raw["fluid"][fluidName].icon, modtag)
	else
		return false
	end
end