vgal.data.extend
{
	-- region *steel-pistol
	{
		type = "recipe",
		name = "vgal-steel-pistol",
		enabled = false,
		energy_required = 5,
		ingredients =
		{
			{ "steel-plate", 1 },
			{ "iron-plate",  5 }
		},
		result = "pistol",
		icons = vgal.icon.register {
			vgal.icon.get("pistol"),
			vgal.icon.get_in("steel-plate"),
		},
	},
	-- endregion	
	-- region *steel-submachine-gun
	{
		type = "recipe",
		name = "vgal-steel-submachine-gun",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
			{ "iron-gear-wheel", 10 },
			{ "steel-plate",     1 },
			{ "iron-plate",      10 }
		},
		result = "submachine-gun",
		icons = vgal.icon.register {
			vgal.icon.get("submachine-gun"),
			vgal.icon.get_in("steel-plate"),
		},
	},
	-- endregion
	-- region *steel-shotgun
	{
		type = "recipe",
		name = "vgal-steel-shotgun",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
			{ "iron-gear-wheel", 5 },
			{ "steel-plate",     2 },
			{ "iron-plate",      15 }
		},
		result = "shotgun",
		icons = vgal.icon.register {
			vgal.icon.get("shotgun"),
			vgal.icon.get_in("steel-plate"),
		},
	},
	-- endregion
}
vgal.tech.add_recipe("vgal-steel-military", "vgal-steel-pistol")
vgal.tech.add_recipe("vgal-steel-military", "vgal-steel-submachine-gun")
vgal.tech.add_recipe("vgal-steel-military", "vgal-steel-shotgun")
