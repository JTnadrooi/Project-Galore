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
--- @param table table A table containing numerical values.
--- @return number The sum of the values in the table.
function vgal.table.sum(table)
    local sum = 0
    for _, value in ipairs(table) do
        sum = sum + value
    end
    return sum
end

function vgal.table.merge(t1, t2)
    local result = {}
    t1 = t1 or {}
    t2 = t2 or {}

    for i = 1, #t1 do
        result[#result + 1] = t1[i]
    end

    for i = 1, #t2 do
        result[#result + 1] = t2[i]
    end

    return result
end

function vgal.table.fill_in_from(t1, t2)
    local function is_array(t)
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
    local result = {}
    t1 = t1 or {}
    t2 = t2 or {}
    for k, v in pairs(t1) do
        if type(v) == "table" and type(t2[k]) == "table" then
            if is_array(v) and is_array(t2[k]) then
                result[k] = vgal.table.merge(v, t2[k])
            else
                result[k] = vgal.table.fill_in_from(v, t2[k])
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

function vgal.table.nil_if_empty(t1)
    for _ in pairs(t1) do
        return t1
    end
    return nil
end

function vgal.table.get_shorthand(in_table, new_type)
    local transformed = {}
    for _, item in ipairs(in_table) do
        table.insert(transformed, vgal.table.get_single_shorthand(item, new_type))
    end
    return transformed
end

function vgal.table.get_single_shorthand(in_value, new_type)
    local new_entry = {
        type = new_type,
        name = in_value[1],
        amount = in_value[2]
    }
    if type(in_value[3]) == "table" then
        for k, v in pairs(in_value[3]) do
            new_entry[k] = v
        end
    end
    return new_entry
end

-- function vgal.table.get_multiplied(intTable, amount)
--     local newTable = {}
--     for key, value in pairs(intTable) do
--         newTable[key] = value
--     end
--     if newTable.amount then
--         newTable.amount = math.max(1, math.floor(newTable.amount * amount + 0.5))
--     end
--     if newTable.probability then
--         newTable.probability = math.min(1, newTable.probability / amount)
--     end
--     return newTable
-- end

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

-- Main function: accepts either a single entry or an array of entries.
-- multiplier: the factor to multiply the amount by.
-- entry_name (optional): if provided, only entries with this name will be multiplied.
function vgal.table.get_multiplied(input, multiplier, entry_name)
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

--- Universal nested iterator over multiple arrays (tables).
--- Allows looping over all combinations of multiple lists, like nested `for` loops.
--- Returns unpacked values from each list for destructuring in `for` loops.
--- Example usage:
--- ```lua
--- for ore_index, ore_state in universal_ipairs(ore_indexes, ore_states) do
---     print(ore_index, ore_state)
--- end
--- ```
--- Supports any number of lists.
--- Stops iteration when the first list is fully exhausted.
--- @param ... table List(s) of arrays to iterate over (tables with sequential integer keys).
--- @return function Iterator function compatible with Lua's `for` loop.
function vgal.table.nipairs(...)
    local lists = { ... }
    local indices = {}
    for i = 1, #lists do indices[i] = 0 end
    return function()
        local n = #lists                      -- advance last index.
        indices[n] = indices[n] + 1
        for i = n, 1, -1 do                   -- carry over if needed.
            if lists[i][indices[i]] == nil then
                if i == 1 then return nil end -- fully finished.
                indices[i] = 1
                indices[i - 1] = indices[i - 1] + 1
            end
        end
        local results = {}
        for i = 1, n do results[i] = lists[i][indices[i]] end
        return table.unpack(results)
    end
end

function vgal.table.normalise(arr)
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
