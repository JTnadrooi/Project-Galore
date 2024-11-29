function vgal.math.conserve_floor(inputNum)
    local toret = math.floor(inputNum)
    if toret == 0 then
        return 1
    else
        return toret
    end
  end
