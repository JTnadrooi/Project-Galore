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

function vgal.icon.get_auto_scale(t1_icon)
    return t1_icon.scale or ((64 / 2) / t1_icon.icon_size)
end

function vgal.icon.normalise_composite_scales(icon)
    local sizes = {}
    for i, icon2 in ipairs(icon) do
        sizes[i] = vgal.icon.get_auto_scale(icon2)
    end
    local normed = vgal.table.normalise(sizes)
    local scaled_icons = {}
    for i, icon2 in ipairs(icon) do
        local copy = util.table.deepcopy(icon2)
        copy.scale = normed[i]
        scaled_icons[i] = copy
    end
    for _, scaled_icon in ipairs(scaled_icons) do
        scaled_icon.scale = scaled_icon.scale * (64 / scaled_icon.icon_size)
    end
    return scaled_icons
end

function vgal.icon.shift(icon, scale, shift)
    scale = scale or 1
    local icons = {}
    local icon_normalised = vgal.icon.normalise_composite_scales(icon) -- copies
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

function vgal.icon.get_overlay(overlay, args)
    return vgal.icon.get_from_path("__galore_lib__/graphics/overlays/" .. overlay .. "-overlay.png", args)
end

function vgal.icon.get_from_path(path, args)
    local toret = {
        {
            icon = path,
        }
    }
    for key, value in pairs(args or {}) do
        toret[1][key] = value
    end
    return toret
end

function vgal.icon.get(key_name, icon_source)
    icon_source = icon_source or vgal.any_get_source(key_name)
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
            return util.table.deepcopy(recipe.icons)
        end
    end
    if icon_source == "raw" then
        if key_name == "angels_sorting" then
            return {
                {
                    icon = "__angelsrefining__/graphics/icons/sort-icon.png",
                    icon_size = 32,
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
    if (key_name == "petroleum-gas") and icon_source == "fluid" and mods["angelspetrochem"] then
        return vgal.icon.get("methane", "molecule")
    end
    if (key_name == "light-oil") and icon_source == "fluid" and mods["angelspetrochem"] then
        return vgal.icon.get("liquid-fuel-oil")
    end
    if (key_name == "heavy-oil") and icon_source == "fluid" and mods["angelspetrochem"] then
        return vgal.icon.get("liquid-naphtha")
    end
    if (key_name == "sulfuric-acid") and icon_source == "fluid" and mods["angelspetrochem"] then
        return vgal.icon.get("sulfuric-acid", "molecule")
    end
    local toret_item = vgal.any(key_name)

    vgal.log("getting icon: " .. toret_item.name)

    local toret = nil
    if toret_item then
        if toret_item.icon then
            if toret_item.icon == nil or toret_item.icon == '' then
                error()
            end
            return {
                {
                    icon = toret_item.icon,
                    icon_size = toret_item.icon_size or 64,
                }
            }
        end
        if toret_item.icons then
            local icons = util.table.deepcopy(toret_item.icons)
            -- local all_same = true

            -- local last_scale
            -- for _, icon in ipairs(icons) do
            --     if last_scale == nil then
            --         last_scale = (icon.scale or 1)
            --     elseif (icon.scale or 1) ~= last_scale then
            --         all_same = false
            --         break
            --     end
            -- end

            -- if all_same then
            --     for _, icon in ipairs(icons) do
            --         icon.scale = 1
            --     end
            -- end

            return icons
        end
    end
    return toret
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
function vgal.icon.get_in_fluid(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.35, { 0, -6.5 })
end

function vgal.icon.get_in_fluid2(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.25, { 0, -5 })
end

function vgal.icon.get_in_to(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.38, { -6.5, -6.5 })
end

function vgal.icon.get_out_to(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.35, { 5.5, 6.5 })
end

function vgal.icon.get_in(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.25, { -8, -8 })
end

function vgal.icon.get_in2(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.25, { 8, -8 })
end

function vgal.icon.get_out(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.25, { -8, 8 })
end

function vgal.icon.get_out2(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.25, { 8, 8 })
end

function vgal.icon.get_out3(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.25, { 0, 8 })
end

function vgal.icon.get_bg(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 1, { 0, 1.2 })
end

function vgal.icon.get_none()
    return vgal.icon.get_from_path("__galore_lib__/graphics/none.png")
end

function vgal.icon.get_placeholder()
    return vgal.icon.get_from_path("__galore_lib__/graphics/placeholder.png")
end

function vgal.icon.get_in_bg(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.30, { -7, -7 })
end

function vgal.icon.get_in_bg2(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.30, { 7, -7 })
end

function vgal.icon.soft_merge(icons)
    local new_icons = {}
    for _, icon in pairs(icons) do
        if type(icon) == "table" then
            for _, icon2 in pairs(icon) do
                table.insert(new_icons, icon2)
            end
        else
            table.insert(new_icons, icon)
        end
    end
    return new_icons
end

function vgal.icon.register(icons, composition)
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
        return vgal.icon.soft_merge(icons)
    end
    error("unrecognised composition")
end
