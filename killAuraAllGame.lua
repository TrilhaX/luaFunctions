function killAura(mob, method, delay)
    if method == "humanoid" then
        for i, v in ipairs(mob:GetChildren()) do
            local humanoid = v:FindFirstChild("Humanoid")
            if humanoid then
                local targetHealth = 0
                local decrement = 500

                while humanoid.Health > targetHealth do
                    humanoid.Health = math.max(humanoid.Health - decrement, targetHealth)
                    wait(delay)
                end
            end
        end
    elseif method == "headDestroy" then
        for i, v in ipairs(mob:GetChildren()) do
            local head = v:FindFirstChild("Head")
            if head then
                head:Destroy()
                wait(delay)
            end
        end
    elseif method == "networkownership" then
        for i, v in ipairs(mob:GetChildren()) do
            local humanoid = v:FindFirstChild("Humanoid")
            if humanoid then
                if humanoid.Parent and humanoid.Parent.PrimaryPart then
                    local part = humanoid.Parent.PrimaryPart
                    part:SetNetworkOwner(nil)
                end
                if humanoid.Parent and humanoid.Parent.PrimaryPart then
                    humanoid.Parent.PrimaryPart:Destroy()
                    wait(delay)
                end
            end
        end
    elseif method == "takeDamage" then
        for i, v in ipairs(mob:GetChildren()) do
            local humanoid = v:FindFirstChild("Humanoid")
            if humanoid then
                local targetHealth = 0
                local decrement = 500
                while humanoid.Health > targetHealth do
                    humanoid.Health = math.max(humanoid.Health - decrement, targetHealth)
                    wait(delay)
                end
            end
        end
    else
        print("No method specified")
    end
end