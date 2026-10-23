vgal.math = vgal.math or {}

---@param input_number number
---@return integer
function vgal.math.conserve_floor(input_number)
    local toret = math.floor(input_number)
    if toret == 0 then
        return 1
    end
    return toret
end

---@param result data.ProductPrototype
---@return number
function vgal.math.get_normalized_amount(result)
    local amount = 1

    if result.amount then
        amount = result.amount or 1
    elseif result.amount_min and result.amount_max then
        amount = (result.amount_min + result.amount_max) / 2
    else
        vgal.soft_error("Invalid recipe result: " .. serpent.block(result))
        return 1
    end

    if result.independent_probability then
        amount = amount * result.independent_probability
    end
    return amount
end

---@param number number
---@param number_type "item"|"fluid"|"time"|"tech"
---@return integer
function vgal.math.vanillize_number(number, number_type)
    if number_type == "fluid" then
        if number < 10 then
            return 5
        elseif number < 50 then
            return math.ceil(number / 10) * 10
        elseif number < 100 then
            return math.ceil(number / 25) * 25
        elseif number < 300 then
            local r20 = math.ceil(number / 20 + 0.5) * 20
            local r25 = math.ceil(number / 25 + 0.5) * 25

            if math.abs(number - r20) <= math.abs(number - r25) then
                return r20
            else
                return r25
            end
        else
            return math.ceil(number / 50) * 50
        end
    end

    if number_type == "item" then
        if number < 1 then
            return 1
        else
            number = math.floor(number)
        end
        if number == 7 then return 8 end
        if number == 9 then return 10 end
        if number == 11 then return 10 end
        if number > 12 then
            if math.fmod(number, 5) == 0 then
                return number
            else
                return math.floor(number / 2) * 2
            end
        else
            return number
        end
    end

    if number_type == "time" then
        if number == 7 then return 8 end
        if number == 11 then return 10 end
        if number > 12 then
            if math.fmod(number, 5) == 0 then
                return number
            else
                return math.floor(number / 2) * 2
            end
        else
            return number
        end
    end

    if number_type == "tech" then
        local round_to = nil

        if number < 50 then
            round_to = 5
            -- elseif number < 100 then
            --     round_to = 20
        elseif number < 200 then
            round_to = 25
        elseif number < 400 then
            round_to = 50
        elseif number < 500 then
            round_to = 100
        else
            round_to = 500
        end

        return math.floor(number / round_to + 0.5) * round_to
    end

    error("Invalid number type.")
end
