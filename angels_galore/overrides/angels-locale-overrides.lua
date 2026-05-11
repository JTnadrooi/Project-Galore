for _, metal in pairs(vgal.defines.metals --[[@as table<string, agal.Metal>]]) do
    -- vgal.recipe.use_recipe_locale(metal.ingot)
    vgal.recipe.use_recipe_locale(metal.ingot .. "-2", false) -- show amount in title gets faked
    vgal.recipe.use_recipe_locale(metal.ingot .. "-3", false)
end

---@param catalyst string
---@param target string
---@param needs_refine boolean?
---@return table
local function get_reacts_with_catalyst_loc(catalyst, target, needs_refine, for_base_ore)
    local ore_name = (target == "uranium") and "uranium-ore" or "angels-thorium-ore"

    local header = { "", { needs_refine and "agal-internal.further-refine-and-sort-catalyst" or "agal-internal.sort-catalyst" } }

    if for_base_ore then
        header = { "agal-internal.refine-and-sort-catalyst" }
    end

    return
    {
        "",
        { "item-description.loc-nl" },
        header,
        {
            "",
            { "item-description.loc-nl" },
            {
                "",
                { "item-description.loc-space" },
                { "item-description.loc-space" },
                { "item-description.loc-space" },
                { "item-description.loc-space" },
                { "item-description.loc-space" },
                { "item-description.loc-space" },
                { "item-description.loc-space" }
            }
        },
        { "",                       "[img=item/" .. ore_name .. "]", { "item-description.loc-space" }, { "item-description.loc-" .. target } }
    }
end

-- fix ore descs
-- data.raw["item"]["angels-ore3"].localised_description = {}
do
    -- iron
    data.raw["item"]["angels-ore3"].localised_description = {
        "",
        {
            "",
            { "item-description.angels-ore-refining" },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            { "",                                    "[img=item/iron-ore]", { "item-description.loc-space" }, { "item-description.loc-iron-ore" } },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-iron-nugget]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-iron-nugget" }
            },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-iron-pebbles]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-iron-pebbles" }
            },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-iron-slag]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-iron-slag" }
            }
        },
        get_reacts_with_catalyst_loc("angels-catalysator-brown", "uranium", true, true),
    }
    data.raw["item"]["angels-ore3-crushed"].localised_description = {
        "",
        {
            "",
            { "agal-internal.sort" },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            { "",                  "[img=item/iron-ore]", { "item-description.loc-space" }, { "item-description.loc-iron-ore" } },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-iron-nugget]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-iron-nugget" }
            },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-iron-pebbles]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-iron-pebbles" }
            }
        },
        {
            "",
            { "item-description.loc-nl" },
            { "item-description.angels-ore-refining-again" },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-iron-slag]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-iron-slag" }
            }
        },
        get_reacts_with_catalyst_loc("angels-catalysator-brown", "uranium", true),
    }
    data.raw["item"]["angels-ore3-chunk"].localised_description = {
        "",
        {
            "",
            { "agal-internal.sort" },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            { "",                  "[img=item/iron-ore]", { "item-description.loc-space" }, { "item-description.loc-iron-ore" } },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-iron-nugget]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-iron-nugget" }
            },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-iron-pebbles]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-iron-pebbles" }
            }
        },
        {
            "",
            { "item-description.loc-nl" },
            { "item-description.angels-ore-refining-again" },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-iron-slag]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-iron-slag" }
            }
        },
        get_reacts_with_catalyst_loc("angels-catalysator-brown", "uranium", true),
    }
    data.raw["item"]["angels-ore3-crystal"].localised_description = {
        "",
        {
            "",
            { "agal-internal.sort" },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            { "",                  "[img=item/iron-ore]", { "item-description.loc-space" }, { "item-description.loc-iron-ore" } },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-iron-nugget]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-iron-nugget" }
            },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-iron-pebbles]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-iron-pebbles" }
            },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-iron-slag]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-iron-slag" }
            }
        },
        get_reacts_with_catalyst_loc("angels-catalysator-brown", "uranium", false),
    }
    data.raw["item"]["angels-ore3-pure"].localised_description = {
        "",
        {
            "",
            { "agal-internal.sort" },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            { "",                  "[img=item/iron-ore]", { "item-description.loc-space" }, { "item-description.loc-iron-ore" } },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-iron-nugget]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-iron-nugget" }
            },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-iron-pebbles]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-iron-pebbles" }
            },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-iron-slag]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-iron-slag" }
            }
        },
        get_reacts_with_catalyst_loc("angels-catalysator-brown", "uranium", false),
    }

    -- copper
    data.raw["item"]["angels-ore2"].localised_description = {
        "",
        {
            "",
            { "item-description.angels-ore-refining" },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            { "",                                    "[img=item/copper-ore]", { "item-description.loc-space" }, { "item-description.loc-copper-ore" } },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-copper-nugget]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-copper-nugget" }
            },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-copper-pebbles]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-copper-pebbles" }
            },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-copper-slag]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-copper-slag" }
            }
        },
        get_reacts_with_catalyst_loc("angels-catalysator-green", "thorium", true, true),
    }
    data.raw["item"]["angels-ore2-crushed"].localised_description = {
        "",
        {
            "",
            { "agal-internal.sort" },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            { "",                  "[img=item/copper-ore]", { "item-description.loc-space" }, { "item-description.loc-copper-ore" } },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-copper-nugget]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-copper-nugget" }
            }
        },
        {
            "",
            { "item-description.loc-nl" },
            { "item-description.angels-ore-refining-again" },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-copper-pebbles]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-copper-pebbles" }
            },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-copper-slag]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-copper-slag" }
            }
        },
        get_reacts_with_catalyst_loc("angels-catalysator-green", "thorium", true),
    }
    data.raw["item"]["angels-ore2-chunk"].localised_description = {
        "",
        {
            "",
            { "agal-internal.sort" },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            { "",                  "[img=item/copper-ore]", { "item-description.loc-space" }, { "item-description.loc-copper-ore" } },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-copper-nugget]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-copper-nugget" }
            },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-copper-pebbles]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-copper-pebbles" }
            }
        },
        {
            "",
            { "item-description.loc-nl" },
            { "item-description.angels-ore-refining-again" },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-copper-slag]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-copper-slag" }
            }
        },
        get_reacts_with_catalyst_loc("angels-catalysator-green", "thorium", true),
    }
    data.raw["item"]["angels-ore2-crystal"].localised_description = {
        "",
        {
            "",
            { "agal-internal.sort" },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            { "",                  "[img=item/copper-ore]", { "item-description.loc-space" }, { "item-description.loc-copper-ore" } },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-copper-nugget]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-copper-nugget" }
            },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-copper-pebbles]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-copper-pebbles" }
            },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-copper-slag]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-copper-slag" }
            }
        },
        get_reacts_with_catalyst_loc("angels-catalysator-green", "thorium", true),
    }
    data.raw["item"]["angels-ore2-pure"].localised_description = {
        "",
        {
            "",
            { "agal-internal.sort" },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            { "",                  "[img=item/copper-ore]", { "item-description.loc-space" }, { "item-description.loc-copper-ore" } },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-copper-nugget]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-copper-nugget" }
            },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-copper-pebbles]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-copper-pebbles" }
            },
            {
                "",
                { "item-description.loc-nl" },
                {
                    "",
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" },
                    { "item-description.loc-space" }
                }
            },
            {
                "",
                "[img=item/angels-copper-slag]",
                { "item-description.loc-space" },
                { "item-description.loc-angels-copper-slag" }
            }
        },
        get_reacts_with_catalyst_loc("angels-catalysator-green", "thorium", false),
    }
end

-- fix ore entity descs
for _, metal in pairs(vgal.defines.metals --[[@as table<string, agal.Metal>]]) do
    data.raw["resource"][metal.base_ore].localised_description = table.deepcopy(data.raw["item"][metal.base_ore]
        .localised_description)
end

-- misc
vgal.recipe.use_recipe_locale("angels-cellulose-fiber", true)

data.raw["recipe"]["angels-solid-sulfur"].show_amount_in_title = true
data.raw["recipe"]["angels-solid-sulfur"].localised_name = nil

data.raw["recipe"]["angels-cellulose-fiber-raw-wood"].show_amount_in_title = true

for _, metal in pairs(vgal.defines.metals --[[@as table<string, agal.Metal>]]) do
    for _, ore_state in ipairs(agal.defines.ore_states) do
        -- commentedbc: ugly
        -- local previous = nil
        -- if ore_state == "crushed" then
        --     previous = "angels-ore" .. metal.ore_index
        -- elseif ore_state == "chunk" then
        --     previous = "angels-ore" .. metal.ore_index .. "-crushed"
        -- elseif ore_state == "crystal" then
        --     previous = "angels-ore" .. metal.ore_index .. "-chunk"
        -- elseif ore_state == "pure" then
        --     previous = "angels-ore" .. metal.ore_index .. "-crystal"
        -- end

        data.raw["recipe"][metal[ore_state]].localised_name =
        { "?",
            {
                "",
                { "agal-internal.ore-" .. metal.ore_index },
                " ",
                { "agal-internal.act-" .. ore_state },
            },
            { "item-name." .. metal[ore_state] },
        }
    end
end

vgal.tech.use_tech_locale("angels-stone-smelting-1")
vgal.tech.use_tech_locale("angels-stone-smelting-2")

vgal.tech.use_tech_locale("uranium-mining")

-- prevent oopsie locale
data.raw["recipe"]["angels-iron-pebbles"].localised_name = nil
data.raw["recipe"]["angels-copper-pebbles"].localised_name = nil

-- prevent tiered locale
data.raw["technology"]["angels-fusion-power-1"].localised_name = nil
data.raw["technology"]["angels-fusion-power-1"].localised_description = nil

-- use new "from" locale
vgal.recipe.use_recipe_locale("angels-solid-beans-nutrients")
vgal.recipe.use_recipe_locale("angels-solid-corn-nutrients")
vgal.recipe.use_recipe_locale("angels-solid-leafs-nutrients")
vgal.recipe.use_recipe_locale("angels-solid-nuts-nutrients")
vgal.recipe.use_recipe_locale("angels-solid-pips-nutrients")
vgal.recipe.use_recipe_locale("angels-solid-fruit-nutrients")

vgal.recipe.use_recipe_locale("angels-liquid-raw-vegetable-oil-nuts")
vgal.recipe.use_recipe_locale("angels-liquid-raw-vegetable-oil-pips")
vgal.recipe.use_recipe_locale("angels-liquid-raw-vegetable-oil-beans")

vgal.recipe.use_recipe_locale("angels-fermentation-corn")
vgal.recipe.use_recipe_locale("angels-fermentation-fruit")
