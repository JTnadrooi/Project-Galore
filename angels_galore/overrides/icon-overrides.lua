local function use_main_icon(recipe_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)

    recipe.icons = vgal.icon.get(recipe_name)
end

-- distinguish recipe icons with updated order
data.raw["recipe"]["angels-water-gas-shift-2"].icons = vgal.icon.create({
    style   = "angels-gas",
    inputs  = { "angels-gas-hydrogen" },        -- overlay: hydrogen
    outputs = { "angels-gas-carbon-monoxide" }, -- main icon: carbon monoxide
    palette = "CCOc",
})

data.raw["recipe"]["angels-gas-carbon-dioxide-from-wood"].icons = vgal.icon.create({
    style   = "angels-gas",
    inputs  = { "angels-wood-pellets" },
    outputs = { "angels-gas-carbon-dioxide" },
    palette = "COcOc",
})

data.raw["recipe"]["angels-water-gas-shift-1"].icons = vgal.icon.create({
    style   = "angels-gas",
    inputs  = { "steam", "angels-gas-carbon-monoxide" },
    outputs = { "angels-gas-carbon-dioxide", "angels-gas-hydrogen" },
    palette = "COcOc",
})

data.raw["recipe"]["angels-gas-methanol-from-wood"].icons = vgal.icon.create({
    style   = "angels-gas",
    inputs  = { "angels-cellulose-fiber" },
    outputs = { "angels-gas-methanol" },
    core    = "gas",
    palette = "COH",
})

data.raw["recipe"]["angels-gas-ammonia-from-blue-fiber"].icons = vgal.icon.create({
    style   = "angels-gas",
    inputs  = { "angels-blue-cellulose-fiber" },
    outputs = { "angels-gas-ammonia" },
    core    = "gas",
    palette = "NHH",
})

data.raw["recipe"]["angels-liquid-acetic-acid"].icons = vgal.icon.create({
    style   = "angels-liquid",
    inputs  = { "angels-liquid-fermentation-raw" },
    outputs = { "angels-liquid-acetic-acid" },
    core    = "liquid",
    palette = "COH",
})

data.raw["recipe"]["angels-gas-ethanol"].icons = vgal.icon.create({
    style   = "angels-gas",
    inputs  = { "angels-liquid-fermentation-raw" },
    outputs = { "angels-gas-ethanol" },
    core    = "gas",
    palette = "COH",
})

-- fix steam cracking icons
for recipe_name, product_name in pairs({
    ["angels-steam-cracking-methane"]          = "methanol",
    ["angels-steam-cracking-butane"]           = "benzene",
    ["angels-gas-ethylene"]                    = "ethylene",
    ["angels-gas-propene"]                     = "propene",
    ["angels-catalyst-steam-cracking-naphtha"] = "propene",
}) do
    data.raw["recipe"][recipe_name].icons = vgal.icon.create({
        style   = "angels-gas",
        inputs  = { "steam" },
        outputs = { "angels-gas-" .. product_name },
        core    = "gas",
        palette = "CHH",
    })
end

-- fix syngas recipe icons (custom palette with RGB values)
for _, product_name in ipairs({
    "naphtha",
    "mineral-oil",
    "fuel-oil",
}) do
    data.raw["recipe"]["angels-steam-cracking-" .. product_name].icons = vgal.icon.create({
        style   = "angels-gas",
        inputs  = { "angels-liquid-" .. product_name },
        outputs = { "angels-gas-synthesis" },
        core    = "gas",
        palette = { { 210, 120, 210 }, { 175, 100, 175 }, { 140, 080, 140 } },
    })
end

-- fix polyethylene icon
data.raw["recipe"]["angels-liquid-polyethylene"].icons = vgal.icon.create({
    style   = "angels-liquid",
    outputs = { "angels-liquid-polyethylene" },
    core    = "liquid",
    palette = "CHH",
})

-- override steam-cracking-methane with correct palette and output
data.raw["recipe"]["angels-steam-cracking-methane"].icons = vgal.icon.create({
    style   = "angels-gas",
    inputs  = { "steam" },
    outputs = { "angels-gas-methanol" },
    core    = "gas",
    palette = "COH",
})

-- add more input icons to make it fit its subgroup
data.raw["recipe"]["angels-condensates-refining"].icons = vgal.icon.create({
    style   = "angels-gas",
    inputs  = { "angels-liquid-condensates" },
    outputs = { "angels-gas-methane", "angels-solid-coke", "angels-liquid-naphtha" },
    core    = "gas",
    palette = "CHH",
})

-- fix fluid/gas recipe icons not being other type
data.raw["recipe"]["angels-liquid-phenol"].icons = vgal.icon.create({
    style   = "angels-liquid",
    outputs = { "angels-liquid-phenol" },
    core    = "liquid",
    palette = "COH",
})

-- fix main casting recipes showing input icon
vgal.recipe.clear_icons("angels-plate-steel")
vgal.recipe.clear_icons("angels-plate-iron")
vgal.recipe.clear_icons("angels-plate-copper")

-- fix bio-tokens still being in garden recipe icons
for _, environment in pairs(vgal.defines.environments) do
    table.remove(data.raw["recipe"][environment.garden .. "-a"].icons, 2) -- at 2 is bio token icon
end

-- toluene fixes
data.raw.recipe["angels-liquid-toluene-from-benzene"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-liquid-toluene"),
    vgal.icon.get_in("angels-gas-benzene"),
})
data.raw.recipe["angels-liquid-toluene"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-liquid-toluene"),
    vgal.icon.get_in("angels-liquid-naphtha"),
})

-- other
data.raw.recipe["angels-garden-cultivating"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-paste-cellulose"),
    vgal.icon.get_subicon("angels-temperate-garden", nil, 7),
    vgal.icon.get_subicon("angels-desert-garden", nil, 8),
    vgal.icon.get_subicon("angels-swamp-garden", nil, 9),
})

-- data.raw.recipe["angels-sulfur-air-scrubbing"].icons = vgal.icon.merge_composites({
--     vgal.icon.get("angels-filter-lime-used"),
-- })

data.raw.recipe["angels-filter-lime-used-cleaning"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-filter-frame"),
    vgal.icon.get_in("angels-filter-lime-used"),
})

data.raw.recipe["angels-filter-ceramic-refurbish"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-filter-ceramic"),
    vgal.icon.get_in("angels-filter-ceramic-used"),
})

data.raw["recipe"]["angels-solid-mud-landfill"].icons = vgal.icon.merge_composites({
    vgal.icon.get("landfill"),
    vgal.icon.get_in("angels-solid-mud"),
})

data.raw.recipe["angels-solid-soil-alternative"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-solid-soil"),
    vgal.icon.get_in("angels-solid-sand"),
})

data.raw.recipe["angels-water-saline-from-water"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-water-saline"),
})

data.raw.recipe["angels-solid-sulfur"].icons = vgal.icon.merge_composites({
    vgal.icon.get("sulfur"),
})

data.raw.recipe["angels-solid-salt-dissolving"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-water-saline"),
    vgal.icon.get_in("angels-solid-salt"),
})

use_main_icon("angels-solid-salt")

use_main_icon("angels-solid-sodium")
data.raw.recipe["angels-solid-salt-separation"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-solid-sodium"),
    vgal.icon.get_in("angels-solid-salt"),
})
data.raw.recipe["angels-solid-sodium-sulfate-separation"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-solid-sodium"),
    vgal.icon.get_in("angels-solid-sodium-sulfate"),
})

data.raw["recipe"]["angels-algae-brown-burning-wash"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-solid-sodium-carbonate"),
    vgal.icon.get_in("angels-algae-brown"),
})

data.raw.recipe["angels-coolant-used-filtration-1"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-liquid-coolant"),
    vgal.icon.get_in("angels-filter-coal"),
})

data.raw.recipe["angels-coolant-used-filtration-2"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-liquid-coolant"),
    vgal.icon.get_in("angels-filter-ceramic"),
})

data.raw.recipe["angels-carbon-from-charcoal"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-solid-carbon"),
    vgal.icon.get_in("angels-wood-charcoal"),
})

data.raw.recipe["angels-liquid-aqueous-sodium-hydroxide-reverse"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-solid-sodium-hydroxide"),
    vgal.icon.get_in("angels-liquid-aqueous-sodium-hydroxide"),
})

use_main_icon("angels-solid-sodium-hydroxide")

data.raw.recipe["angels-fermentation-corn"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-liquid-fermentation-raw"),
    vgal.icon.get_in("angels-solid-corn"),
})

data.raw.recipe["angels-fermentation-fruit"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-liquid-fermentation-raw"),
    vgal.icon.get_in("angels-solid-fruit"),
})

for _, nutrientable in ipairs(vgal.defines.nutrientables) do
    data.raw.recipe[nutrientable.name .. "-nutrients"].icons = vgal.icon.merge_composites({
        vgal.icon.get("angels-liquid-nutrient-pulp"),
        vgal.icon.get_in(nutrientable.name),
    })
end

data.raw.recipe["angels-fish-pulp-nutrients"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-liquid-nutrient-pulp"),
    vgal.icon.get_in("angels-fish-pulp"),
})

for _, vegetable_oilable in ipairs({ "nuts", "pips", "beans" }) do
    data.raw.recipe["angels-liquid-raw-vegetable-oil-" .. vegetable_oilable].icons = vgal.icon.merge_composites({
        vgal.icon.get("angels-liquid-raw-vegetable-oil"),
        vgal.icon.get_in("angels-solid-" .. vegetable_oilable),
    })
end

data.raw.recipe["angels-fish-pressing-0"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-liquid-raw-fish-oil"),
    vgal.icon.get_in("raw-fish"),
})

for i = 1, 3 do
    data.raw.recipe["angels-fish-pressing-" .. i].icons = vgal.icon.merge_composites({
        vgal.icon.get("angels-liquid-raw-fish-oil"),
        vgal.icon.get_in("angels-alien-fish-" .. i .. "-raw"),
    })
end

for _, metal in pairs(vgal.defines.metals) do
    data.raw["recipe"][metal.angels_plate_recipe_name].icons = vgal.icon.merge_composites({
        vgal.icon.get(metal.plate),
    })
    data.raw["recipe"][metal.plate].icons = vgal.icon.merge_composites({
        vgal.icon.get(metal.plate),
        vgal.icon.get_in(metal.base_ore),
    })
    data.raw.recipe[metal.processed].icons = vgal.icon.merge_composites({
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
data.raw["recipe"]["angels-solid-nitroglycerin"].icons = vgal.icon.merge_composites({
    vgal.icon.get("explosives"),
    vgal.icon.get_in("angels-liquid-glycerol"),
})
data.raw["recipe"]["angels-solid-trinitrotoluene"].icons = vgal.icon.merge_composites({
    vgal.icon.get("explosives"),
    vgal.icon.get_in("angels-liquid-toluene"),
})

-- fix coke recipe tier icons
data.raw["recipe"]["angels-solid-coke"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-solid-coke"),
})

-- fix coke recipe tier icons
data.raw["recipe"]["angels-solid-coke-sulfur"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-solid-coke"),
    vgal.icon.get_in("angels-water-purified"),
})

-- fix green algae recipe tier icons
data.raw["recipe"]["angels-algae-green-simple"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-algae-green"),
})
data.raw["recipe"]["angels-algae-green"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-algae-green"),
    -- vgal.icon.get_in("angels-water-mineralized"),
    vgal.icon.get_in("angels-gas-carbon-dioxide"),
})

-- fix wood sawing recipe tier icons
data.raw["recipe"]["angels-wood-sawing-1"].icons = vgal.icon.merge_composites({
    vgal.icon.get("wood"),
})
data.raw["recipe"]["angels-wood-sawing-2"].icons = vgal.icon.merge_composites({
    vgal.icon.get("wood"),
    vgal.icon.get_in("angels-solid-crystal-tipped-saw"),
})
data.raw["recipe"]["angels-wood-sawing-3"].icons = vgal.icon.merge_composites({
    vgal.icon.get("wood"),
    vgal.icon.get_in("angels-solid-crystal-full-saw"),
})

-- fix tree seed recipe tier icons
use_main_icon("angels-tree-seed")
data.raw["recipe"]["angels-tree-seed-2"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-tree-seed"),
    vgal.icon.get_in("angels-solid-fertilizer"),
})
data.raw["recipe"]["angels-tree-seed-3"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-tree-seed"),
    vgal.icon.get_in("angels-gas-carbon-dioxide"),
})

-- fix tree recipe tier icons
use_main_icon("angels-solid-tree")
data.raw["recipe"]["angels-solid-tree-2"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-solid-tree"),
    vgal.icon.get_in("angels-solid-fertilizer"),
})
data.raw["recipe"]["angels-solid-tree-3"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-solid-tree"),
    vgal.icon.get_in("angels-liquid-nutrient-pulp"),
})

-- fix crystal splinter recipe tier icons
data.raw["recipe"]["angels-crystal-splinter-crystalization-1"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-crystal-splinter-raw"),
})
data.raw["recipe"]["angels-crystal-splinter-crystalization-2"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-crystal-splinter-raw"),
    vgal.icon.get_in("angels-crystal-seed"),
})

-- fix crystal shard recipe tier icons
data.raw["recipe"]["angels-crystal-shard-crystalization-1"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-crystal-shard-raw"),
})
data.raw["recipe"]["angels-crystal-shard-crystalization-2"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-crystal-shard-raw"),
    vgal.icon.get_in("angels-crystal-enhancer"),
})

-- fix concrete recipe tier icons
use_main_icon("concrete")
data.raw["recipe"]["angels-concrete"].icons = vgal.icon.merge_composites({
    vgal.icon.get("concrete"),
    vgal.icon.get_in("angels-liquid-concrete"),
})

-- fix plate casting recipes tier icons
for _, material in ipairs({ "iron", "copper", "steel" }) do
    use_main_icon("angels-roll-" .. material)
    data.raw["recipe"]["angels-roll-" .. material .. "-2"].icons = vgal.icon.merge_composites({
        vgal.icon.get("angels-roll-" .. material),
        vgal.icon.get_in("angels-liquid-coolant"),
    })
end

-- fix ingot recipes tier icons
-- copper
use_main_icon("angels-ingot-copper")
data.raw["recipe"]["angels-ingot-copper-2"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-ingot-copper"),
    vgal.icon.get_in("angels-processed-copper"),
})
data.raw["recipe"]["angels-ingot-copper-3"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-ingot-copper"),
    vgal.icon.get_in("angels-anode-copper"),
})
-- iron
use_main_icon("angels-ingot-iron")
data.raw["recipe"]["angels-ingot-iron-2"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-ingot-iron"),
    vgal.icon.get_in("angels-processed-iron"),
})
data.raw["recipe"]["angels-ingot-iron-3"].icons = vgal.icon.merge_composites({
    vgal.icon.get("angels-ingot-iron"),
    vgal.icon.get_in("angels-pellet-iron"),
})

-- fix molten metal and liquid concrete tier icons
-- molten metals
use_main_icon("angels-liquid-molten-iron")
use_main_icon("angels-liquid-molten-steel")
use_main_icon("angels-liquid-concrete")

-- fix atomic bomb tier irons
use_main_icon("atomic-bomb")
data.raw["recipe"]["angels-atomic-bomb"].icons = vgal.icon.merge_composites({
    vgal.icon.get("atomic-bomb"),
    vgal.icon.get_in("angels-plutonium-239"),
})
data.raw["recipe"]["angels-atomic-bomb-2"].icons = vgal.icon.merge_composites({
    vgal.icon.get("atomic-bomb"),
    vgal.icon.get_in("angels-muon-fusion-catalyst"),
})

-- fix tier numerals on machines that only have one tier now
local tier_match_string = mods["reskins-angels"] and "icons/tiers" or "graphics/icons/numerals"

local function fix_icon(prototype)
    if prototype.icons then
        for i = #prototype.icons, 1, -1 do
            local icon = prototype.icons[i]
            if icon.icon:match(tier_match_string) then
                table.remove(prototype.icons, i)
            else
                icon.scale = nil
            end
        end
    end
end

for machine_name, max_tier in pairs(vgal.defines.machine_max_tiers) do
    if machine_name == "angels-oil-refinery" or machine_name == "angels-chemical-plant" then
        goto continue
    end

    if max_tier == 1 then
        fix_icon(data.raw["item"][machine_name] or error(machine_name))
        fix_icon(data.raw["assembling-machine"][machine_name] or error(machine_name))
    end
    ::continue::
end

-- gotta do this as its not included in the machine max tiers table
fix_icon(data.raw["item"]["angels-thermal-bore"])
fix_icon(data.raw["mining-drill"]["angels-thermal-bore"])

-- restore rocket fuel icon
data.raw["item"]["rocket-fuel"].icon = "__base__/graphics/icons/rocket-fuel.png"
data.raw["item"]["rocket-fuel"].icon_size = nil

-- fix uranium mining icon to be more sorting like
data.raw["technology"]["uranium-mining"].icons = data.raw["technology"]["angels-advanced-ore-refining-4"].icons
data.raw["technology"]["uranium-mining"].icon = data.raw["technology"]["angels-advanced-ore-refining-4"].icon
data.raw["technology"]["uranium-mining"].icon_size = data.raw["technology"]["angels-advanced-ore-refining-4"].icon_size

-- restore sulfur icons (reskins does this already, so check)
if not mods["reskins-angels"] then
    data.raw["item"]["sulfur"].icons = nil
    data.raw["item"]["sulfur"].icon = "__base__/graphics/icons/sulfur.png"
    data.raw["item"]["sulfur"].icon_size = nil

    vgal.recipe.clear_icons("angels-solid-sulfur")

    data.raw["recipe"]["angels-yellow-waste-water-purification"].icons = vgal.icon.create({
        style   = "angels-liquid",
        outputs = { "angels-water-mineralized", "angels-water-purified", "sulfur" },
        palette = "WsSS",
    })

    data.raw["fluid"]["angels-water-yellow-waste"].icons = angelsmods.functions
        .create_viscous_liquid_fluid_icon(
            { "__base__/graphics/icons/sulfur.png" },
            { { 116, 140, 211 }, { 255, 219, 051 }, { 109, 070, 020, 0.8 }, { 254, 204, 049 } },
            true
        )
end

-- fix meat recipe icons
for _, recipe in pairs(data.raw["recipe"]) do
    if vgal.recipe.has_category(recipe, "angels-bio-butchery") and recipe.ingredients and (#recipe.ingredients > 0) then
        recipe.icons = vgal.icon.merge_composites({
            vgal.icon.get("angels-bio-raw-meat"),
            vgal.icon.get_in(recipe.ingredients[1].name, "item"),
        })
    end
end

-- fix solid fuel recipe icons
data.raw["recipe"]["angels-solid-fuel-methane"].icons = vgal.icon.merge_composites({
    vgal.icon.get("solid-fuel"),
    vgal.icon.get_in("angels-gas-methane"),
})
data.raw["recipe"]["angels-solid-fuel-naphtha"].icons = vgal.icon.merge_composites({
    vgal.icon.get("solid-fuel"),
    vgal.icon.get_in("angels-liquid-naphtha"),
})
data.raw["recipe"]["angels-solid-fuel-fuel-oil"].icons = vgal.icon.merge_composites({
    vgal.icon.get("solid-fuel"),
    vgal.icon.get_in("angels-liquid-fuel-oil"),
})
data.raw["recipe"]["angels-solid-fuel-synthesis"].icons = vgal.icon.merge_composites({
    vgal.icon.get("solid-fuel"),
    vgal.icon.get_in("angels-gas-synthesis"),
})
data.raw["recipe"]["angels-solid-fuel-hydrazine"].icons = vgal.icon.merge_composites({
    vgal.icon.get("solid-fuel"),
    vgal.icon.get_in("angels-gas-hydrazine"),
})

for _, nutrientable in pairs(vgal.defines.nutrientables) do
    local recipe = data.raw["recipe"][nutrientable.name .. "-nutrients"]

    recipe.icons = vgal.icon.merge_composites({
        vgal.icon.get("angels-liquid-nutrient-pulp"),
        vgal.icon.get_in(nutrientable.name, "item"),
    })
end
