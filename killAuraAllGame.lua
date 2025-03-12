function killAura(mob, method, delay)
    if not mob or not method then
        warn("Invalid mob or method")
        return
    end

    function damageHumanoid(humanoid)
        local decrement = 500
        while humanoid.Health > 0 do
            humanoid:TakeDamage(decrement) -- more reliable than setting Health directly
            task.wait(delay)
        end
    end

    function destroyHead(v)
        local head = v:FindFirstChild("Head")
        if head then
            head:Destroy()
            task.wait(delay)
        end
    end

    function networkDestroy(v)
        local humanoid = v:FindFirstChild("Humanoid")
        if humanoid and humanoid.Parent and humanoid.Parent.PrimaryPart then
            local rootPart = humanoid.Parent.PrimaryPart
            rootPart:SetNetworkOwner(nil)
            rootPart:Destroy()
            task.wait(delay)
        end
    end

    for _, v in ipairs(mob:GetChildren()) do
        local humanoid = v:FindFirstChild("Humanoid")
        if humanoid then
            if method == "humanoid" or method == "takeDamage" then
                damageHumanoid(humanoid)
            elseif method == "headDestroy" then
                destroyHead(v)
            elseif method == "networkownership" then
                networkDestroy(v)
            else
                warn("Invalid method specified: " .. tostring(method))
                return
            end
        end
    end
end
