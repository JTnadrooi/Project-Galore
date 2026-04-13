do
    ---A vgal recipe - to be registed.
    ---@class vgal.VgalRecipePrototype:data.RecipePrototype
    ---Non optional empty fields get borrowed from this recipe. (except the name)
    ---@field dependent_recipe? string
    ---Non optional empty fields get borrowed from this recipe. (except the name)
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
    ---@field results? vgal.ShorthandRecipeEntry[]
    ---@field fluid_results? vgal.ShorthandRecipeEntry[]
    ---@field type? string
    ---@field group? string
    ---@field groups? string[]
    ---@field productivity_technology? string|table
    ---@field localised_name_source? string
    ---@field localised_description_source? string
    ---@field locale_source? string
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
    ---@field [3] { probability?: number, amount_min?: integer, amount_max?: integer }?
end
