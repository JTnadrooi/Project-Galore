do
    ---@class vgal.ItemKeyPrototype
    ---@field type string
    ---@field name string
    ---@field amount uint16
end
do
    ---A vgal recipe - to be registed.
    ---@class vgal.VgalRecipe:data.RecipePrototype
    ---Non optional empty fields get borrowed from this recipe. (except the name)
    ---@field dependent_recipe? string
    ---A item of witch the input amount will be linked to the output amount. Usefull for water<>steam, cooling and waste liquids.
    ---@field tier? number
    ---The technology this recipe will be added to as unlock.
    ---@field technology? string
    ---The array technologies this recipe will be added to as unlock.
    ---@field technologies? string[]
    ---The recipe prefix. "vgal-" for (Vanilla) Galore recipes
    ---@field prefix? string
    ---The method that will be used to determine an icon composition based on the ingredients and results of this recipe.
    ---@field icon_method? string
    ---@field ingredients ItemKeyPrototype[]|table[]
    ---@field fluid_ingredients? ItemKeyPrototype[]|table[]
    ---@field fluid_results? ItemKeyPrototype[]|table[]
    ---@field results? ItemKeyPrototype[]|table[]
end
