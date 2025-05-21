## Nested technologies

An example showcasing the nested recipe feature, in addition to some of the new recipe/tech properties.

```lua
vgal.data.extend({
        {
            name = "example-technology", -- becomes "test-example-technology". "prefix" get from autofilled properties.
            icon = "__example-mod__/graphics/technology/example.png",
            icon_size = 256,
            recipes = {                                      -- just "recipe" also works, this goes for most properties that sound like multiple; "results"
                {                                            -- ignore the horribility(?) of this recipe.
                    name = "carbon-uranium-ore",             -- becomes "test-carbon-uranium-ore-2". Inherits "prefix" from parent technology.
                    tier = 2,                                -- currently only gets added to recipe name but more functionality is planned in the future.
                    icons = vgal.icon.register {
                        vgal.icon.get_in_to("carbon"),       -- the "in" ingredient
                        vgal.icon.get_out_to("uranium-ore"), -- the "out" result
                        vgal.icon.get_overlay("to"),         -- the arrow
                    },
                    energy_required = "1m25s",               -- becomes "energy_required = 85".
                    ingredients = {                          -- items only, or use the base way of defining ingredients. For fluids use "fluid_ingredients".
                        { "carbon", 15 },
                    },
                    results = {
                        { "uranium-ore", nil, { amount_min = 1, amount_max = 4 } },
                        { "carbon",      nil, { amount_min = 1, amount_max = 2 } },
                    },
                    categories = { "centrifuging", "crushing" }, -- first entry becomes main category. (post 2.0.49)
                    -- localisation properties get automatically generated. (item-name.uranium-ore with as fallback recipe-name.vgal-carbon-uranium-ore-2)
                    -- "main_product" gets automatically set (in this case; first result)
                    -- "type" is automatically set to "recipe"
                    -- gets added to "vgal" domain.
                },
            },
            prerequisites = { "automation-science-pack" },
            unit =
            {
                ingredients = { { "automation-science-pack", 100 }, { "logistic-science-pack", 200 } },
                time = 30, -- also allows a string like energy_required.
                -- "count" is auto-calculated and ingredient amounts are normalised.
            },
            unit = -- or alternatively.. (note: logistic science pack cost will not be doubled)
            {
                ingredients = { "automation-science-pack", "logistic-science-pack" },
                time = 30,
                count = 100,
            },
        },
    },
    { -- these values are autofilled if omitted. You might want to do this when adding multiple prototypes at once.
        type = "technology",
        prefix = "test",
    }
) -- all the vgal-exclusive properties get saved within the prototype's _vgal property.
```
