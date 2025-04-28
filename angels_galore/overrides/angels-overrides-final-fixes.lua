--- barrel hiding ---
for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.category == "barreling-pump" then
        recipe.hide_from_player_crafting = true
    end
end
