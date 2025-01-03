local function get_icon_item(keyName, iconSource)
    local function endsWith(str, suffix)
        return str:sub(- #suffix) == suffix
    end
    if iconSource == nil or iconSource == "" then
        iconSource = "item"
    end
    if endsWith(keyName, "-science-pack") then
        iconSource = "tool"
    end
    if endsWith(keyName, "-module") then
        iconSource = "module"
    end
    if endsWith(keyName, "-ammo") then
        iconSource = "ammo"
    end
    vgal.log("getting icon item from; " .. "keyname: " .. keyName .. " iconSource: " .. iconSource)
    local toret = data.raw[iconSource][keyName]
    if not toret then
        error("get_icon_item did not find a icon. keyname: " .. keyName .. " iconSource: " .. (iconSource or "nil"))
    end
    return toret
end

local function get_icon_size(object)
    local size = 32
    if object.icon_size then
        size = object.icon_size
    elseif object.size then
        size = object.size
    end
    return size
end
function vgal.icon.shift(icon, scale, shift)
    local icons = {}
    for _, icon2 in pairs(icon) do
        local new_icon = util.table.deepcopy(icon2)
        if scale then
            local icon_size = get_icon_size(new_icon)
            new_icon.scale = scale * (32 / icon_size)
        end
        new_icon.shift = shift or icon.shift
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

function vgal.icon.get_overlay(overlay)
    vgal.icon.get_from_path("__vanilla_galore__/graphics/icons/" .. overlay .. "-overlay.png")
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

function vgal.icon.get(keyName, iconSource)
    if iconSource == "raw" then
        if keyName == "angels_sorting" then
            return {
                {
                    icon = "__angelsrefining__/graphics/icons/sort-icon.png",
                    icon_size = 32,
                    target = "core",
                }
            }
        end
        if keyName == "angels_electrolyzing" then
            return {
                {
                    icon = "__angels_galore__/graphics/icons/electrolyzing-icon-2.png",
                    icon_size = 52,
                    target = "core",
                }
            }
        end
        if string.find(keyName, "tier") then
            local tier = string.sub(keyName, -1)
            return {
                {
                    icon = "__angelsrefining__/graphics/icons/numerals/num-" .. tier .. "-outline.png",
                    icon_size = 64,
                    tint = { 0, 0, 0, 1 },
                    target = "tier" .. tier
                },
                {
                    icon = "__angelsrefining__/graphics/icons/numerals/num-" .. tier .. ".png",
                    icon_size = 64,
                    tint = angelsmods.petrochem.number_tint, -- angelsmods.bioprocessing.number_tint
                    target = "tier" .. tier
                },
            }
        end
    end
    if iconSource == "molecule" and mods["angelspetrochem"] then
        return {
            {
                icon = "__angelspetrochem__/graphics/icons/molecules/" .. keyName .. ".png",
                icon_size = 72,
                target = "core"
            }
        }
    end
    if iconSource == "gas-recipe" and mods["angelspetrochem"] then
        return vgal.icon.set_target(angelsmods.functions.create_gas_recipe_icon(nil, keyName), "core1")
    end
    if (keyName == "petroleum-gas") and iconSource == "fluid" and mods["angelspetrochem"] then
        return vgal.icon.get("methane", "molecule")
    end
    if (keyName == "sulfuric-acid") and iconSource == "fluid" and mods["angelspetrochem"] then
        return vgal.icon.get("sulfuric-acid", "molecule")
    end
    local toret_item = get_icon_item(keyName, iconSource)

    vgal.log("getting icon: " .. toret_item.name)

    local object = toret_item
    local toret = nil
    if object then
        if object.icon then
            if object.icon == nil or object.icon == '' then
                error()
            end
            toret = {
                { icon = object.icon, target = "core" }
            }
        end
        if object.icons then
            toret = util.table.deepcopy(object.icons)
        end
    end
    return toret
end

local function targeted_shift_icon(icon, target, scaleOverride)
    icon = vgal.icon.set_target(icon, target)
    local shift = {}
    local scale = 1
    if target then
        scale = scaleOverride or 0.25
        if target == "core" then
            scale = icon.scale
        end
        if target == "in1" then
            shift = { -8, -8 }
        end
        if target == "in2" then
            shift = { 8, -8 }
        end
        if target == "in3" then
            shift = { 0, -8 }
        end
        if target == "out1" then
            shift = { -8, 8 }
        end
        if target == "out2" then
            shift = { 8, 8 }
        end
        if target == "out3" then
            shift = { 0, 8 }
        end
    end
    return vgal.icon.shift(icon, scale, shift)
end
function vgal.icon.set_target(icon, target)
    local done = false
    local toret = {}
    for _, value in ipairs(icon) do
        value.target = target
        done = true
        table.insert(toret, value)
    end
    if not done then
        error()
    end
    return toret
end

function vgal.icon.get_in(keyName, iconSource)
    return targeted_shift_icon(vgal.icon.get(keyName, iconSource), "in1")
end

function vgal.icon.get_in2(keyName, iconSource)
    return targeted_shift_icon(vgal.icon.get(keyName, iconSource), "in2")
end

function vgal.icon.get_out(keyName, iconSource)
    return targeted_shift_icon(vgal.icon.get(keyName, iconSource), "out1")
end

function vgal.icon.get_out2(keyName, iconSource)
    return targeted_shift_icon(vgal.icon.get(keyName, iconSource), "out2")
end

function vgal.icon.get_out3(keyName, iconSource)
    return targeted_shift_icon(vgal.icon.get(keyName, iconSource), "out3")
end

function vgal.icon.get_icon_target(icon, trim)
    for _, value in ipairs(icon) do
        if value.target then
            if trim then
                return value.target:sub(1, -2)
            end
            return value.target
        end
    end
    error()
end

function vgal.icon.get_icon_target_index(icon)
    local toret = nil
    for _, value in ipairs(icon) do
        if value.target then
            toret = string.sub(value.target, -1)
            if not (toret:find("%D")) then
                return tonumber(toret)
            else
                return nil
            end
        end
    end
    error()
end

-- function tablelength(T)
--     local count = 0
--     for _ in ipairs(T) do count = count + 1 end
--     return count
-- end

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
    if not composition then
        composition = "default"
    end
    if composition == "default_small" then -- wip
        local newIcons = {}
        for _, iconTable in ipairs(icons) do
            if vgal.icon.get_icon_target(iconTable, true) == "in" then
                table.insert(newIcons, targeted_shift_icon(iconTable, vgal.icon.get_icon_target(iconTable), 0.3))
            elseif vgal.icon.get_icon_target(iconTable, true) == "out" then
                table.insert(newIcons, targeted_shift_icon(iconTable, vgal.icon.get_icon_target(iconTable), 0.3))
            else
                table.insert(newIcons, iconTable)
            end
        end
        return vgal.icon.register(newIcons)
    end
    if composition == "angels_recipe" then
        local newIcons = {}
        local outIcons = {}
        local inIcons = {}
        for _, iconTable in ipairs(icons) do
            if vgal.icon.get_icon_target(iconTable, true) == "in" then
                table.insert(inIcons, iconTable)
            elseif vgal.icon.get_icon_target(iconTable, true) == "out" then
                table.insert(outIcons, iconTable)
            else
                table.insert(newIcons, iconTable)
            end
        end
        local scalingConst = 0.3
        if #outIcons == 2 then
            vgal.icon.set_target(outIcons[2], "out3")
        end
        if #inIcons == 2 then
            vgal.icon.set_target(inIcons[2], "in3")
        end
        if #inIcons == 1 then
            vgal.icon.set_target(inIcons[1], "in3")
        end
        for index2, iconTable2 in ipairs(outIcons) do
            local placeIndex = 0
            placeIndex = vgal.icon.get_icon_target_index(iconTable2) or index2
            table.insert(newIcons, vgal.icon.shift(iconTable2, scalingConst, { (-11.5 + (11.5 * (placeIndex - 1))), 12 }))
        end
        for index2, iconTable2 in ipairs(inIcons) do
            local placeIndex = 0
            placeIndex = vgal.icon.get_icon_target_index(iconTable2) or index2
            table.insert(newIcons,
                vgal.icon.shift(iconTable2, scalingConst, { (-11.5 + (11.5 * (placeIndex - 1))), -12 }))
        end
        return vgal.icon.register(newIcons)
    end
    if composition == "default" then
        return vgal.icon.soft_merge(icons)
    end
    error("unrecognised composition")
end
