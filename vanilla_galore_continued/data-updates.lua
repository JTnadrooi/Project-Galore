local products = settings.startup["vgal-always-show-products"].value;
local made_in = settings.startup["vgal-always-show-made-in"].value;

if products or made_in then
    for _, recipe in pairs(data.raw["recipe"]) do
        if products and not recipe.always_show_products then
            recipe.always_show_products = true
        end
        if made_in and not recipe.always_show_made_in then
            recipe.always_show_made_in = true
        end
    end
end