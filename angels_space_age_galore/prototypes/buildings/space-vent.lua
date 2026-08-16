do
    local space_vent_item = table.deepcopy(data.raw["item"]["angels-ground-water-pump"])
    space_vent_item.name = "vgal-space-vent"
    space_vent_item.place_result = "vgal-space-vent"
    space_vent_item.subgroup = "space-platform"
    space_vent_item.order = "x"

    data:extend({ space_vent_item })
end

data:extend({
    {
        type = "recipe-category",
        name = "vgal-space-venting",
    },
    {
        type = "item-subgroup",
        name = "vgal-space-vent-void",
        group = "space",
        order = "x",
    },
})

do
    local space_vent = table.deepcopy(data.raw["offshore-pump"]["angels-ground-water-pump"])
    ---@cast space_vent data.FurnacePrototype
    space_vent.name = "vgal-space-vent"
    space_vent.type = "furnace"
    space_vent.minable.result = "vgal-space-vent"
    space_vent.pumping_speed = nil
    space_vent.crafting_speed = 2
    space_vent.crafting_categories = { "vgal-space-venting" }
    space_vent.collision_mask = { layers = { is_object = true, is_lower_object = true, transport_belt = true } }
    space_vent.tile_buildability_rules =
    {
        { area = { { -0.4, -0.4 }, { 0.4, 0.4 } }, required_tiles = { layers = { ground_tile = true } }, colliding_tiles = { layers = { empty_space = true } }, remove_on_collision = true },
        { area = { { -1, -2 }, { 1, -1 } },        required_tiles = { layers = { empty_space = true } }, colliding_tiles = { layers = {} },                     remove_on_collision = true },
    }
    space_vent.fluid_box = nil
    space_vent.fluid_boxes = {
        {
            volume = 1000,
            ---@diagnostic disable-next-line: undefined-global
            pipe_covers = pipecoverspictures(),
            production_type = "input",
            pipe_connections = {
                {
                    flow_direction = "input",
                    position = { 0, 0 },
                    ---@diagnostic disable-next-line: assign-type-mismatch
                    direction = defines.direction.south,
                },
            },
        }
    }
    space_vent.result_inventory_size = 0
    space_vent.source_inventory_size = 0
    space_vent.surface_conditions = vgal.get_surface_conditions_for("space")

    data:extend({ space_vent })
end

vgal.data.extend({
    {
        name = "space-vent",
        domain = "vgal",
        icons = vgal.icon.register({
            vgal.icon.get("vgal-space-vent"),
        }),
        energy_required = 5,
        technology = "space-platform",
        ingredients = {
            { "low-density-structure", 1 },
            { "pipe",                  10 },
            { "steel-plate",           5 }
        },
        results = {
            { "vgal-space-vent", 1 }
        },
        category = "crafting",
    },
}, {
    type = "recipe",
})
