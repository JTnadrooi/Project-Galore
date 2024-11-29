vgal.data.extend(
    {
        -- region *multi-grenade
        {
            type = "recipe",
            name = "vgal-multi-grenade",
            enabled = false,
            energy_required = 20,
            ingredients = {
                { "explosives", 1 },
                { "iron-plate", 35 }
            },
            result = "grenade",
            result_count = 8,
            icons = vgal.icon.register {
                {
                    icon = "__base__/graphics/icons/grenade.png",
                    icon_size = 64,
                    icon_mipmaps = 4
                },
                {
                    icon = "__base__/graphics/icons/explosives.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                    scale = 0.25,
                    shift = { -8, -8 }
                }
            }
        },
        -- endregion
        -- region *efficient-firearm-magazine
        {
            type = "recipe",
            name = "vgal-efficient-firearm-magazine",
            subgroup = data.raw.ammo["firearm-magazine"].subgroup,
            order = data.raw.ammo["firearm-magazine"].order,
            category = "crafting-with-fluid",
            enabled = false,
            energy_required = 8,
            ingredients = {
                { type = "fluid", name = "sulfuric-acid", amount = 10 },
                { "iron-plate",   12 }
            },
            results = {
                { type = "item", name = "firearm-magazine", amount = 8 },
                { type = "item", name = "iron-ore",         amount = 1 }
            },
            icons = vgal.icon.register {
                {
                    icon = "__base__/graphics/icons/firearm-magazine.png",
                    icon_size = 64,
                    icon_mipmaps = 4
                },
                {
                    icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                    scale = 0.25,
                    shift = { -8, -8 }
                }
            }
        },
        -- endregion
        -- region *efficient-piercing-rounds-magazine
        {
            type = "recipe",
            name = "vgal-efficient-piercing-rounds-magazine",
            category = "crafting-with-fluid",
            subgroup = data.raw.ammo["piercing-rounds-magazine"].subgroup,
            order = data.raw.ammo["piercing-rounds-magazine"].order,
            enabled = false,
            energy_required = 8,
            ingredients = {
                { type = "fluid",     name = "sulfuric-acid", amount = 10 },
                { "firearm-magazine", 6 },
                { "steel-plate",      2 }
            },
            results = {
                { type = "item", name = "piercing-rounds-magazine", amount = 8 },
                { type = "item", name = "iron-ore",                 amount = 1 }
            },
            icons = vgal.icon.register {
                {
                    icon = "__base__/graphics/icons/piercing-rounds-magazine.png",
                    icon_size = 64,
                    icon_mipmaps = 4
                },
                {
                    icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                    scale = 0.25,
                    shift = { -8, -8 }
                }
            }
        },
        -- endregion
        -- region *efficient-explosive-rocket
        {
            type = "recipe",
            name = "vgal-efficient-explosive-rocket",
            category = "crafting",
            subgroup = "ammo",
            enabled = false,
            energy_required = 8,
            ingredients = {
                { "rocket",  1 },
                { "grenade", 5 }
            },
            result = "explosive-rocket",
            result_count = 1,
            icons = vgal.icon.register {
                {
                    icon = "__base__/graphics/icons/rocket.png",
                    icon_size = 64,
                    icon_mipmaps = 4
                },
                {
                    icon = "__base__/graphics/icons/grenade.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                    scale = 0.25,
                    shift = { -8, -8 }
                }
            }
        },
        -- endregion
        -- region *efficient-sulfur-explosive-rocket
        {
            type = "recipe",
            name = "vgal-efficient-sulfur-explosive-rocket",
            category = "crafting-with-fluid",
            enabled = false,
            energy_required = 8,
            ingredients = {
                { "rocket",       3 },
                { "grenade",      5 },
                { type = "fluid", name = "sulfuric-acid", amount = 10 },
                { "iron-plate",   2 }
            },
            results = {
                { type = "item", name = "explosive-rocket", amount = 3 },
                { type = "item", name = "iron-ore",         amount = 1 }
            },
            subgroup = data.raw.ammo["explosive-rocket"].subgroup,
            order = data.raw.ammo["explosive-rocket"].order,
            icons = vgal.icon.register {
                {
                    icon = "__base__/graphics/icons/rocket.png",
                    icon_size = 64,
                    icon_mipmaps = 4
                },
                {
                    icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                    scale = 0.25,
                    shift = { -8, -8 }
                }
            }
        },
        -- endregion
        -- region *efficient-rocket
        {
            type = "recipe",
            name = "vgal-efficient-rocket",
            category = "crafting",
            subgroup = "ammo",
            enabled = false,
            energy_required = 8,
            ingredients = {
                { "electronic-circuit", 1 },
                { "grenade",            2 },
                { "iron-plate",         2 }
            },
            result = "rocket",
            result_count = 1,
            icons = vgal.icon.register {
                {
                    icon = "__base__/graphics/icons/rocket.png",
                    icon_size = 64,
                    icon_mipmaps = 4
                },
                {
                    icon = "__base__/graphics/icons/grenade.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                    scale = 0.25,
                    shift = { -8, -8 }
                }
            }
        },
        -- endregion
        -- region *efficient-sulfur-rocket
        {
            type = "recipe",
            name = "vgal-efficient-sulfur-rocket",
            category = "crafting-with-fluid",
            enabled = false,
            energy_required = 8,
            ingredients = {
                { "electronic-circuit", 1 },
                { "grenade",            2 },
                { type = "fluid",       name = "sulfuric-acid", amount = 10 },
                { "iron-plate",         2 }
            },
            results = {
                { type = "item", name = "rocket",   amount = 3 },
                { type = "item", name = "iron-ore", amount = 1 }
            },
            subgroup = data.raw.ammo["rocket"].subgroup,
            order = data.raw.ammo["rocket"].order,
            icons = vgal.icon.register {
                {
                    icon = "__base__/graphics/icons/rocket.png",
                    icon_size = 64,
                    icon_mipmaps = 4
                },
                {
                    icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                    scale = 0.25,
                    shift = { -8, -8 }
                }
            }
        },
        -- endregion
        -- region *steel-shotgun-shell
        {
            type = "recipe",
            name = "vgal-steel-shotgun-shell",
            enabled = false,
            energy_required = 3,
            ingredients = {
                { "steel-plate", 1 },
                { "iron-plate",  2 }
            },
            result = "shotgun-shell",
            icons = vgal.icon.register {
                {
                    icon = "__base__/graphics/icons/shotgun-shell.png",
                    icon_size = 64,
                    icon_mipmaps = 4
                },
                {
                    icon = "__base__/graphics/icons/steel-plate.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                    scale = 0.25,
                    shift = { -8, -8 }
                }
            }
        },
        -- endregion
        -- region *chained-explosive-cannon-shell
        {
            type = "recipe",
            name = "vgal-chained-explosive-cannon-shell",
            category = "crafting",
            subgroup = "ammo",
            enabled = false,
            energy_required = 3,
            ingredients = {
                { "cannon-shell", 1 },
                { "explosives",   1 }
            },
            result = "explosive-cannon-shell",
            icons = vgal.icon.register {
                {
                    icon = "__base__/graphics/icons/explosive-cannon-shell.png",
                    icon_size = 64,
                    icon_mipmaps = 4
                },
                {
                    icon = "__base__/graphics/icons/cannon-shell.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                    scale = 0.25,
                    shift = { -8, -8 }
                }
            }
        },
        -- endregion
        -- region *chained-grenade-explosive-cannon-shell
        {
            type = "recipe",
            name = "vgal-chained-grenade-explosive-cannon-shell",
            category = "crafting",
            subgroup = "ammo",
            enabled = false,
            energy_required = 3,
            ingredients = {
                { "cannon-shell", 1 },
                { "explosives",   6 }
            },
            result = "explosive-cannon-shell",
            icons = vgal.icon.register {
                {
                    icon = "__base__/graphics/icons/explosive-cannon-shell.png",
                    icon_size = 64,
                    icon_mipmaps = 4
                },
                {
                    icon = "__base__/graphics/icons/explosives.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                    scale = 0.25,
                    shift = { -8, -8 }
                }
            }
        },
        -- endregion
        -- region *flamethrower-ammo-from-light-oil
        {
            type = "recipe",
            name = "vgal-flamethrower-ammo-from-light-oil",
            icons = vgal.icon.register {
                vgal.icon.get("flamethrower-ammo"),
                vgal.icon.get_in("light-oil", "fluid")
            },
            category = "chemistry",
            energy_required = 6,
            enabled = false,
            ingredients = {
                { "steel-plate",  5 },
                { type = "fluid", name = "light-oil", amount = 140 },
            },
            results = {
                { "flamethrower-ammo", 1 }
            }
        },
        -- endregion
        -- region *flamethrower-ammo-from-heavy-oil
        {
            type = "recipe",
            name = "vgal-flamethrower-ammo-from-heavy-oil",
            icons = vgal.icon.register {
                vgal.icon.get("flamethrower-ammo"),
                vgal.icon.get_in("heavy-oil", "fluid")
            },
            category = "chemistry",
            energy_required = 6,
            enabled = false,
            ingredients = {
                { "steel-plate",  5 },
                { type = "fluid", name = "heavy-oil", amount = 60 },
            },
            results = {
                { "flamethrower-ammo", 1 }
            }
        },
        -- endregion
    }
)
vgal.tech.add_recipe("tank", "vgal-chained-explosive-cannon-shell")
vgal.tech.add_recipe("tank", "vgal-chained-grenade-explosive-cannon-shell")

vgal.tech.add_recipe("explosives", "vgal-multi-grenade")

vgal.tech.add_recipe("vgal-sulfuric-ammo", "vgal-efficient-firearm-magazine")
vgal.tech.add_recipe("vgal-sulfuric-ammo", "vgal-efficient-piercing-rounds-magazine")

vgal.tech.add_recipe("rocketry", "vgal-efficient-rocket")
vgal.tech.add_recipe("rocketry", "vgal-efficient-sulfur-rocket")

vgal.tech.add_recipe("explosive-rocketry", "vgal-efficient-explosive-rocket")
vgal.tech.add_recipe("explosive-rocketry", "vgal-efficient-sulfur-explosive-rocket")

vgal.tech.add_recipe("military-2", "vgal-steel-shotgun-shell")

vgal.tech.add_recipe("flamethrower", "vgal-flamethrower-ammo-from-heavy-oil")
vgal.tech.add_recipe("flamethrower", "vgal-flamethrower-ammo-from-light-oil")
