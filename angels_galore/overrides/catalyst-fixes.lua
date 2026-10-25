---@param recipe_name string
local function fix_catalyst(recipe_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)

    local has_fixed_catalyst = false -- some recipes got fully overwriten before this runs, so make it safe in case it encounters an already fixed recipe

    for i = #recipe.results, 1, -1 do
        local result = recipe.results[i]
        if result.type == "item" and result.shared_probability then
            table.remove(recipe.results, i)
            has_fixed_catalyst = true
        end
    end

    if has_fixed_catalyst then
        vgal.recipe.add_result(recipe, "angels-catalyst-metal-carrier")
    end
end

fix_catalyst("angels-coal-cracking-2")
fix_catalyst("angels-gas-ammonia")
fix_catalyst("angels-liquid-naphtha-catalyst")
fix_catalyst("angels-catalyst-steam-cracking-naphtha")
fix_catalyst("angels-liquid-phenol")
fix_catalyst("angels-liquid-acetic-acid-catalyst")

fix_catalyst("angels-gas-hydrazine")
fix_catalyst("angels-gas-nitrogen-dioxide")
fix_catalyst("angels-gas-acid-catalyst")
fix_catalyst("angels-gas-synthesis-methanation")
fix_catalyst("angels-gas-synthesis-methanol")
fix_catalyst("angels-liquid-toluene")
fix_catalyst("angels-liquid-toluene-from-benzene")
fix_catalyst("angels-gas-benzene")
fix_catalyst("angels-liquid-polyethylene")
fix_catalyst("angels-gas-methanol")
fix_catalyst("angels-cumene-process")
fix_catalyst("angels-liquid-propionic-acid")
fix_catalyst("angels-solid-sodium-perchlorate")
