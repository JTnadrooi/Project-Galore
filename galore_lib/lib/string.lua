vgal.string = vgal.string or {}

---@param str string
---@param prefix string
---@return boolean
function vgal.string.starts_with(str, prefix)
    return string.sub(str, 1, #prefix) == prefix
end

---@param str string
---@param target string
---@param replacement string
---@return string
function vgal.string.replace(str, target, replacement)
    local result = str:gsub(target:gsub("(%W)", "%%%1"), replacement)
    return (result) -- gets rid of the second return value maybe
end

---@param str string
---@param suffix string
---@return boolean
function vgal.string.ends_with(str, suffix)
    return suffix == "" or string.sub(str, - #suffix) == suffix
end

---@param str string
---@return string
function vgal.string.escape(str)
    return (str:gsub("(%W)", "%%%1"))
end

---@param inputstr string
---@param sep string
---@return string[]
function vgal.string.split(inputstr, sep)
    sep = vgal.string.escape(sep)

    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    
    return t
end
