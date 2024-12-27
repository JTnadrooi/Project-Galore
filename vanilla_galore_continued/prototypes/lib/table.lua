--- Checks if a table contains a specific value.
--- @param table table The table to search.
--- @param value any The value to search for.
--- @return boolean True if the table contains the value, false otherwise.
function vgal.table.contains(table, value)
    for _, value2 in ipairs(table) do
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
    if single == nil and multiple == nil then
        error("Both single and multiple are nil")
    end
    if single then
        if multiple then
            error("'single' and 'multiple' cannot both be set at the same time.")
        end
        return { single }
    end
    ---@cast multiple table
    return multiple
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
    for i = 1, #t2 do
        t1[#t1 + 1] = t2[i]
    end
    return t1
end

function vgal.table.get_shorthand(inTable, newType)
    local transformed = {}
    for _, item in ipairs(inTable) do
        if item[3] then
            table.insert(transformed, { type = newType, name = item[1], amount = item[2], probability = item[3] })
        elseif item[4] then
            table.insert(transformed,
                {
                    type = newType,
                    name = item[1],
                    amount = item[2],
                    probability = item[3],
                    amount_min = item[4],
                    amount_max = item[5]
                })
        else
            table.insert(transformed, { type = newType, name = item[1], amount = item[2] })
        end
    end
    return transformed
end
