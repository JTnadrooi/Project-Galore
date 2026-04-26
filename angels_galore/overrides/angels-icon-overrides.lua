local function use_main_icon(recipe_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)

    recipe.icons = vgal.icon.register({
        vgal.icon.get(recipe_name),
    })
end



-- distinguish recipe icons with updated order
-- carbon gasses
data.raw["recipe"]["angels-water-gas-shift-2"].icons = angelsmods.functions.create_gas_recipe_icon(
    {
        { "__angelspetrochemgraphics__/graphics/icons/molecules/carbon-monoxide.png", 72 },
    },
    "CCOc", {
        { "__angelspetrochemgraphics__/graphics/icons/molecules/hydrogen.png", 72, },
    }
)
data.raw["recipe"]["angels-gas-carbon-dioxide-from-wood"].icons = angelsmods.functions.create_gas_recipe_icon(
    {
        { "__angelspetrochemgraphics__/graphics/icons/molecules/carbon-dioxide.png", 72 },
    },
    "COcOc", { "angels-wood-pellets" }
)
data.raw["recipe"]["angels-water-gas-shift-1"].icons = angelsmods.functions.create_gas_recipe_icon(
    {
        { "__angelspetrochemgraphics__/graphics/icons/molecules/carbon-dioxide.png", 72 },
        { "__angelspetrochemgraphics__/graphics/icons/molecules/hydrogen.png",       72 },
    },
    "COcOc", { "steam", { "__angelspetrochemgraphics__/graphics/icons/molecules/carbon-monoxide.png", 72 }, }
)


-- misc distinguish
data.raw["recipe"]["angels-gas-methanol-from-wood"].icons = angelsmods.functions.create_gas_recipe_icon(
    {
        { "__angelspetrochemgraphics__/graphics/icons/molecules/methanol.png", 72 },
    },
    "COH", { "angels-cellulose-fiber", }
)

data.raw["recipe"]["angels-gas-ammonia-from-blue-fiber"].icons = angelsmods.functions.create_gas_recipe_icon(
    {
        { "__angelspetrochemgraphics__/graphics/icons/molecules/ammonia.png", 72 },
    },
    "NHH", { "angels-blue-cellulose-fiber", }
)

data.raw["recipe"]["angels-liquid-acetic-acid"].icons = angelsmods.functions.create_liquid_recipe_icon(
    {
        { "__angelsbioprocessinggraphics__/graphics/icons/molecule-acetic-acid.png", 72 },
    },
    "COH", { "angels-liquid-fermentation-raw", }
)

data.raw["recipe"]["angels-gas-ethanol"].icons = angelsmods.functions.create_gas_recipe_icon(
    {
        { "__angelsbioprocessinggraphics__/graphics/icons/molecule-ethanol.png", 72 },
    },
    "COH", { "angels-liquid-fermentation-raw", }
)

-- fix steam cracking icons
for recipe_name, product_name in pairs({
    ["angels-steam-cracking-methane"] = "methanol",
    ["angels-steam-cracking-butane"] = "benzene",
    ["angels-gas-ethylene"] = "ethylene",
    ["angels-gas-propene"] = "propene",
    ["angels-catalyst-steam-cracking-naphtha"] = "propene",
}) do
    data.raw["recipe"][recipe_name].icons = angelsmods.functions.create_gas_recipe_icon(
        {
            { "__angelspetrochemgraphics__/graphics/icons/molecules/" .. product_name .. ".png", 72 },
        },
        "CHH", { "steam", }
    )
end

-- fix syngas recipe icons
for _, product_name in ipairs({
    "naphtha",
    "mineral-oil",
    "fuel-oil",
}) do
    data.raw["recipe"]["angels-steam-cracking-" .. product_name].icons = angelsmods.functions.create_gas_recipe_icon({
        "angels-gas-synthesis",
    }, { { 210, 120, 210 }, { 175, 100, 175 }, { 140, 080, 140 } }, { "angels-liquid-" .. product_name, })
end

-- fix polyethelene icon
data.raw["recipe"]["angels-liquid-polyethylene"].icons = angelsmods.functions.create_liquid_recipe_icon(
    {
        { "__angelspetrochemgraphics__/graphics/icons/molecules/polyethylene.png", 72 },
    },
    "CHH"
)

-- fix steam-cracking-methane icon
data.raw["recipe"]["angels-steam-cracking-methane"].icons = angelsmods.functions.create_gas_recipe_icon(
    {
        { "__angelspetrochemgraphics__/graphics/icons/molecules/methanol.png", 72 },
    },
    "COH", { "steam", }
)

-- add some more input icons to make it more fit for its subgroup
data.raw["recipe"]["angels-condensates-refining"].icons = angelsmods.functions.create_gas_recipe_icon(
    {
        { "__angelspetrochemgraphics__/graphics/icons/molecules/methane.png", 72 },
        "angels-solid-coke",
        "angels-liquid-naphtha",
    },
    "CHH",
    {
        "angels-liquid-condensates",
    }
)

-- fix fluid/gas recipe icons not being other type
data.raw["recipe"]["angels-liquid-phenol"].icons = angelsmods.functions.create_liquid_recipe_icon(
    {
        { "__angelspetrochemgraphics__/graphics/icons/molecules/phenol.png", 72 },
    },
    "COH"
)

-- toluene fixes
data.raw.recipe["angels-liquid-toluene-from-benzene"].icons = vgal.icon.register({
    vgal.icon.get("angels-liquid-toluene"),
    vgal.icon.get_in("benzene", "molecule"),
})
data.raw.recipe["angels-liquid-toluene"].icons = vgal.icon.register({
    vgal.icon.get("angels-liquid-toluene"),
    vgal.icon.get_in("angels-liquid-naphtha"),
})

-- other
data.raw.recipe["angels-garden-cultivating"].icons = vgal.icon.register({
    vgal.icon.get("angels-paste-cellulose"),
    vgal.icon.get_out("angels-temperate-garden"),
    vgal.icon.get_out2("angels-desert-garden"),
    vgal.icon.get_out3("angels-swamp-garden"),
})

data.raw.recipe["angels-solid-soil-alternative"].icons = vgal.icon.register({
    vgal.icon.get("angels-solid-soil"),
    vgal.icon.get_in("angels-solid-sand"),
})

data.raw.recipe["angels-water-saline-from-water"].icons = vgal.icon.register({
    vgal.icon.get("angels-water-saline"),
})

data.raw.recipe["angels-solid-sulfur"].icons = vgal.icon.register({
    vgal.icon.get("sulfur"),
})

data.raw.recipe["angels-solid-salt-dissolving"].icons = vgal.icon.register({
    vgal.icon.get("angels-water-saline"),
    vgal.icon.get_in("angels-solid-salt"),
})

use_main_icon("angels-solid-salt")

use_main_icon("angels-solid-sodium")
data.raw.recipe["angels-solid-salt-separation"].icons = vgal.icon.register({
    vgal.icon.get("angels-solid-sodium"),
    vgal.icon.get_in("angels-solid-salt"),
})
data.raw.recipe["angels-solid-sodium-sulfate-separation"].icons = vgal.icon.register({
    vgal.icon.get("angels-solid-sodium"),
    vgal.icon.get_in("angels-solid-sodium-sulfate"),
})

data.raw.recipe["angels-coolant-used-filtration-1"].icons = vgal.icon.register({
    vgal.icon.get("angels-liquid-coolant"),
    vgal.icon.get_in("angels-filter-coal"),
})

data.raw.recipe["angels-coolant-used-filtration-2"].icons = vgal.icon.register({
    vgal.icon.get("angels-liquid-coolant"),
    vgal.icon.get_in("angels-filter-ceramic"),
})

data.raw.recipe["angels-carbon-from-charcoal"].icons = vgal.icon.register({
    vgal.icon.get("angels-solid-carbon"),
    vgal.icon.get_in("angels-wood-charcoal"),
})

data.raw.recipe["angels-liquid-aqueous-sodium-hydroxide-reverse"].icons = vgal.icon.register({
    vgal.icon.get("angels-solid-sodium-hydroxide"),
    vgal.icon.get_in("angels-liquid-aqueous-sodium-hydroxide"),
})

use_main_icon("angels-solid-sodium-hydroxide")

data.raw.recipe["angels-fermentation-corn"].icons = vgal.icon.register({
    vgal.icon.get("angels-liquid-fermentation-raw"),
})

data.raw.recipe["angels-fermentation-fruit"].icons = vgal.icon.register({
    vgal.icon.get("angels-liquid-fermentation-raw"),
    vgal.icon.get_in("angels-solid-fruit"),
})

for _, nutrientable in ipairs(agal.defines.nutrientables) do
    data.raw.recipe[nutrientable .. "-nutrients"].icons = vgal.icon.register({
        vgal.icon.get("angels-liquid-nutrient-pulp"),
        vgal.icon.get_in(nutrientable),
    })
end

for _, vegetable_oilable in ipairs({ "nuts", "pips", "beans" }) do
    data.raw.recipe["angels-liquid-raw-vegetable-oil-" .. vegetable_oilable].icons = vgal.icon.register({
        vgal.icon.get("angels-liquid-raw-vegetable-oil"),
        vgal.icon.get_in("angels-solid-" .. vegetable_oilable),
    })
end

for _, metal in pairs(vgal.defines.metals) do
    data.raw["recipe"][metal.angels_plate_recipe_name].icons = vgal.icon.register({
        vgal.icon.get(metal.plate),
    })
    data.raw["recipe"][metal.plate].icons = vgal.icon.register({
        vgal.icon.get(metal.plate),
        vgal.icon.get_in(metal.base_ore),
    })
    data.raw.recipe[metal.processed].icons = vgal.icon.register({
        vgal.icon.get(metal.processed),
    })
end

use_main_icon("angels-coal-crushed")
use_main_icon("angels-ore2-crushed")
use_main_icon("angels-ore3-crushed")
use_main_icon("angels-stone-crushed")

use_main_icon("angels-cellulose-fiber")
use_main_icon("angels-solid-cement")
use_main_icon("copper-cable")
use_main_icon("angels-solid-soil")

-- TIER ICON FIXES

-- fix explosives recipe tier icons
use_main_icon("explosives")
data.raw["recipe"]["angels-solid-nitroglycerin"].icons = vgal.icon.register({
    vgal.icon.get("explosives"),
    vgal.icon.get_in("glycerol", "molecule"),
})
data.raw["recipe"]["angels-solid-trinitrotoluene"].icons = vgal.icon.register({
    vgal.icon.get("explosives"),
    vgal.icon.get_in("angels-liquid-toluene"),
})

-- fix coke recipe tier icons
data.raw["recipe"]["angels-solid-coke"].icons = vgal.icon.register({
    vgal.icon.get("angels-solid-coke"),
})

-- fix coke recipe tier icons
data.raw["recipe"]["angels-solid-coke-sulfur"].icons = vgal.icon.register({
    vgal.icon.get("angels-solid-coke"),
    vgal.icon.get_in("angels-water-purified"),
})

-- fix carbon recipe tier icons
data.raw["recipe"]["angels-solid-carbon"].icons = vgal.icon.register({
    vgal.icon.get("angels-solid-carbon"),
})
data.raw["recipe"]["angels-coke-purification-2"].icons = vgal.icon.register({
    vgal.icon.get("angels-solid-carbon"),
    -- vgal.icon.get_in("angels-solid-sodium-hydroxide"),
    vgal.icon.get_in("nitrogen", "molecule"),
})

-- fix green algae recipe tier icons
data.raw["recipe"]["angels-algae-green-simple"].icons = vgal.icon.register({
    vgal.icon.get("angels-algae-green"),
})
data.raw["recipe"]["angels-algae-green"].icons = vgal.icon.register({
    vgal.icon.get("angels-algae-green"),
    -- vgal.icon.get_in("angels-water-mineralized"),
    vgal.icon.get_in("carbon-dioxide", "molecule"),
})

-- fix wood sawing recipe tier icons
data.raw["recipe"]["angels-wood-sawing-1"].icons = vgal.icon.register({
    vgal.icon.get("wood"),
})
data.raw["recipe"]["angels-wood-sawing-2"].icons = vgal.icon.register({
    vgal.icon.get("wood"),
    vgal.icon.get_in("angels-solid-crystal-tipped-saw"),
})
data.raw["recipe"]["angels-wood-sawing-3"].icons = vgal.icon.register({
    vgal.icon.get("wood"),
    vgal.icon.get_in("angels-solid-crystal-full-saw"),
})

-- fix tree seed recipe tier icons
use_main_icon("angels-tree-seed")
data.raw["recipe"]["angels-tree-seed-2"].icons = vgal.icon.register({
    vgal.icon.get("angels-tree-seed"),
    vgal.icon.get_in("angels-solid-fertilizer"),
})
data.raw["recipe"]["angels-tree-seed-3"].icons = vgal.icon.register({
    vgal.icon.get("angels-tree-seed"),
    vgal.icon.get_in("carbon-dioxide", "molecule"),
})

-- fix tree recipe tier icons
use_main_icon("angels-solid-tree")
data.raw["recipe"]["angels-solid-tree-2"].icons = vgal.icon.register({
    vgal.icon.get("angels-solid-tree"),
    vgal.icon.get_in("angels-solid-fertilizer"),
})
data.raw["recipe"]["angels-solid-tree-3"].icons = vgal.icon.register({
    vgal.icon.get("angels-solid-tree"),
    vgal.icon.get_in("angels-liquid-nutrient-pulp"),
})

-- fix crystal splinter recipe tier icons
data.raw["recipe"]["angels-crystal-splinter-crystalization-1"].icons = vgal.icon.register({
    vgal.icon.get("angels-crystal-splinter-raw"),
})
data.raw["recipe"]["angels-crystal-splinter-crystalization-2"].icons = vgal.icon.register({
    vgal.icon.get("angels-crystal-splinter-raw"),
    vgal.icon.get_in("angels-crystal-seed"),
})

-- fix crystal shard recipe tier icons
data.raw["recipe"]["angels-crystal-shard-crystalization-1"].icons = vgal.icon.register({
    vgal.icon.get("angels-crystal-shard-raw"),
})
data.raw["recipe"]["angels-crystal-shard-crystalization-2"].icons = vgal.icon.register({
    vgal.icon.get("angels-crystal-shard-raw"),
    vgal.icon.get_in("angels-crystal-enhancer"),
})

-- fix concrete recipe tier icons
use_main_icon("concrete")
data.raw["recipe"]["angels-concrete"].icons = vgal.icon.register({
    vgal.icon.get("concrete"),
    vgal.icon.get_in("angels-liquid-concrete"),
})

-- fix plate casting recipes tier icons
for _, material in ipairs({ "iron", "copper", "steel" }) do
    use_main_icon("angels-roll-" .. material)
    data.raw["recipe"]["angels-roll-" .. material .. "-2"].icons = vgal.icon.register({
        vgal.icon.get("angels-roll-" .. material),
        vgal.icon.get_in("angels-liquid-coolant"),
    })
end

-- fix ingot recipes tier icons
-- copper
use_main_icon("angels-ingot-copper")
data.raw["recipe"]["angels-ingot-copper-2"].icons = vgal.icon.register({
    vgal.icon.get("angels-ingot-copper"),
    vgal.icon.get_in("angels-processed-copper"),
})
data.raw["recipe"]["angels-ingot-copper-3"].icons = vgal.icon.register({
    vgal.icon.get("angels-ingot-copper"),
    vgal.icon.get_in("angels-anode-copper"),
})
-- iron
use_main_icon("angels-ingot-iron")
data.raw["recipe"]["angels-ingot-iron-2"].icons = vgal.icon.register({
    vgal.icon.get("angels-ingot-iron"),
    vgal.icon.get_in("angels-processed-iron"),
})
data.raw["recipe"]["angels-ingot-iron-3"].icons = vgal.icon.register({
    vgal.icon.get("angels-ingot-iron"),
    vgal.icon.get_in("angels-pellet-iron"),
})
