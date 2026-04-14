vgal.table = vgal.table or {}

--- Checks if a table contains a specific value.
--- @param table table The table to search.
--- @param value any The value to search for.
--- @return boolean True if the table contains the value, false otherwise.
function vgal.table.contains(table, value)
    if table[value] then
        return true
    end
    for _, value2 in pairs(table) do
        if value2 == value then
            return true
        end
    end
    return false
end

--- Filters a table based on a predicate.
--- @param tbl table The table to filter.
--- @param predicate function A function that takes an element and its index, returning true to include the element.
--- @return table A new table containing elements that satisfy the predicate.
function vgal.table.where(tbl, predicate)
    local result = {}
    for i, v in ipairs(tbl) do
        if predicate(v, i) then
            table.insert(result, v)
        end
    end
    return result
end

--- Transforms elements in a table using a provided function.
--- @param tbl table The table to transform.
--- @param transform function A function that takes an element and its index, returning the transformed element.
--- @return table A new table containing the transformed elements.
function vgal.table.select(tbl, transform)
    local result = {}
    for i, v in ipairs(tbl) do
        table.insert(result, transform(v, i))
    end
    return result
end

--- Checks if any element in a table satisfies a predicate.
--- @param tbl table The table to check.
--- @param predicate function|nil A function that takes an element and its index, returning true if the element satisfies the condition. If nil, checks if the table is non-empty.
--- @return boolean True if any element satisfies the predicate, false otherwise.
function vgal.table.any(tbl, predicate)
    if not predicate then
        return #tbl > 0
    end
    for i, v in ipairs(tbl) do
        if predicate(v, i) then
            return true
        end
    end
    return false
end

--- Checks if all elements in a table satisfy a predicate.
--- @param tbl table The table to check.
--- @param predicate function A function that takes an element and its index, returning true if the element satisfies the condition.
--- @return boolean True if all elements satisfy the predicate, false otherwise.
function vgal.table.all(tbl, predicate)
    if not predicate then
        error("Predicate cannot be nil")
    end
    for i, v in ipairs(tbl) do
        if not predicate(v, i) then
            return false
        end
    end
    return true
end

--- Gets the first element in a table that satisfies a predicate.
--- @param tbl table The table to search.
--- @param predicate function|nil A function that takes an element and its index, returning true if the element satisfies the condition. If nil, returns the first element in the table.
--- @return any|nil The first element that satisfies the predicate, or nil if no elements satisfy the condition.
function vgal.table.first(tbl, predicate)
    if not predicate then
        return tbl[1]
    end
    for i, v in ipairs(tbl) do
        if predicate(v, i) then
            return v
        end
    end
    return nil
end

--- Ensures a single value or multiple values is a table.
--- @param single any|nil A single value to normalize/ensure into a table.
--- @param multiple table|nil A table of values.
--- @return table A table wapping around the single value or the multiple.
function vgal.table.ensure(single, multiple)
    if single then
        if multiple then
            error("'single' and 'multiple' cannot both be set at the same time.")
        end
        return { single }
    end
    ---@cast multiple table
    return multiple or {}
end

--- Removes a single value from a table if it exists.
--- @param value any The value to remove from the table.
--- @param list table The table to remove the value from.
--- @return table The table after removing the value.
function vgal.table.remove(list, value)
    assert(type(list) == "table", "'list' must be a table.")
    for i = #list, 1, -1 do
        if list[i] == value then
            table.remove(list, i)
        end
    end
    return list
end

--- Sums the values in a table.
--- @param t table A table containing numerical values.
--- @return number The sum of the values in the table.
function vgal.table.sum(t)
    local sum = 0
    for _, value in ipairs(t) do
        sum = sum + value
    end
    return sum
end

---
---@param t table|any[]
function vgal.table.is_array(t)
    if type(t) ~= "table" then return false end
    local count = 0
    for k, _ in pairs(t) do
        if type(k) ~= "number" then
            return false
        end
        count = count + 1
    end
    return count == #t
end

-- NOT LINQ::

---@param t1 any[]
---@param t2 any[]
---@return table
function vgal.table.merge_array(t1, t2)
    local result = {}
    t1 = t1 or error("Table 1 cannot be nil.")
    t2 = t2 or error("Table 2 cannot be nil.")

    for i = 1, #t1 do
        result[#result + 1] = t1[i]
    end

    for i = 1, #t2 do
        result[#result + 1] = t2[i]
    end

    return result
end

---@param t1 table|any[]
---@param t2 table|any[]
---@return table|any[]
function vgal.table.deep_merge_with_priority(t1, t2)
    local result = {}

    t1 = t1 or error("Table 1 cannot be nil.")
    t2 = t2 or error("Table 2 cannot be nil.")

    for k, v in pairs(t1) do
        if type(v) == "table" and type(t2[k]) == "table" then
            if vgal.table.is_array(v) and vgal.table.is_array(t2[k]) then
                result[k] = vgal.table.merge_array(v, t2[k])
            else
                result[k] = vgal.table.deep_merge_with_priority(v, t2[k])
            end
        else
            result[k] = v
        end
    end

    for k, v in pairs(t2) do
        if result[k] == nil then
            result[k] = v
        end
    end

    return result
end

---@param t1 table|any[]
---@return (table|any[])?
function vgal.table.nil_if_empty(t1)
    for _ in pairs(t1) do
        return t1
    end
    for _ in ipairs(t1) do
        return t1
    end
    return nil
end

---Convert shorthand recipe entries to longform tables.
---
---Each entry can be:
---1. A single entry: `{name, amount[, extra_table]}`
---2. An array of entries: `{ {name, amount[, extra]}, ... }`
---
---@param entries vgal.ShorthandRecipeEntry | vgal.ShorthandRecipeEntry[]
---@param entry_type string The type to assign to each longform entry.
---@return data.ProductPrototype[]|data.IngredientPrototype[]
function vgal.table.to_longform(entries, entry_type)
    local function to_single(entry)
        local new_entry = {
            type = entry_type,
            name = entry[1],
            amount = entry[2]
        }
        if type(entry[3]) == "table" then
            for k, v in pairs(entry[3]) do
                new_entry[k] = v
            end
        end
        return new_entry
    end

    if next(entries) == nil then
        return {}
    end

    if #entries > 0 and type(entries[1]) == "table" and entries[1][1] ~= nil then
        local transformed = {}

        for _, item in ipairs(entries) do
            table.insert(transformed, to_single(item))
        end

        return transformed
    else
        return to_single(entries)
    end
end

---Multiply the "amount" field of one or more longform entries.
---
---For `item` entries, the result is rounded to the nearest integer with a minimum of 1.
---For `fluid` entries, the result is kept as a float.
---
---You can optionally provide an `entry_name` to only multiply entries with that name.
---
---@param input data.ProductPrototype|data.IngredientPrototype|data.ProductPrototype[]|data.IngredientPrototype[]
---Single entry or array of entries to process.
---@param multiplier number The factor to multiply the `amount` by.
---@param entry_name string? Optional. Only multiply entries whose `name` matches this.
---@return data.ProductPrototype|data.IngredientPrototype|data.ProductPrototype[]|data.IngredientPrototype[]
---Returns a processed entry or array of entries.
function vgal.table.get_multiplied(input, multiplier, entry_name)
    -- Multiply the "amount" field in a single entry based on its type.
    -- For type "item", the result is rounded (with a minimum value of 1).
    -- For type "fluid", the result is left as a float.
    local function process_entry(entry, multiplier, entry_name)
        -- If entry_name is provided, only process if the entry's name matches.
        if entry_name and entry.name ~= entry_name then
            return entry -- Return unmodified if names don't match.
        end

        -- Make a shallow copy of the entry to avoid mutating the original.
        local new_entry = {}
        for k, v in pairs(entry) do
            new_entry[k] = v
        end

        local multiplied = entry.amount * multiplier

        if entry.type == "item" then
            -- For items, round the amount to the nearest integer.
            -- Ensure that even if the multiplication gives a value less than 1, it rounds to at least 1.
            multiplied = math.floor(multiplied + 0.5)
            if multiplied < 1 then
                multiplied = 1
            end
        end

        new_entry.amount = multiplied
        return new_entry
    end

    -- Check if the input is a single entry (has a "type" field).
    if input.type then
        return process_entry(input, multiplier, entry_name)
    elseif type(input) == "table" then
        local result = {}
        for i, entry in ipairs(input) do
            result[i] = process_entry(entry, multiplier, entry_name)
        end
        return result
    else
        error("Invalid input: expected a table with a 'type' field or an array of such tables.")
    end
end

---@param ... table[]|any[][]
---@return function
function vgal.table.iter_all(...)
    local tables = { ... }
    local iterators = {}

    -- Create an iterator state for each table
    for i, t in ipairs(tables) do
        iterators[i] = { iter = pairs(t), t = t, key = nil }
    end

    local current = 1

    return function()
        while current <= #iterators do
            local state = iterators[current]
            local iter, t, key = state.iter, state.t, state.key
            local k, v = iter(t, key)
            if k ~= nil then
                state.key = k
                return v
            else
                current = current + 1
            end
        end
        return nil
    end
end

---@param arr number[]
---@return number[]
function vgal.table.normalise_array(arr)
    local max = -math.huge
    for _, v in ipairs(arr) do
        if v > max then max = v end
    end
    if max == 0 or max == -math.huge then
        local copy = {}
        for i, v in ipairs(arr) do
            copy[i] = v
        end
        return copy
    end
    local factor = 1 / max
    local scaled = {}
    for i, v in ipairs(arr) do
        scaled[i] = v * factor
    end
    return scaled
end

function vgal.table.from_array(arr, key_name)
    key_name = key_name or "name"

    local result = {}
    for _, value in ipairs(arr) do
        result[value] = {
            [key_name] = value
        }
    end

    return result
end

---@param target_table table
---@param entry table
---@param key_name (string|number)?
function vgal.table.extend_single(target_table, entry, key_name)
    key_name = key_name or "name"

    target_table[entry[key_name]] = entry
end

---@param target_array any[]
---@return any[]
function vgal.table.remove_duplicates(target_array)
    local seen = {}
    local result = {}
    for _, value in ipairs(target_array) do
        if not seen[value] then
            seen[value] = true
            table.insert(result, value)
        end
    end
    return result
end
