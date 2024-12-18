require("prototypes.suite")

if settings.startup["vgal-always-show-products"].value then
    for _, recipe in pairs(data.raw["recipe"]) do
        recipe.always_show_products = true
    end
end
