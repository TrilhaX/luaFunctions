function GetPositionFARMMETHOD(Mob, Method, offset) --Dont Put offset = 0
    if not Mob then
        return
    end

    local MobCFrame = GetCFrame(Mob)
    if not MobCFrame then
        return
    end

    local MobPosition = MobCFrame.Position
    offset = offset
    Method = Method

    local function positionCharacter(position)
        local lookVector = (MobPosition - position).Unit
        return CFrame.new(position, position + lookVector)
    end

    local Pos
    if Method == 'Above' then
        Pos = positionCharacter(MobPosition + Vector3.new(0, offset, 0))
    elseif Method == 'Below' then
        Pos = positionCharacter(MobPosition - Vector3.new(0, offset, 0))
    elseif Method == 'Front' then
        Pos = positionCharacter(MobPosition + MobCFrame.LookVector * offset)
    elseif Method == 'Behind' then
        Pos = positionCharacter(MobPosition - MobCFrame.LookVector * offset)
    end

    return Pos
end