function vgal.math.conserve_floor(input_number)
    local toret = math.floor(input_number)
    if toret == 0 then
        return 1
    end
    return toret
end
