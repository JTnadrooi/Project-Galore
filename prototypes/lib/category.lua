
function vgal.category.get_vgal_invalid_category()
    return data.raw["recipe-category"]["vgal-invalid-category"]
end

function vgal.category.get_category_or_invalid(categoryTag)
	if categoryTag == "greenhouse" then
		if mods["apm_power_ldinc"] then
			return data.raw["recipe-category"]["apm_greenhouse"] or error("a")
		end
		if mods["bobgreenhouse"] then
			return data.raw["recipe-category"]["bob-greenhouse"] or error("b")
		end
		return data.raw["recipe-category"]["vgal-invalid-category"]
	end
	error("No placeholder or invalid found for: ".. categoryTag)
end
function vgal.category.get_category_or_invalid_name(categoryTag)
	return vgal.category.get_category_or_invalid(categoryTag).name
end
