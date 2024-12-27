require("prototypes.suite")

if settings.startup["vgal-always-show-products"].value then
    for _, recipe in pairs(data.raw["recipe"]) do
        if not recipe.always_show_products then
            recipe.always_show_products = true
        end
    end
end
