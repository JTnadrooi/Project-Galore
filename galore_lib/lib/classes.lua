do
    ---A vgal recipe - to be registed.
    ---@class vgal.VgalRecipePrototype:data.RecipePrototype
    ---Non optional empty fields get borrowed from this recipe.
    ---@field complementairy_recipe? string
    ---Used in the recipe and technology name.
    ---@field tier? number
    ---The technology this recipe will be added to as unlock.
    ---@field technology? string|table
    ---The array technologies this recipe will be added to as unlock.
    ---@field technologies? string[]|table[]
    ---@field prefix? string
    ---@field ingredients? vgal.ShorthandRecipeEntry[]
    ---@field fluid_ingredients? vgal.ShorthandRecipeEntry[]
    ---@field raw_ingredients? data.IngredientPrototype[]
    ---@field results? vgal.ShorthandRecipeEntry[]
    ---@field fluid_results? vgal.ShorthandRecipeEntry[]
    ---@field raw_results? data.ProductPrototype[]
    ---@field type? string
    ---@field group? string
    ---@field groups? string[]
    ---@field productivity_technology? string|table
    ---@field localised_name_source? string
    ---@field localised_description_source? string
    ---@field locale_source? string
    ---@field enable_smart_productivity? boolean
    ---@field enable_smart_stats? boolean
    ---@field domain? string
    ---@field categories? string[]
    ---@field category string
end

do
    ---A vgal toggle group, desides if certain prototypes are hidden or not.
    ---@class vgal.VgalToggleGroupPrototype
    ---@field type? string
    ---@field name? string
    ---@field enabled? boolean
    ---@field enabled_setting? string
end

do
    ---@class vgal.ShorthandRecipeEntry
    ---@field [1] string The name of the ingredient.
    ---@field [2] number? The amount of the ingredient or nil if other amount values are set at index 3.
    ---@field [3] { independent_probability?: number, amount_min?: integer, amount_max?: integer, independent_probability?: number, allow_productivity?: boolean, ignored_by_stats?: integer,  ignored_by_productivity?: integer, show_details_in_recipe_tooltip?: boolean, extra_count_fraction?: number, percent_spoiled?: number, always_fresh?: boolean, reset_freshness_on_craft?: boolean }?
end

do
    ---@class vgal.SubgroupOverrideCollection
    ---@field name string
    ---@field order data.Order
    ---@field group string
    ---@field entries string[]?
    ---@field recipe_entries string[]?
    ---@field cleaning_entries (string|{[1]: string, [2]: string})[]?
    ---@field when boolean?
    ---@field when_settings string[]?
    ---@field should_reorder_entries boolean?
end

do
    ---@class vgal.IconOverride
    ---@field name string
    ---@field source string
    ---@field composite_icon_override data.IconData[]?
    ---@field composite_icon_override_function (fun(): data.IconData[])?
end

do
    ---@class vgal.Metal
    ---@field name string
    ---@field ore string
    ---@field plate string
    ---@field bacteria string?
    ---@field molten string?
    ---@field ore_index integer?
    ---@field base_ore string?
    ---@field pebbles string?
    ---@field nugget string?
    ---@field slag string?
    ---@field ingot string?
    ---@field processed string?
    ---@field pellet string?
    ---@field roll string?
    ---@field angels_plate_recipe_name string?
    ---@field solution string?
    ---@field ore_states {[1]: "crushed", [2]: "chunk", [3]: "crystal", [4]: "pure"}?
    ---@field crushed string?
    ---@field chunk string?
    ---@field crystal string?
    ---@field pure string?
end

do
    ---@class vgal.Atmosphere
    ---@field name string
    ---@field planet string
    ---@field colors {[1]: {[1]: integer, [2]: integer, [3]: integer}, [2]: {[1]: integer, [2]: integer, [3]: integer}, [3]: {[1]: integer, [2]: integer, [3]: integer}}
    ---@field results vgal.ShorthandRecipeEntry[]?
    ---@field fluid_results vgal.ShorthandRecipeEntry[]
    ---@field index integer
    ---@field energy_required number
end

do
    ---@class vgal.Domain
    ---@field name string
    ---@field entries table<string, {name: string, type: string}>
end
