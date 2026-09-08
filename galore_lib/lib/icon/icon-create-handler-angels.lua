if not vgal.defines.flags["agal"] then return end

---@param icon_generator fun(any, any, any): data.IconData[]
---@param blueprint vgal.AngelsGasIconBlueprint|vgal.AngelsLiquidIconBlueprint
---@return data.IconData[]
local function combined_handler(icon_generator, blueprint)
    local inputs = blueprint.inputs
    local outputs = blueprint.outputs

    if blueprint.tier then
        ---@diagnostic disable-next-line: param-type-mismatch
        table.insert(inputs, 1, angelsmods.functions.add_number_icon_layer({}, blueprint.tier, angelsmods.petrochem.number_tint))
    end

    local icons = icon_generator(
        vgal.icon.map_to_angels_molecule_icons_when_available(blueprint.outputs),
        blueprint.palette,
        vgal.icon.map_to_angels_molecule_icons_when_available(blueprint.inputs)
    )

    return icons
end

---@param blueprint vgal.AngelsGasIconBlueprint
---@return data.IconData[]
vgal.icon.create_handlers["angels-gas"] = function(blueprint)
    return combined_handler(angelsmods.functions.create_gas_recipe_icon, blueprint)
end

---@param blueprint vgal.AngelsLiquidIconBlueprint
---@return data.IconData[]
vgal.icon.create_handlers["angels-liquid"] = function(blueprint)
    return combined_handler(angelsmods.functions.create_liquid_recipe_icon, blueprint)
end

---@param blueprint vgal.AngelsLiquidIconBlueprint
---@return data.IconData[]
vgal.icon.create_handlers["angels-sorting"] = function(blueprint)
    local composites = {
        {
            {
                icon = "__angelsrefininggraphics__/graphics/icons/sort-icon.png",
                icon_size = 32,
            },
        }
    }

    if blueprint.inputs[1] then
        table.insert(composites, vgal.icon.shift(vgal.icon.get(blueprint.inputs[1]), 0.5, { -8, -8 })) -- 10 makes it look weird
    end

    if blueprint.outputs[1] then
        table.insert(composites, vgal.icon.shift(vgal.icon.get(blueprint.outputs[1]), 0.5, { 8, 8 })) -- 10 makes it look weird
    end

    return vgal.icon.merge_composites(composites)
end

-- ---@param blueprint vgal.AngelsLiquidIconBlueprint
-- ---@return data.IconData[]
-- vgal.icon.create_handlers["angels-machine"] = function(blueprint)
--     local composites = {
--         {
--             {
--                 icon = "__angelsrefininggraphics__/graphics/icons/sort-icon.png",
--                 icon_size = 32,
--             },
--         }
--     }

--     if blueprint.inputs[1] then
--         table.insert(composites, vgal.icon.shift(vgal.icon.get(blueprint.inputs[1]), 0.5, { -8, -8 }))
--     end

--     if blueprint.outputs[1] then
--         table.insert(composites, vgal.icon.shift(vgal.icon.get(blueprint.outputs[1]), 0.5, { 8, 8 }))
--     end

--     return vgal.icon.merge_composites(composites)
-- end
