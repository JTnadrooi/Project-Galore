vgal.data.extend
{
        -- region *concrete-from-iron-plate
        {
            type = "recipe",
            name = "vgal-concrete-from-iron-plate",
            icons = vgal.icon.register {
                vgal.icon.get("concrete"),
                vgal.icon.get_in("iron-plate"),
            },
            category = "crafting-with-fluid",
            energy_required = 10,
            enabled = false,
            ingredients = { 
                {"iron-plate", 2},
                {type = "fluid", name = "water", amount = 100},
                {"stone-brick", 5}
            },
            result = "concrete",
            result_count = 10,
            subgroup = data.raw.item["concrete"].subgroup,
            order = data.raw.item["concrete"].order,
        },
        -- endregion
        

        -- region *refined-concrete-from-speed-module
        {
            type = "recipe",
            name = "vgal-refined-concrete-from-speed-module", -- well
            icons = vgal.icon.register {
                vgal.icon.get("refined-concrete"),
                vgal.icon.get_in("speed-module", "module"),
            },
            category = "crafting-with-fluid",
            energy_required = 60,
            enabled = false,
            ingredients = {
                {type = "fluid", name = "steam", amount = 50},
                {"speed-module", 1},
                {"concrete", 120},
                {"stone-brick", 5},
            },
            results = {
                {"refined-concrete", 120},
                {type = "fluid", name = "water", amount = 50},
            },
            subgroup = data.raw.item["refined-concrete"].subgroup,
            order = data.raw.item["refined-concrete"].order,
        },
        -- endregion
        
        -- region *refined-concrete-from-uranium-238
        {
            type = "recipe",
            name = "vgal-refined-concrete-from-uranium-238", -- ignore radiation, rock is rock
            icons = vgal.icon.register {
                vgal.icon.get("refined-concrete"),
                vgal.icon.get_in("uranium-238"),
            },
            category = "crafting-with-fluid",
            energy_required = 15,
            enabled = false,
            ingredients = {
                {type = "fluid", name = "water", amount = 50},
                {"concrete", 24},
                {"uranium-238", 5}, -- very smooth rock
            },
            results = {
                {"refined-concrete", 48},
            },
            subgroup = data.raw.item["refined-concrete"].subgroup,
            order = data.raw.item["refined-concrete"].order,
        },
        -- endregion

        -- region *landfill-from-water
        {
            type = "recipe",
            name = "vgal-landfill-from-water", -- muddy landfill
            icons = vgal.icon.register {
                vgal.icon.get("landfill"),
                vgal.icon.get_in("water", "fluid"),
            },
            category = "crafting-with-fluid",
            energy_required = 1,
            enabled = false,
            ingredients = {
                {type = "fluid", name = "water", amount = 20},
                {"stone", 18},
            },
            results = {
                {"landfill", 1},
            },
            subgroup = data.raw.item["landfill"].subgroup,
            order = data.raw.item["landfill"].order,
        },
        -- endregion
        -- region *landfill-from-stone-brick
        {
            type = "recipe",
            name = "vgal-landfill-from-stone-brick", 
            icons = vgal.icon.register {
                vgal.icon.get("landfill"),
                vgal.icon.get_in("stone-brick"),
            },
            category = "crafting-with-fluid",
            energy_required = 0.5,
            enabled = false,
            ingredients = {
                {"stone-brick", 8},
                {type = "fluid", name = "water", amount = 40},
            },
            results = {
                {"landfill", 1},
            },
            subgroup = data.raw.item["landfill"].subgroup,
            order = data.raw.item["landfill"].order,
        },
        -- endregion
}

vgal.tech.add_recipe("concrete", "vgal-concrete-from-iron-plate")

vgal.tech.add_recipe("concrete", "vgal-refined-concrete-from-speed-module")
vgal.tech.add_recipe("uranium-processing", "vgal-refined-concrete-from-uranium-238")

vgal.tech.add_recipe("vgal-landfill-2", "vgal-landfill-from-water")
vgal.tech.add_recipe("vgal-landfill-2", "vgal-landfill-from-stone-brick")