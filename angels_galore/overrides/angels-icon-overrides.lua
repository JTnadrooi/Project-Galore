local function use_main_icon(recipe_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)

    recipe.icons = vgal.icon.register({
        vgal.icon.get(recipe_name),
    })
end

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

data.raw.recipe["angels-solid-salt-dissolving"].icons = vgal.icon.register({
    vgal.icon.get("angels-water-saline"),
    vgal.icon.get_in("angels-solid-salt"),
})

use_main_icon("angels-solid-salt")

data.raw.recipe["angels-coolant-used-filtration-1"].icons = vgal.icon.register({
    vgal.icon.get("angels-liquid-coolant"),
    vgal.icon.get_in("angels-filter-coal"),
})

data.raw.recipe["angels-coolant-used-filtration-2"].icons = vgal.icon.register({
    vgal.icon.get("angels-liquid-coolant"),
    vgal.icon.get_in("angels-filter-ceramic"),
})

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
