do
    ---@class vgal.ItemKeyPrototype
    ---@field type string
    ---@field name string
    ---@field amount uint16
end
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
    ---The recipe prefix. "vgal-" for (Vanilla) Galore recipes
    ---@field prefix? string
    ---@field ingredients? ItemKeyPrototype[]|table
    ---@field fluid_ingredients? ItemKeyPrototype[]|table
    ---@field results? ItemKeyPrototype[]|table
    ---@field fluid_results? ItemKeyPrototype[]|table
    ---@field type? string
    ---@field group? string
    ---@field groups? string[]
    ---@field productivity_technology? string|table
    ---@field localised_name_source? string
    ---@field localised_description_source? string
    ---@field locale_source? string
end

do
    ---A vgal toggle group, desides if certain prototypes are added or not.
    ---@class vgal.VgalToggleGroupPrototype
    ---@field type? string
    ---@field name string
    ---@field enabled? boolean
    ---@field enabled_setting? string
end
