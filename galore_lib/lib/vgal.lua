vgal = vgal or {}

vgal.data = vgal.data or {}

---@type table<string, vgal.Domain>
vgal.data.domains = {}

if vgal.setting ~= nil then
    error()
end

require("defines")
require("throw")
require("classes")
require("icon")
require("locale")
require("math")
require("recipe")
require("recipe-all")
require("fluid")
require("item")
require("entity")
require("string")
require("subgroup")
require("tech")
require("table")
require("build")

---@param toLog number|string
function vgal.log(toLog)
    if settings.startup["vgal-log"].value then
        log("vgal.log-[" .. tostring(toLog) .. "]")
    end
end

---@param toLog table
function vgal.log_block(toLog)
    vgal.log(serpent.block(toLog) or error("Cannot log nil."))
end

---@type vgal.VgalToggleGroupPrototype[]
vgal.groups = {}

---@type table<string, boolean>
vgal.productivity_entries = {}

---@type table<string, boolean>
vgal.catalyst_entries = {}
---@type table<string, table<string, boolean>>
vgal.catalyst_groups = {}
---@type table<string, boolean>
vgal.entry_stat_relevant_catalysts = {}

vgal.group_overrides = {}
if vgal.defines.flags["vgal"] then
    local disable_entries = vgal.string.split(settings.startup["vgal-custom-disabled-recipes"].value --[[@as string]], " ")
    local enable_entries = vgal.string.split(settings.startup["vgal-custom-enabled-recipes"].value --[[@as string]], " ")

    for _, disable_entry in ipairs(disable_entries) do
        vgal.group_overrides[disable_entry] = {
            hidden = true
        }
    end

    for _, enable_entry in ipairs(enable_entries) do
        vgal.group_overrides[enable_entry] = {
            hidden = false
        }
    end
end

---@overload fun(domain_name: string, prototype_type: "recipe"): fun(): integer, data.RecipePrototype
---@overload fun(domain_name: string, prototype_type: "fluid"): fun(): integer, data.FluidPrototype
---@overload fun(domain_name: string, prototype_type: "item"): fun(): integer, data.ItemPrototype
---@overload fun(domain_name: string, prototype_type: string): fun(): integer, data.PrototypeBase
function vgal.data.domain_pairs(domain_name, prototype_type)
    vgal.throw.if_param_nil(prototype_type, "prototype_type")

    local dom = vgal.data.domains[domain_name]
    if not vgal.data.domain_exists(domain_name) then
        error("domain " .. domain_name .. " does not exist")
    end
    if not data.raw[prototype_type] then
        error("type " .. tostring(prototype_type) .. " does not exist")
    end

    local function iter(t, last_key)
        local key, entry = next(t, last_key)
        while key do
            if entry
                and entry.type == prototype_type
                and data.raw[prototype_type][entry.name]
            then
                return key, data.raw[prototype_type][entry.name]
            end
            key, entry = next(t, key)
        end
    end

    return iter, dom.entries
end

function vgal.data.create_domain(domain_name)
    if vgal.data.domain_exists(domain_name) then
        error("Domain already exists with name " .. domain_name)
    else
        vgal.log("creating domain: " .. domain_name)
        vgal.data.domains[domain_name] = {
            name = domain_name,
            entries = {},
        }
    end
end

function vgal.data.domain_exists(domain_name)
    return not not vgal.data.domains[domain_name]
end

---Register a entry to the vgal (Vanilla Galore) ecosystem.
---@param entries vgal.VgalRecipePrototype[]|vgal.VgalToggleGroupPrototype[]
---@param fill_in_with? vgal.VgalRecipePrototype|vgal.VgalToggleGroupPrototype
function vgal.data.extend(entries, fill_in_with)
    fill_in_with = fill_in_with or {}

    -- fill_in_with.groups = vgal.table.ensure(fill_in_with.group, fill_in_with.groups)

    for _, entry in ipairs(entries) do
        entry.vgal = entry.vgal or {}
        entry = vgal.table.deep_merge_with_priority(entry, fill_in_with)

        entry.domain = entry.domain or entry.prefix

        local entry_name = vgal.build.name(entry.prefix, entry.name, entry.tier)

        if entry.domain then
            if not vgal.data.domain_exists(entry.domain) then
                vgal.data.create_domain(entry.domain)
            end
            vgal.data.domains[entry.domain].entries[entry_name] = {
                type = entry.type,
                name = entry_name,
            }
        end

        if entry.type == "recipe" then
            ---@cast entry vgal.VgalRecipePrototype

            if entry.complementairy_recipe then
                local complementairy_recipe = data.raw["recipe"][entry.complementairy_recipe]
                entry.order = entry.order or complementairy_recipe.order
                entry.subgroup = entry.subgroup or complementairy_recipe.subgroup
                entry.crafting_machine_tint = entry.crafting_machine_tint or complementairy_recipe.crafting_machine_tint
            end

            -- name components
            entry.tier = entry.tier == 1 and nil or entry.tier
            entry.name = vgal.build.name(entry.prefix, entry.name, entry.tier)

            -- tech kinda, real stuff happens later.
            entry.technologies = vgal.table.ensure(entry.technology, entry.technologies)
            if entry.enabled ~= nil and #entry.technologies > 0 then -- entry cannot have `enabled` set if technolog(y/ies) is set.
                error()
            end

            if entry.enabled == nil then
                entry.enabled = #entry.technologies == 0
            end

            if entry.hide_from_signal_gui == nil then
                -- vgal auto algoritm (different than vanilla)
                if entry.icon or entry.icons then
                    entry.hide_from_signal_gui = false
                else
                    entry.hide_from_signal_gui = true
                end
            end

            -- prevent nils
            entry.fluid_ingredients = entry.fluid_ingredients or {}
            entry.fluid_results = entry.fluid_results or {}
            entry.ingredients = entry.ingredients or {}
            entry.results = entry.results or {}
            entry.module_allows = entry.module_allows or {}

            -- toggle group management
            entry.groups = vgal.table.ensure(entry.group, entry.groups)
            local hidden = false
            for _, group in ipairs(entry.groups) do
                if not vgal.groups[group] then
                    error("Group with name " .. group .. " does not exist, recipe " .. entry.name .. " tries to register to it.")
                end

                if not vgal.groups[group].enabled then
                    hidden = true
                    break
                end
            end

            -- group overrides
            if vgal.group_overrides[entry.name] then
                hidden = vgal.group_overrides[entry.name].hidden
            end

            if hidden then
                vgal.recipe.hide(entry)
            end

            -- icon stuff
            if entry.icon then
                if entry.icons then
                    error("Cannot have both icon and icons set for " .. entry.name)
                end
                entry.icons = {
                    {
                        icon = entry.icon,
                        icon_size = entry.icon_size or 32,
                    }
                }
                entry.icon = nil
                entry.icon_size = nil
            end

            -- prevent nil energy_required
            if not entry.energy_required then
                error("Missing energy_required for " .. entry.name)
            end

            -- in/output table building
            entry.ingredients = entry.raw_ingredients or vgal.build.table(entry.ingredients, entry.fluid_ingredients)
            entry.results = entry.raw_results or vgal.build.table(entry.results, entry.fluid_results)

            -- ensure categories
            entry.categories = vgal.table.ensure(entry.category, entry.categories)
            entry.category = nil
            entry.categories = vgal.recipe.conform_categories_to_recipe(entry, entry.categories)

            if not entry.main_product then
                ---@diagnostic disable-next-line: undefined-field
                entry.main_product = entry.results[1].name
            end

            entry.crafting_machine_tint = entry.crafting_machine_tint or vgal.recipe.get_crafting_machine_tint_or_guess(entry)

            if entry.locale_source then
                entry.localised_name_source = entry.locale_source
                entry.localised_description_source = entry.locale_source
            end
            if entry.localised_name_source then
                entry.localised_name = vgal.recipe.get_localised_name_or_guess(data.raw["recipe"][entry.localised_name_source])
            end
            if entry.localised_description_source then
                entry.localised_description = vgal.recipe.get_localised_description_or_guess(data.raw["recipe"][entry.localised_description_source])
            end
            entry.localised_name = vgal.recipe.get_localised_name_or_guess(entry)
            entry.localised_description = vgal.recipe.get_localised_description_or_guess(entry)

            entry.auto_recycle = false
            entry.allow_decomposition = false
            entry.allow_as_intermediate = false

            if entry.enable_smart_productivity == nil then
                local eligible_for_smart_prod = true
                for _, result in ipairs((entry.results or {})) do
                    --[[@cast result data.ProductPrototype]]
                    if result.ignored_by_productivity then
                        eligible_for_smart_prod = false
                    end
                end

                entry.enable_smart_productivity = eligible_for_smart_prod
            end
            if entry.enable_smart_stats == nil then
                local eligible_for_smart_stats = true
                for _, result in ipairs((entry.results or {})) do
                    --[[@cast result data.ProductPrototype]]
                    if result.ignored_by_stats then
                        eligible_for_smart_stats = false
                    end
                end
                for _, ingredient in ipairs((entry.ingredients or {})) do
                    --[[@cast ingredient data.IngredientPrototype]]
                    if ingredient.ignored_by_stats then
                        eligible_for_smart_stats = false
                    end
                end

                entry.enable_smart_stats = eligible_for_smart_stats
            end

            if entry.allow_productivity == nil then
                entry.allow_productivity = vgal.recipe.get_if_productivity(entry.main_product)
            end

            vgal.log("registering: " .. entry.name)

            ---@diagnostic disable-next-line: assign-type-mismatch
            data:extend { entry }

            if entry.enable_smart_productivity and entry.allow_productivity then
                vgal.recipe.smart_allow_productivity(entry.name)
            end

            if entry.enable_smart_stats then
                vgal.recipe.smart_fix_stats(entry.name)
            end

            for i, tech_entry in ipairs(entry.technologies) do
                if type(tech_entry) == "table" then
                    vgal.tech.create_node(entry, tech_entry, i, hidden)
                elseif type(tech_entry) == "string" then
                    vgal.tech.add_recipe(tech_entry, entry.name)
                else
                    error("Invalid prototype technologies entry: " .. serpent.block(tech_entry))
                end
            end

            if entry.productivity_technology ~= "" then -- so if "", no prod even when tech exists
                entry.productivity_technology = entry.productivity_technology or vgal.recipe.get_productivity_tech_name(
                    entry.main_product)
                if entry.productivity_technology then
                    if type(entry.productivity_technology) == "string" then
                        ---@type string
                        vgal.tech.add_productivity_change(entry.productivity_technology --[[@as string]], entry.name, nil,
                            entry.hidden)
                    else
                        vgal.tech.add_productivity_change(
                            entry.productivity_technology[1],
                            entry.name,
                            entry.productivity_technology[2],
                            entry.hidden
                        )
                    end
                end
            end
        elseif entry.type == "toggle-group" then
            ---@cast entry vgal.VgalToggleGroupPrototype

            if entry.enabled == nil then
                if entry.enabled_setting then
                    ---@diagnostic disable-next-line: assign-type-mismatch
                    entry.enabled = settings.startup[entry.enabled_setting].value
                else
                    ---@diagnostic disable-next-line: assign-type-mismatch
                    entry.enabled = settings.startup[entry.name].value
                end
            end

            vgal.groups[entry.name] = entry
        else
            error("Invalid prototype type " .. entry.type .. " for " .. entry.name)
        end
    end
end

---@param prototype data.PrototypeBase
function vgal.data.hide(prototype)
    prototype.hidden = true
    prototype.hidden_in_factoriopedia = true
    prototype.hide_from_signal_gui = true

    if prototype.type == "recipe" then
        ---@cast prototype data.RecipePrototype
        prototype.hide_from_player_crafting = true
        prototype.allow_decomposition = false
    elseif prototype.type == "fluid" then
        ---@cast prototype data.FluidPrototype
        prototype.auto_barrel = false
        if vgal.defines.flags["agal"] then
            local void_recipe = data.raw["recipe"]["angels-chemical-void-" .. prototype.name] or
                data.raw["recipe"]["angels-water-void-" .. prototype.name]
            if void_recipe then
                vgal.data.hide(void_recipe)
            end
        end
    end
end

---@param prototype data.PrototypeBase
function vgal.data.deepunhide(prototype)
    prototype.hidden = nil
    prototype.hidden_in_factoriopedia = nil
    prototype.hide_from_signal_gui = nil

    if prototype.type == "fluid" then
        prototype.auto_barrel = false
        if vgal.defines.flags["agal"] then
            local void_recipe = data.raw["recipe"]["angels-chemical-void-" .. prototype.name] or
                data.raw["recipe"]["angels-water-void-" .. prototype.name]
            if void_recipe then
                vgal.data.deepunhide(void_recipe)
            end
        end
    end

    if prototype.type == "recipe" then
        prototype.hide_from_player_crafting = nil
        prototype.allow_decomposition = nil
    end
end

---@param prototype_name string
---@return vgal.PrototypeWithIcons
function vgal.get_recipeable(prototype_name)
    local result = vgal.try_get_recipeable(prototype_name)

    if result then
        return result
    else
        error("Recipeable of name '" .. prototype_name .. "' not found.")
    end
end

---@param prototype_name string
---@return vgal.PrototypeWithIcons?
function vgal.try_get_recipeable(prototype_name)
    vgal.throw.if_param_nil(prototype_name, "prototype_name")

    for category_name, _ in pairs(vgal.defines.recipeable_types) do
        if data.raw[category_name][prototype_name] then
            return data.raw[category_name][prototype_name] --[[@as vgal.PrototypeWithIcons]]
        end
    end

    return nil
end

-- commentedbc: see vgal.defines.entityable_categories comment
-- function vgal.get_entityable(prototype_name)
--     for _, category in ipairs(vgal.defines.entityable_categories) do
--         if data.raw[category][prototype_name] then
--             return data.raw[category][prototype_name]
--         end
--     end
--     error("Entityable of name '" .. prototype_name .. "' not found.")
-- end
local function remove_empty_vgal_techs()
    local required_techs = {}
    local removable_techs = {}

    for _, tech in pairs(data.raw["technology"]) do
        for _, p in ipairs(tech.prerequisites or {}) do -- techs used as prerequisites will not be removed
            required_techs[p] = true
        end

        for _, effect in ipairs(tech.effects or {}) do
            for _, recipe_name in pairs(vgal.tech.recipes_to_remove_from_techs) do
                if effect.recipe == recipe_name then
                    effect.hidden = true
                    break
                end
            end
        end

        removable_techs[tech.name] = tech

        for _, effect in ipairs(tech.effects or {}) do
            if not effect.hidden then
                removable_techs[tech.name] = nil
            end
        end

        ---@diagnostic disable-next-line: undefined-field
        if not tech.__vgal_is_technode then
            removable_techs[tech.name] = nil
        end

        if required_techs[tech.name] then
            removable_techs[tech.name] = nil
        end
    end

    for _, tech in pairs(removable_techs) do
        vgal.data.hide(tech)
    end
end

-- removes techs in the techs_to_splice table and bypasses its prerequisites for other techs
local function splice_and_flatten_techs()
    for _, tech in pairs(data.raw["technology"]) do
        ::fix_prerequisites::
        local modified = false
        for i, prerequisite in ipairs(tech.prerequisites or {}) do
            if vgal.tech.techs_to_splice[prerequisite] then
                -- Get the prerequisites to add
                local new_prereqs = vgal.tech.techs_to_splice[prerequisite].prerequisites or {}

                -- Remove the current prerequisite (the one being spliced)
                table.remove(tech.prerequisites, i)

                -- Add new prerequisites without duplicates
                for _, new_prereq in ipairs(new_prereqs) do
                    local already_exists = false
                    for _, existing_prereq in ipairs(tech.prerequisites) do
                        if existing_prereq == new_prereq then
                            already_exists = true
                            break
                        end
                    end
                    if not already_exists then
                        table.insert(tech.prerequisites, new_prereq)
                    end
                end

                modified = true
                break
            end
        end
        if modified then
            goto fix_prerequisites
        end
    end

    for tech_name, _ in pairs(vgal.tech.techs_to_splice) do
        vgal.tech.deep_hide(tech_name)
    end
end

function vgal.data.finalise()
    remove_empty_vgal_techs()
    splice_and_flatten_techs()

    for recipe_name, _ in pairs(vgal.group_overrides) do
        if not data.raw["recipe"][recipe_name] then
            error("Recipe '" .. recipe_name .. "' not found in enable/disable override settings.")
        end
    end
end

---@param prototype data.PrototypeBase
---@return boolean
function vgal.is_angels(prototype)
    return vgal.string.starts_with(prototype.name, "angels")
end

---@param target "space"|"nauvis"|"gleba"|"vulcanus"|"fulgora"|"aquilo"|"atmosphere"|"gravity"
---@return data.SurfaceCondition[]
function vgal.get_surface_conditions_for(target)
    local sc_store = {
        ["space"] = {
            {
                property = "gravity",
                min = 0,
                max = 0
            }
        },
        ["nauvis"] = {
            {
                property = "pressure",
                min = 1000,
                max = 1000
            }
        },
        ["gleba"] = {
            {
                property = "pressure",
                min = 2000,
                max = 2000
            }
        },
        ["vulcanus"] = {
            {
                property = "pressure",
                min = 4000,
                max = 4000
            }
        },
        ["fulgora"] = {
            {
                property = "magnetic-field",
                min = 99,
                max = 99
            }
        },
        ["aquilo"] = {
            {
                property = "pressure",
                min = 300,
                max = 300
            }
        },
        ["atmosphere"] = {
            {
                property = "pressure",
                min = 10,
            }
        },
        ["gravity"] = {
            {
                property = "gravity",
                min = 1,
            }
        },
    }

    return sc_store[target] or error(target)
end

---@overload fun(prototype_or_prototype_name: data.PrototypeBase|string, prototype_type: "recipe"): data.RecipePrototype
---@overload fun(prototype_or_prototype_name: data.PrototypeBase|string, prototype_type: "fluid"): data.FluidPrototype
---@overload fun(prototype_or_prototype_name: data.PrototypeBase|string, prototype_type: "item"): data.ItemPrototype
---@overload fun(prototype_or_prototype_name: data.PrototypeBase|string, prototype_type: "recipeable-item"): data.ItemPrototype
---@overload fun(prototype_or_prototype_name: data.PrototypeBase|string, prototype_type: "technology"): data.TechnologyPrototype
---@overload fun(prototype_or_prototype_name: data.PrototypeBase|string, prototype_type: string): data.PrototypeBase
function vgal.get_from_prototype_or_prototype_name(prototype_or_prototype_name, prototype_type)
    if prototype_or_prototype_name.type then
        if prototype_or_prototype_name.type == prototype_type or (prototype_type == "recipeable-item" and (prototype_or_prototype_name.type ~= "fluid") and vgal.defines.recipeable_types[prototype_or_prototype_name.type]) then
            ---@diagnostic disable-next-line: return-type-mismatch
            return prototype_or_prototype_name
        else
            error("Invalid prototype type for prototype with name'" .. prototype_or_prototype_name.name .. "': " .. prototype_or_prototype_name.type)
        end
    else
        if prototype_type == "recipeable-item" then
            local recipeable = vgal.get_recipeable(prototype_or_prototype_name --[[@as string]]) -- throws if not found

            if recipeable.type == "fluid" then
                error("Invalid prototype type (fluid) for prototype with name'" .. prototype_or_prototype_name.name .. "': " .. prototype_or_prototype_name.type)
            end

            return recipeable
        else
            ---@diagnostic disable-next-line: return-type-mismatch
            return data.raw[prototype_type][prototype_or_prototype_name] or error("Could not find " .. prototype_type .. " with name " .. prototype_or_prototype_name)
        end
    end
end

---@param do_infinite boolean
function vgal.copy_angels_ore1_gen_to_ore2(do_infinite)
    vgal.throw.if_missing_flag("agal")

    local destination_ore_name = do_infinite and "infinite-angels-ore2" or "angels-ore2"
    local source_ore_name = do_infinite and "infinite-angels-ore1" or "angels-ore1"

    local destination_resource = data.raw["resource"][destination_ore_name] or error(destination_ore_name .. " not found")
    local source_resource = data.raw["resource"][source_ore_name] or error(source_ore_name .. " not found")

    destination_resource.autoplace = table.deepcopy(source_resource.autoplace)
    destination_resource.autoplace.probability_expression = vgal.string.replace(destination_resource.autoplace.probability_expression --[[@as string]], "ore1", "ore2")
    destination_resource.autoplace.richness_expression = vgal.string.replace(destination_resource.autoplace.richness_expression --[[@as string]], "ore1", "ore2")

    local destination_noise = data.raw["noise-expression"]["default-" .. destination_ore_name .. "-patches"]
    local source_noise = data.raw["noise-expression"]["default-" .. source_ore_name .. "-patches"]

    destination_noise.expression = vgal.string.replace(source_noise.expression --[[@as string]], "ore1", "ore2")
end

---@param path string
---@return any?
function vgal.force_require(path)
    local normalized_path = (string.gsub(path, "/", "."))

    package.loaded[normalized_path] = nil
    return require(normalized_path)
end
