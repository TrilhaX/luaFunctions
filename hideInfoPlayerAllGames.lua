function hidePlayer()
    local player = game.Players.LocalPlayer
    local character = player.Character

    if character then
        local head = character.Head
        local humanoidrootpart = character.HumanoidRootPart
        for i, v in pairs(head:GetChildren())do
            if v.ClassName == "BillboardGui" or v.ClassName == "Decal" then
                v:Destroy()
            end
        end
                for i, v in pairs(humanoidrootpart:GetChildren())do
            if v.ClassName == "BillboardGui" or v.ClassName == "Decal" then
                v:Destroy()
            end
        end
        for _, obj in ipairs(character:GetChildren()) do
            if obj:IsA("Accessory") or obj:IsA("Shirt") or obj:IsA("Pants") then
                obj:Destroy()
            end
        end
    end
end

hidePlayer()
