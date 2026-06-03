-- vgal trims
vgal.data.trim("vgal-ammonia-water-crude-oil")
vgal.data.trim("vgal-spoilage-crude-oil")
vgal.data.trim("vgal-yumako-mash-light-oil")
vgal.data.trim("vgal-carbon-sulfur-lubricant")
vgal.data.trim("vgal-jelly-crude-oil-solid-fuel")
vgal.data.trim("vgal-jelly-sulfur-lubricant")
vgal.data.trim("vgal-fluorine-kovarex-enrichment-process")
vgal.data.trim("vgal-ammonia-thruster-oxidizer")
vgal.data.trim("vgal-crude-oil-thruster-fuel")
vgal.data.trim("vgal-iron-bacteria-ammonia")
vgal.data.trim("vgal-copper-bacteria-ammonia")
vgal.data.trim("vgal-water-coal-ammonia")
vgal.data.trim("vgal-ammonia-artificial-yumako-soil")
vgal.data.trim("vgal-ammonia-artificial-jellynut-soil")
vgal.data.trim("vgal-ammonia-explosives")
vgal.data.trim("vgal-carbon-uranium-ore")
vgal.data.trim("vgal-wood-carbon")
vgal.data.trim("vgal-spoilage-sulfuric-acid-carbon")
vgal.data.trim("vgal-ammoniacal-solution-raw-fish")
vgal.data.trim("vgal-carbon-stone-thruster-fuel")
vgal.data.trim("vgal-iron-ore-stone-thruster-oxidizer")
vgal.data.trim("vgal-stone-crushing") -- agal already adds a stone crushing recipe kinda, for sand. Limestone will be source of calcite
vgal.data.trim("casting-iron")
vgal.data.trim("casting-copper")
vgal.data.trim("casting-steel")
vgal.data.trim("casting-iron-stick")
vgal.data.trim("casting-iron-gear-wheel")
vgal.data.trim("casting-copper-cable")
-- vgal.data.trim("casting-low-density-structure")
vgal.data.trim("concrete-from-molten-iron")
vgal.data.trim("casting-pipe")
vgal.data.trim("casting-pipe-to-ground")
-- vgal.data.trim("vgal-molten-iron-rail")
vgal.data.trim("vgal-molten-iron-refined-concrete")
-- vgal.data.trim("vgal-molten-copper-carbon-fiber-low-density-structure")
-- vgal.data.trim("vgal-molten-iron-molten-copper-space-platform-foundation")
vgal.data.trim("molten-iron")
vgal.data.trim("molten-copper")
vgal.data.trim("vgal-iron-ore-coal-molten-iron")
vgal.data.trim("vgal-copper-ore-coal-molten-copper")
vgal.data.trim("vgal-ammonia-calcite-molten-iron")
vgal.data.trim("vgal-sulfuric-acid-calcite-molten-copper")
vgal.data.trim("vgal-sulfuric-acid-sulfur")
vgal.data.trim("vgal-holmium-ore-holmium-plate")
vgal.data.trim("vgal-angels-liquid-molten-steel-low-density-structure")
vgal.data.trim("vgal-calcite-carbon-concrete")

vgal.recipe.replace_ingredient("vgal-ammonia-agricultural-science-pack", "ammonia", "angels-gas-urea")
vgal.recipe.replace_ingredient("vgal-ammonia-artificial-yumako-soil", "ammonia", "angels-gas-urea")
vgal.recipe.replace_ingredient("vgal-ammonia-artificial-jellynut-soil", "ammonia", "angels-gas-urea")
vgal.recipe.replace_ingredient("vgal-jelly-ammonia-electronic-circuit", "ammonia", "angels-gas-urea")
vgal.recipe.replace_ingredient("vgal-petroleum-gas-barrel-biter-egg", "petroleum-gas-barrel",
    "angels-gas-carbon-dioxide-barrel")

-- vanilla trims
-- bio stuff will be obtained through bioprocessing
vgal.data.trim("biolubricant")
vgal.data.trim("bioplastic")
vgal.data.trim("biosulfur")
vgal.data.trim("rocket-fuel-from-jelly")
-- might be saveble
vgal.data.trim("simple-coal-liquefaction")
vgal.data.trim("carbon")
-- other more angel-ish ways avalible
vgal.data.trim("solid-fuel-from-ammonia")
vgal.data.trim("ammonia-rocket-fuel")
-- not needed now there are alt methods for coal recipes that don't use coal.
vgal.data.trim("coal-synthesis")
-- add spoilage to fiber recipe instead
vgal.data.trim("burnt-spoilage")
-- angels already adds a fish breeding recipe
vgal.data.trim("fish-breeding")

-- casting fixes
do
    ---@param recipe data.RecipePrototype
    local function make_steel_casting(recipe)
        local molten_steel_amount = vgal.recipe.get_ingredient_amount(recipe.name, "molten-iron") / 3

        molten_steel_amount = vgal.recipe.vanillize_number(molten_steel_amount, "fluid")

        vgal.recipe.add_ingredient(recipe.name, { "angels-liquid-molten-steel", molten_steel_amount }, "fluid")
        vgal.recipe.remove_ingredient(recipe.name, "molten-iron")

        -- error(serpent.block(recipe))
    end

    local iron_base_items = {
        ["iron-plate"] = true,
        ["iron-gear-wheel"] = true,
        ["iron-stick"] = true,
    }

    local casting_recipes = {}

    -- discover casting recipes
    for _, recipe in pairs(data.raw["recipe"]) do
        local has_molten_metal_input = false
        local has_item_output = false
        local has_science_pack_output = false

        for _, ingredient in ipairs(recipe.ingredients or {}) do
            if ingredient.name == "molten-iron" or ingredient.name == "molten-copper" then
                has_molten_metal_input = true
                break
            end
        end

        if not has_molten_metal_input then
            goto continue
        end

        for _, result in ipairs(recipe.results or {}) do
            if result.type == "item" then
                has_item_output = true
                break
            end
        end

        if not has_item_output then
            goto continue
        end

        has_science_pack_output = vgal.table.contains(data.raw["lab"]["lab"].inputs, recipe.results[1].name)

        if has_science_pack_output then
            goto continue
        end

        table.insert(casting_recipes, recipe.name)
        ::continue::
    end

    for _, recipe_name in ipairs(casting_recipes) do
        local recipe = data.raw["recipe"][recipe_name]
        local main_product_recipe = data.raw["recipe"][vgal.recipe.get_preferred_main_product(recipe)]

        -- add sand
        do
            -- molten metals are still using their vanilla variant here, they get replaced in final fixes though
            local molten_metal_amount =
                (vgal.recipe.get_ingredient_amount(recipe_name, "molten-iron") + vgal.recipe.get_ingredient_amount(recipe_name, "molten-copper"))

            local sand_amount = vgal.recipe.vanillize_number(molten_metal_amount / 60, "item")
            sand_amount = math.min(sand_amount, 10)
            if sand_amount == 3 then
                sand_amount = 2
            end

            vgal.recipe.add_ingredient(recipe_name, { "angels-solid-sand", sand_amount })
        end

        -- steel fixes
        do
            local casting_recipe_has_molten_iron = vgal.recipe.get_ingredient_amount(recipe_name, "molten-iron") > 0

            -- check main product recipe to see if it has steel plate input, and no iron input
            if main_product_recipe and main_product_recipe.ingredients then
                local mm_recipe_has_steel_plate = false
                local mm_recipe_has_iron_product = false
                for _, ingredient in ipairs(main_product_recipe.ingredients) do
                    if iron_base_items[ingredient.name] then
                        mm_recipe_has_iron_product = true
                        goto continue
                    elseif ingredient.name == "steel-plate" then
                        mm_recipe_has_steel_plate = true
                    end
                    ::continue::
                end

                -- if steel and no iron, replace all molten iron req with less molten steel
                if casting_recipe_has_molten_iron and mm_recipe_has_steel_plate and not mm_recipe_has_iron_product then
                    make_steel_casting(recipe)
                end
            end
        end

        -- big mining drill fixes
        do
            if recipe.results[1].name == "big-mining-drill" then
                make_steel_casting(recipe)
                vgal.recipe.set_ingredient_amount(recipe_name,
                    math.ceil(vgal.recipe.get_ingredient_amount(recipe_name, "angels-liquid-molten-steel") / 25) * 25,
                    "angels-liquid-molten-steel")
            end
        end
    end

    -- fix foundry recipe duration (foundry crafting speed has been reduced to 2)
    -- data.raw["recipe"]["foundry"].energy_required = 5                  -- og; 10
    -- data.raw["recipe"]["big-mining-drill"].energy_required = 15        -- og; 30
    -- data.raw["recipe"]["metallurgic-science-pack"].energy_required = 5 -- og; 10
    -- data.raw["recipe"]["tungsten-plate"].energy_required = 5           -- og; 10
    for _, recipe in pairs(data.raw["recipe"]) do
        if recipe.energy_required and recipe.energy_required >= 8
            and (not (vgal.recipe.has_category(recipe.name, "crafting") or vgal.recipe.has_category(recipe.name, "crafting-with-fluid") or vgal.recipe.has_category(recipe.name, "pressing")) and vgal.recipe.has_category(recipe.name, "metallurgy")) then
            local final_energy_required = recipe.energy_required / 2

            if final_energy_required > 3 then
                final_energy_required = math.ceil(final_energy_required)
            end

            recipe.energy_required = final_energy_required
        end
    end
end

-- category tweaks
data.raw["recipe"]["vgal-molten-copper-carbon-fiber-low-density-structure"].category = "angels-casting"
data.raw["recipe"]["tungsten-carbide"].category = "angels-chemical-smelting"
