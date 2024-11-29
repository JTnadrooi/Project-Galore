do
    ---A vgal.
    ---@class vgal.VgalSyncedItem
    ---A
    ---@field input string
    ---A
    ---@field output string
    ---The multiplier applied to the output amount. Default is 1.
    ---@field multiplier number
    ---"fluid" or "item".
    ---@field item_type string
end
do
    ---A vgal.
    ---@class vgal.VgalRecipe:data.RecipePrototype
    ---Optional empty fields get borrowed from this recipe. (order, subgroup, main_product(if posible), etc..)
    ---@field complementary_recipe? string
    ---Non optional empty fields get borrowed from this recipe. (except the name)
    ---@field dependent_recipe? string
    ---A list of items of witch the input amount will be linked to the output amount. Usefull for water<>steam, cooling and waste liquids.
    ---@field synced_items? vgal.VgalSyncedItem[]
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
    ---@field ingredients
end
