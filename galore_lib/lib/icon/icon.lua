vgal.icon = vgal.icon or {}

---@type table<string, {[1]: string, [2]: integer}>
local angels_molecule_map = {
    -- Gases (petrochem)
    ["angels-gas-oxygen"]               = { "__angelspetrochemgraphics__/graphics/icons/molecules/oxygen.png", 64 },
    ["angels-gas-hydrogen"]             = { "__angelspetrochemgraphics__/graphics/icons/molecules/hydrogen.png", 64 },
    ["angels-gas-sulfur-dioxide"]       = { "__angelspetrochemgraphics__/graphics/icons/molecules/sulfur-dioxide.png", 64 },
    ["angels-gas-carbon-dioxide"]       = { "__angelspetrochemgraphics__/graphics/icons/molecules/carbon-dioxide.png", 64 },
    ["angels-gas-carbon-monoxide"]      = { "__angelspetrochemgraphics__/graphics/icons/molecules/carbon-monoxide.png", 64 },
    ["angels-gas-chlorine"]             = { "__angelspetrochemgraphics__/graphics/icons/molecules/chlorine.png", 64 },
    ["angels-gas-ammonia"]              = { "__angelspetrochemgraphics__/graphics/icons/molecules/ammonia.png", 64 },
    ["angels-gas-nitrogen"]             = { "__angelspetrochemgraphics__/graphics/icons/molecules/nitrogen.png", 64 },
    ["angels-gas-hydrogen-fluoride"]    = { "__angelspetrochemgraphics__/graphics/icons/molecules/hydrofluoric-acid.png", 64 },
    ["angels-gas-methanol"]             = { "__angelspetrochemgraphics__/graphics/icons/molecules/methanol.png", 64 },
    ["angels-gas-ethylene"]             = { "__angelspetrochemgraphics__/graphics/icons/molecules/ethylene.png", 72 },
    ["angels-gas-propene"]              = { "__angelspetrochemgraphics__/graphics/icons/molecules/propene.png", 72 },
    ["angels-gas-butane"]               = { "__angelspetrochemgraphics__/graphics/icons/molecules/butane.png", 72 },
    ["angels-gas-benzene"]              = { "__angelspetrochemgraphics__/graphics/icons/molecules/benzene.png", 72 },
    ["angels-gas-methane"]              = { "__angelspetrochemgraphics__/graphics/icons/molecules/methane.png", 64 },
    ["angels-gas-chlor-methane"]        = { "__angelspetrochemgraphics__/graphics/icons/molecules/chloromethane.png", 72 },
    ["angels-gas-acetone"]              = { "__angelspetrochemgraphics__/graphics/icons/molecules/acetone.png", 72 },

    -- Gases from bioprocessing
    ["angels-gas-ethanol"]              = { "__angelsbioprocessinggraphics__/graphics/icons/molecule-ethanol.png", 64 },

    -- Liquids (bioprocessing)
    ["angels-liquid-acetic-acid"]       = { "__angelsbioprocessinggraphics__/graphics/icons/molecule-acetic-acid.png", 64 },
    ["angels-liquid-propionic-acid"]    = { "__angelsbioprocessinggraphics__/graphics/icons/molecule-propionic-acid.png", 72 },
    ["angels-liquid-glycerol"]          = { "__angelsbioprocessinggraphics__/graphics/icons/molecule-glycerol.png", 64 },

    -- Liquids (petrochem)
    ["angels-liquid-phenol"]            = { "__angelspetrochemgraphics__/graphics/icons/molecules/phenol.png", 64 },
    ["angels-liquid-polyethylene"]      = { "__angelspetrochemgraphics__/graphics/icons/molecules/polyethylene.png", 64 },
    ["angels-liquid-hydrochloric-acid"] = { "__angelspetrochemgraphics__/graphics/icons/molecules/hydrochloric-acid.png", 64 },
}

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

---@type table<string, fun(input: vgal.IconBlueprint): data.IconData[]>
vgal.icon.create_handlers = {}

require("icon-create-handler-default")
require("icon-create-handler-arrow")
require("icon-create-handler-fluid")
require("icon-create-handler-angels")

---@param icon data.IconData
---@return number
function vgal.icon.get_auto_scale(icon)
    return (64 / 2) / (icon.icon_size or 64)
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
function vgal.icon.normalize_composite_scales(composite_icon)
    local sizes = {}

    for i, icon in ipairs(composite_icon) do
        sizes[i] = vgal.icon.get_auto_scale(icon)
    end

    local normed = vgal.table.normalize_array(sizes)
    local scaled_icons = {}
    for i, icon in ipairs(composite_icon) do
        local copy = util.table.deepcopy(icon)
        copy.scale = normed[i]
        scaled_icons[i] = copy
    end
    for _, scaled_icon in ipairs(scaled_icons) do
        scaled_icon.scale = scaled_icon.scale * (64 / (scaled_icon.icon_size or 64))
    end
    return scaled_icons
end

---@param shift data.Vector.struct|{[1]: number, [2]: number}
---@return {[1]: number, [2]: number}
function vgal.icon.to_normalized_shift(shift)
    shift = table.deepcopy(shift)

    if shift.x and shift.y then
        shift[1] = shift.x
        shift[2] = shift.y
        shift.x = nil
        shift.y = nil
        return shift
    elseif shift[1] and shift[2] then
        shift.x = nil
        shift.y = nil
        return shift
    else
        error("Invalid shift: " .. serpent.block(shift))
    end
end

---@param composite_icon data.IconData[]
---@param scale number?
---@param shift data.Vector.struct|{[1]: number, [2]: number}?
---@return data.IconData[]
function vgal.icon.shift(composite_icon, scale, shift)
    scale = scale or 1
    shift = shift and vgal.icon.to_normalized_shift(shift) or { 0, 0 }

    local icons = {}

    -- composite_icon = vgal.icon.normalize_composite_scales(composite_icon) -- copies

    for _, icon in ipairs(composite_icon) do
        ---@type data.IconData
        ---@diagnostic disable-next-line: missing-fields
        local new_icon = {}
        new_icon.icon = icon.icon
        new_icon.icon_size = icon.icon_size
        new_icon.draw_background = icon.draw_background
        new_icon.floating = icon.floating
        new_icon.tint = icon.tint

        new_icon.scale = scale * (icon.scale or vgal.icon.get_auto_scale(icon))

        if icon.shift then
            local new_shift = vgal.icon.to_normalized_shift(icon.shift)
            new_shift[1] = (new_shift[1]) * scale + shift[1]
            new_shift[2] = (new_shift[2]) * scale + shift[2]
            new_icon.shift = new_shift
        else
            new_icon.shift = shift
        end

        table.insert(icons, new_icon)
    end

    return icons
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
    local result
    if icon_source == "recipe" then
        local recipe = data.raw["recipe"][key_name]
        if recipe then
            if recipe.icon then
                result = { { icon = recipe.icon, icon_size = recipe.icon_size or 64 } }
            elseif recipe.icons then
                result = util.table.deepcopy(recipe.icons)
            end
        end
        if not result then
            error("Cannot get icon from invalid recipe: " .. key_name)
        end
    else
        local override = vgal.icon.overrides[key_name]
        if override and override[icon_source] then
            local source_override = override[icon_source]
            if source_override.composite_icon_override then
                result = source_override.composite_icon_override
            elseif source_override.composite_icon_override_function then
                result = source_override.composite_icon_override_function()
            end
        end
        if not result then
            local recipeable = vgal.get_recipeable(key_name)
            if recipeable then
                -- vgal.log("getting icon: " .. associated_item.name)
                if recipeable.icon then
                    result = { { icon = recipeable.icon, icon_size = recipeable.icon_size or 64 } }
                elseif recipeable.icons then
                    result = util.table.deepcopy(recipeable.icons)
                end
            end
            if not result then
                error("Cannot get icon from invalid prototype with icons. Key: " .. key_name .. ", Source: " .. icon_source)
            end
        end
    end
    -- vgal.log("successfully got icon for: " .. key_name)
    return result
end

---@param key_name string
---@param icon_source string?
---@return data.IconData[]
function vgal.icon.get_in(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.5, { -8, -8 })
end

---@param key_name string
---@param icon_source string?
---@return data.IconData[]
function vgal.icon.get_in2(key_name, icon_source)
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.5, { 8, -8 })
end

---@param key_name string
---@param icon_source string?
---@param tile_index integer 1|2|3|4|5|6|7|8|9
---@return data.IconData[]
function vgal.icon.get_subicon(key_name, icon_source, tile_index)
    local tile_offsets = {
        { -8, -8 }, -- 1: top-left
        { 0,  -8 }, -- 2: top-center
        { 8,  -8 }, -- 3: top-right
        { -8, 0 },  -- 4: middle-left
        { 0,  0 },  -- 5: center
        { 8,  0 },  -- 6: middle-right
        { -8, 8 },  -- 7: bottom-left
        { 0,  8 },  -- 8: bottom-center
        { 8,  8 }   -- 9: bottom-right
    }

    if tile_index < 1 or tile_index > 9 then
        error("tile_number must be between 1 and 9")
    end

    local offset = tile_offsets[tile_index]
    return vgal.icon.shift(vgal.icon.get(key_name, icon_source), 0.5, offset)
end

---@return data.IconData[]
function vgal.icon.get_placeholder()
    return vgal.icon.get_from_path("__galore_lib__/graphics/placeholder.png")
end

---@param icons data.IconData[]
---@param output_icon_size_format 16|32|64|128|256
---@param input_icon_size_format (16|32|64|128|256)?
---@return data.IconData[]
function vgal.icon.convert_to_icon_size_format(icons, output_icon_size_format, input_icon_size_format)
    input_icon_size_format = input_icon_size_format or 64

    local output_icons = table.deepcopy(icons)

    local ratio = output_icon_size_format / input_icon_size_format
    for _, icon in ipairs(output_icons) do
        if icon.scale then
            icon.scale = icon.scale * ratio
        end
        if icon.shift then
            if icon.shift[1] then
                icon.shift[1] = icon.shift[1] * ratio
                icon.shift[2] = icon.shift[2] * ratio
            elseif icon.shift.x then
                icon.shift.x = icon.shift.x * ratio
                icon.shift.y = icon.shift.y * ratio
            end
        end
    end

    return output_icons
end

---@param composites data.IconData[][]
---@return data.IconData[]
function vgal.icon.merge_composites(composites)
    local new_icons = {}
    for _, composite_icon in ipairs(composites) do
        for _, icon in ipairs(composite_icon) do
            table.insert(new_icons, table.deepcopy(icon))
        end
    end
    return new_icons
end

---@param blueprint vgal.IconBlueprint
function vgal.icon.normalize_blueprint(blueprint)
    blueprint.inputs = blueprint.inputs or {}
    blueprint.outputs = blueprint.outputs or {}
    blueprint.style = blueprint.style or "default"
end

---@param prototype_to data.PrototypeBase|vgal.PrototypeWithIcons
---@param prototype_from data.PrototypeBase|vgal.PrototypeWithIcons
function vgal.icon.copy_icon_data_from(prototype_from, prototype_to)
    prototype_to.icon = prototype_from.icon
    prototype_to.icon_size = prototype_from.icon_size
    prototype_to.icons = prototype_from.icons
end

---@param prototype data.PrototypeBase|vgal.PrototypeWithIcons
function vgal.icon.clear_icon_data(prototype)
    prototype.icons = nil
    prototype.icon = nil
    prototype.icon_size = nil
end

---@param prototype data.PrototypeBase|vgal.PrototypeWithIcons
function vgal.icon.ensure_icons_field(prototype)
    vgal.icon.normalize_icon_fields(prototype)

    if not prototype.icons then
        if prototype.type == "recipe" then
            ---@cast prototype data.RecipePrototype
            if prototype.results and #prototype.results > 0 then
                local main_product = vgal.recipe.get_main_product_or_guess(prototype)

                vgal.icon.copy_icon_data_from(vgal.get_recipeable(main_product), prototype)

                vgal.icon.ensure_icons_field(prototype --[[@as vgal.PrototypeWithIcons]])
                return
            end
        end

        error("Could not ensure icons field for prototype " .. prototype.name)
    end
end

---@param prototype data.PrototypeBase|vgal.PrototypeWithIcons
function vgal.icon.normalize_icon_fields(prototype)
    if prototype.icons then
        prototype.icon = nil
        prototype.icon_size = nil
    elseif prototype.icon then
        prototype.icons = {
            {
                icon = prototype.icon,
                icon_size = prototype.icon_size,
            },
        }
        prototype.icon = nil
        prototype.icon_size = nil
    end
    prototype.icon_size = nil
end

---@param prototype data.PrototypeBase
---@param icons data.IconData[]
function vgal.icon.set_icons(prototype, icons)
    vgal.icon.clear_icon_data(prototype)

    prototype.icons = icons
end

---@param prototype data.PrototypeBase|vgal.PrototypeWithIcons
---@return data.IconData[]
function vgal.icon.get_icons(prototype)
    ---@diagnostic disable-next-line: return-type-mismatch
    return table.deepcopy(prototype.icon and {
        { icon = prototype.icon, icon_size = prototype.icon_size },
    } or prototype.icons)
end

---@param entries string[]
---@return (string|{[1]: string, [2]: integer})[]
function vgal.icon.map_to_angels_molecule_icons_when_available(entries)
    local result = {}
    for _, entry_name in ipairs(entries) do
        table.insert(result, angels_molecule_map[entry_name] or entry_name)
    end
    return result
end

---@param blueprint vgal.AnyIconBlueprint
---@return data.IconData[]
function vgal.icon.create(blueprint)
    vgal.throw.if_param_nil(blueprint, "blueprint")

    blueprint = table.deepcopy(blueprint)

    vgal.icon.normalize_blueprint(blueprint)

    local create_handler = vgal.icon.create_handlers[blueprint.style]
    if create_handler then
        return create_handler(blueprint)
    else
        error("Could not find create handler for type '" .. blueprint.style .. "'")
    end
end

-- OVERRIDE LOGIC

if vgal.defines.flags["agal"] then
    vgal.icon.add_override({
        name = "petroleum-gas",
        source = "fluid",
        composite_icon_override_function = function()
            return vgal.icon.get("angels-gas-methane")
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
    -- vgal.icon.add_override({
    --     name = "sulfuric-acid",
    --     source = "fluid",
    --     composite_icon_override_function = function()
    --         return vgal.icon.get("sulfuric-acid")
    --     end
    -- })

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
        -- commentedbc; ..............................
        -- vgal.icon.add_override({
        --     name = "sulfur",
        --     source = "item",
        --     composite_icon_override = {
        --         {
        --             icon = "__angelspetrochemgraphics__/graphics/icons/solid-sulfur.png",
        --             icon_size = 32,
        --         }
        --     }
        -- })
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
        vgal.icon.add_override({
            name = "holmium-plate",
            source = "item",
            composite_icon_override = {
                {
                    icon = "__angelssmeltinggraphics__/graphics/icons/plate-platinum.png",
                    icon_size = 32,
                    tint = { 229, 182, 207 }
                }
            }
        })
        vgal.icon.add_override({
            name = "lithium-plate",
            source = "item",
            composite_icon_override = {
                {
                    icon = "__angelssmeltinggraphics__/graphics/icons/plate-silver.png",
                    icon_size = 32,
                }
            }
        })
        vgal.icon.add_override({
            name = "tungsten-plate",
            source = "item",
            composite_icon_override = {
                {
                    icon = "__angelssmeltinggraphics__/graphics/icons/plate-titanium.png",
                    icon_size = 32,
                }
            }
        })
        vgal.icon.add_override({
            name = "electrolyte",
            source = "fluid",
            composite_icon_override_function = function()
                return angelsmods.functions.create_viscous_liquid_fluid_icon(nil, { { 230, 60, 120 }, nil, { 235, 80, 130 } })
            end
        })
        vgal.icon.add_override({
            name = "holmium-solution",
            source = "fluid",
            composite_icon_override_function = function()
                return angelsmods.functions.create_viscous_liquid_fluid_icon(
                    nil,
                    { { 113, 104, 109 }, { 113, 104, 109 }, { 217, 173, 173 }, { 217, 173, 173 } }
                )
            end
        })
    end
end
