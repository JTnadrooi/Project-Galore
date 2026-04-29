vgal.icon = vgal.icon or {}

---@type table<string, table<string, vgal.IconOverride>>
vgal.icon.overrides = vgal.icon.overrides or {}

-- function vgal.icon.shift(icon, scale, shift)
--     scale = scale or 1
--     local icons = {}
--     if #icon == 1 then
--         icon[1].scale = 1
--     end
--     for _, icon2 in ipairs(icon) do
--         local new_icon = util.table.deepcopy(icon2)
--         new_icon.scale = (scale * (new_icon.scale or 1)) * (64 / (new_icon.icon_size or 64))
--         new_icon.shift = shift or new_icon.shift
--         table.insert(icons, new_icon)
--     end
--     return icons
-- end

vgal.icon.directory = {
    base = "__vanilla_galore__/graphics/",
    tech = "__vanilla_galore__/graphics/tech/"
}

---@param icon data.IconData
---@return number
function vgal.icon.get_auto_scale(icon)
    return icon.scale or ((64 / 2) / (icon.icon_size or 64))
end

---@param override vgal.IconOverride
function vgal.icon.add_override(override)
    vgal.icon.overrides[override.name] = vgal.icon.overrides[override.name] or {}
    vgal.icon.overrides[override.name][override.source] = override

    if (not override.composite_icon_override) == (not override.composite_icon_override_function) then
        error("Invalid overide: " .. serpent.block(override))
    end
end

---@param composite_icon data.IconData[]
---@return data.IconData[]
function vgal.icon.normalise_composite_scales(composite_icon)
    local sizes = {}
    for i, icon2 in ipairs(composite_icon) do
        sizes[i] = vgal.icon.get_auto_scale(icon2)
    end
    local normed = vgal.table.normalise_array(sizes)
    local scaled_icons = {}
    for i, icon2 in ipairs(composite_icon) do
        local copy = util.table.deepcopy(icon2)
        copy.scale = normed[i]
        scaled_icons[i] = copy
    end
    for _, scaled_icon in ipairs(scaled_icons) do
        scaled_icon.scale = scaled_icon.scale * (64 / (scaled_icon.icon_size or 64))
    end
    return scaled_icons
end

---@param composite_icon data.IconData[]
---@param scale number?
---@param shift data.Vector.struct|{[1]: number, [2]: number}?
---@return data.IconData[]
function vgal.icon.shift(composite_icon, scale, shift)
    scale = scale or 1
    shift = shift or { 0, 0 }
    local icons = {}
    local icon_normalised = vgal.icon.normalise_composite_scales(composite_icon) -- copies
    for _, icon2 in ipairs(icon_normalised) do
        local new_icon = util.table.deepcopy(icon2)
        if new_icon.scale then
            new_icon.scale = scale * new_icon.scale
        else
            new_icon.scale = scale * vgal.icon.get_auto_scale(new_icon)
        end
        new_icon.shift = shift or new_icon.shift
        table.insert(icons, new_icon)
    end
    return icons
end

---@param tier integer
---@return data.Color
function vgal.icon.get_tier_tint(tier)
    local tints = {
        { a = 1, b = 88 / 255,  g = 204 / 255, r = 119 / 255 }, -- #58cc77
        { a = 1, b = 84 / 255,  g = 208 / 255, r = 222 / 255 }, -- #54d0de
        { a = 1, b = 250 / 255, g = 120 / 255, r = 194 / 255 }, -- #fa78c2
        { a = 1, b = 250 / 255, g = 120 / 255, r = 130 / 255 }, -- #fa7885
        { a = 1, b = 215 / 255, g = 250 / 255, r = 120 / 255 }, -- #d7fa78
    }
    return tints[tier] or { a = 1, b = 0.5, g = 0.5, r = 0.5 }
end

---@param metadata table?
---@return data.IconData[]
function vgal.icon.get_overlay(overlay, metadata)
    return vgal.icon.get_from_path("__galore_lib__/graphics/overlays/" .. overlay .. "-overlay.png", metadata)
end

---@param path data.FileName
---@param metadata table?
---@return data.IconData[]
function vgal.icon.get_from_path(path, metadata)
    local toret = {
        {
            icon = path,
        }
    }
    for key, value in pairs(metadata or {}) do
        toret[1][key] = value
    end
    return toret
end

---@param key_name string
---@param icon_source string? The domain of the icon. This is often a prototype type name but other values are allowed.
---@return data.IconData[]
function vgal.icon.get(key_name, icon_source)
    icon_source = icon_source or vgal.get_recipeable(key_name).type
    if icon_source == "recipe" then
        local recipe = data.raw["recipe"][key_name]
        if recipe.icon then
            return {
                {
                    icon = recipe.icon,
                    icon_size = recipe.icon_size,
                }
            }
        else
            return util.table.deepcopy(recipe.icons or
                error("Cannot get icon from invalid prototype with icons. Key: " ..
                    key_name .. ", Source: " .. icon_source))
        end
    end
    if icon_source == "raw" then
        if key_name == "angels_sorting" then
            return {
                {
                    icon = "__angelsrefininggraphics__/graphics/icons/sort-icon.png",
                    icon_size = 32,
                }
            }
        end
        if key_name == "angels_crushing" then
            return {
                {
                    icon = "__angelsrefininggraphics__/graphics/icons/ore-crusher.png",
                    icon_size = 64,
                    scale = 0.5,
                }
            }
        end
        if key_name == "angels_electrolyzing" then
            return {
                {
                    icon = "__angels_galore__/graphics/icons/electrolyzing-icon-2.png",
                    icon_size = 52,
                }
            }
        end
        if string.find(key_name, "tier") then
            local tier = string.sub(key_name, -1)
            return {
                {
                    icon = "__angelsrefining__/graphics/icons/numerals/num-" .. tier .. "-outline.png",
                    icon_size = 64,
                    tint = { 0, 0, 0, 1 },
                },
                {
                    icon = "__angelsrefining__/graphics/icons/numerals/num-" .. tier .. ".png",
                    icon_size = 64,
                    tint = angelsmods.petrochem.number_tint, -- angelsmods.bioprocessing.number_tint
                },
            }
        end
    end
    if icon_source == "molecule" and mods["angelspetrochem"] then
        if key_name == "acetic-acid" or key_name == "acetic-anhydride" or key_name == "celluslose-acetate" or key_name == "ethanol" or key_name == "propionic-acid" then
            return {
                {
                    icon = "__angelsbioprocessinggraphics__/graphics/icons/molecule-" .. key_name .. ".png",
                    icon_size = 72,
                    -- scale = (72 / 64) * 1.8,
                }
            }
        end

        return {
            {
                icon = "__angelspetrochemgraphics__/graphics/icons/molecules/" .. key_name .. ".png",
                icon_size = 72,
                -- scale = (72 / 64) * 1.8,
            }
        }
    end
    if icon_source == "gas-recipe" and mods["angelspetrochem"] then
        return angelsmods.functions.create_gas_recipe_icon(nil, key_name)
    end

    local override = vgal.icon.overrides[key_name]
    if override and override[icon_source] then
        return override[icon_source].composite_icon_override or override[icon_source].composite_icon_override_function()
    end

    local associated_item_prototype = vgal.get_recipeable(key_name)

    vgal.log("getting icon: " .. associated_item_prototype.name)

    if associated_item_prototype then
        if associated_item_prototype.icon then
            if associated_item_prototype.icon == nil or associated_item_prototype.icon == '' then
                error()
            end
            return {
                {
                    icon = associated_item_prototype.icon,
                    icon_size = associated_item_prototype.icon_size or 64,
                }
            }
        end
        if associated_item_prototype.icons then
            local icons = util.table.deepcopy(associated_item_prototype.icons)
            return icons
        end
    end
    error()
end

-- local function targeted_shift_icon(icon, target, scaleOverride)
--     local shift = {}
--     local scale = 1
--     if target then
--         scale = (scaleOverride or 0.25) * (64 / (icon.icon_size or 64))
--         -- if target == "core" then
--         --     scale = icon.scale
--         -- end
--         if target == "in1" then
--             shift = { -8, -8 }
--         end
--         if target == "in2" then
--             shift = { 8, -8 }
--         end
--         if target == "in3" then
--             shift = { 0, -8 }
--         end
--         if target == "out1" then
--             shift = { -8, 8 }
--         end
--         if target == "out2" then
--             shift = { 8, 8 }
--         end
--         if target == "out3" then
--             shift = { 0, 8 }
--         end
--     end
--     return vgal.icon.shift(icon, scale, shift)
-- end

---@param key_name string
---@param icon_source string?
---@return data.IconData[]
function vgal.icon.get_in_fluid(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.35, { 0, -6.5 })
end

---@param key_name string
---@param icon_source string?
---@return data.IconData[]
function vgal.icon.get_in_fluid2(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.25, { 0, -5 })
end

---@param key_name string
---@param icon_source string?
---@return data.IconData[]
function vgal.icon.get_in_to(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.38, { -6.5, -6.5 })
end

---@param key_name string
---@param icon_source string?
---@return data.IconData[]
function vgal.icon.get_out_to(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.35, { 5.5, 6.5 })
end

---@param key_name string
---@param icon_source string?
---@return data.IconData[]
function vgal.icon.get_in(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.25, { -8, -8 })
end

---@param key_name string
---@param icon_source string?
---@return data.IconData[]
function vgal.icon.get_in2(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.25, { 8, -8 })
end

---@param key_name string
---@param icon_source string?
---@return data.IconData[]
function vgal.icon.get_out(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.25, { -8, 8 })
end

---@param key_name string
---@param icon_source string?
---@return data.IconData[]
function vgal.icon.get_out2(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.25, { 8, 8 })
end

---@param key_name string
---@param icon_source string?
---@return data.IconData[]
function vgal.icon.get_out3(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.25, { 0, 8 })
end

---@param key_name string
---@param icon_source string?
---@return data.IconData[]
function vgal.icon.get_bg(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 1, { 0, 1.2 })
end

---@return data.IconData[]
function vgal.icon.get_none()
    return vgal.icon.get_from_path("__galore_lib__/graphics/none.png")
end

---@return data.IconData[]
function vgal.icon.get_placeholder()
    return vgal.icon.get_from_path("__galore_lib__/graphics/placeholder.png")
end

---@param key_name string
---@param icon_source string?
---@return data.IconData[]
function vgal.icon.get_in_bg(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.30, { -7, -7 })
end

---@param key_name string
---@param icon_source string?
---@return data.IconData[]
function vgal.icon.get_in_bg2(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.30, { 7, -7 })
end

---@param composite_icons data.IconData[][]
---@return data.IconData[]
function vgal.icon.from_composite(composite_icons)
    local new_icons = {}
    for _, composite_icon in ipairs(composite_icons) do
        for _, icon in ipairs(composite_icon) do
            table.insert(new_icons, icon)
        end
    end
    return new_icons
end

---@param composite_icons data.IconData[][]
---@param composition ("default")?
---@return data.IconData[]
function vgal.icon.register(composite_icons, composition)
    composition = composition or "default"
    -- if composition == "angels_recipe" then
    --     local newIcons = {}
    --     local outIcons = {}
    --     local inIcons = {}
    --     for _, iconTable in ipairs(icons) do
    --         if vgal.icon.get_icon_target(iconTable, true) == "in" then
    --             table.insert(inIcons, iconTable)
    --         elseif vgal.icon.get_icon_target(iconTable, true) == "out" then
    --             table.insert(outIcons, iconTable)
    --         else
    --             table.insert(newIcons, iconTable)
    --         end
    --     end
    --     local scalingConst = 0.3
    --     if #outIcons == 2 then
    --         vgal.icon.set_target(outIcons[2], "out3")
    --     end
    --     if #inIcons == 2 then
    --         vgal.icon.set_target(inIcons[2], "in3")
    --     end
    --     if #inIcons == 1 then
    --         vgal.icon.set_target(inIcons[1], "in3")
    --     end
    --     for index2, iconTable2 in ipairs(outIcons) do
    --         local placeIndex = 0
    --         placeIndex = vgal.icon.get_icon_target_index(iconTable2) or index2
    --         table.insert(newIcons, vgal.icon.shift(iconTable2, scalingConst, { (-11.5 + (11.5 * (placeIndex - 1))), 12 }))
    --     end
    --     for index2, iconTable2 in ipairs(inIcons) do
    --         local placeIndex = 0
    --         placeIndex = vgal.icon.get_icon_target_index(iconTable2) or index2
    --         table.insert(newIcons,
    --             vgal.icon.shift(iconTable2, scalingConst, { (-11.5 + (11.5 * (placeIndex - 1))), -12 }))
    --     end
    --     return vgal.icon.register(newIcons)
    -- end
    if composition == "default" then
        return vgal.icon.from_composite(composite_icons)
    end
    error("unrecognised composition")
end

-- OVERRIDE LOGIC

if mods["angels_galore"] then
    vgal.icon.add_override({
        name = "petroleum-gas",
        source = "fluid",
        composite_icon_override_function = function()
            return vgal.icon.get("methane", "molecule")
        end
    })
    vgal.icon.add_override({
        name = "light-oil",
        source = "fluid",
        composite_icon_override_function = function()
            return vgal.icon.get("angels-liquid-fuel-oil")
        end
    })
    vgal.icon.add_override({
        name = "heavy-oil",
        source = "fluid",
        composite_icon_override_function = function()
            return vgal.icon.get("angels-liquid-naphtha")
        end
    })
    vgal.icon.add_override({
        name = "sulfuric-acid",
        source = "fluid",
        composite_icon_override_function = function()
            return vgal.icon.get("sulfuric-acid", "molecule")
        end
    })

    if mods["reskins-angels"] then
        vgal.icon.add_override({
            name = "iron-plate",
            source = "item",
            composite_icon_override = {
                {
                    icon = "__reskins-angels__/graphics/icons/smelting/plates/angels-plate-iron.png",
                    icon_size = 64,
                }
            }
        })
    else
        vgal.icon.add_override({
            name = "iron-plate",
            source = "item",
            composite_icon_override = {
                {
                    icon = "__angelssmeltinggraphics__/graphics/icons/plate-iron.png",
                    icon_size = 32,
                }
            }
        })
        vgal.icon.add_override({
            name = "copper-plate",
            source = "item",
            composite_icon_override = {
                {
                    icon = "__angelssmeltinggraphics__/graphics/icons/plate-copper.png",
                    icon_size = 32,
                }
            }
        })
        vgal.icon.add_override({
            name = "copper-cable",
            source = "item",
            composite_icon_override = {
                {
                    icon = "__angelssmeltinggraphics__/graphics/icons/wire-copper.png",
                    icon_size = 32,
                }
            }
        })
        vgal.icon.add_override({
            name = "sulfur",
            source = "item",
            composite_icon_override = {
                {
                    icon = "__angelspetrochemgraphics__/graphics/icons/solid-sulfur.png",
                    icon_size = 32,
                }
            }
        })
        vgal.icon.add_override({
            name = "steel-plate",
            source = "item",
            composite_icon_override = {
                {
                    icon = "__angelssmeltinggraphics__/graphics/icons/plate-steel.png",
                    icon_size = 32,
                }
            }
        })
        vgal.icon.add_override({
            name = "iron-stick",
            source = "item",
            composite_icon_override = {
                {
                    icon = "__angelssmeltinggraphics__/graphics/icons/rod-iron.png",
                    icon_size = 32,
                }
            }
        })
    end
end
