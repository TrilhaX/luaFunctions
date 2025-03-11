function safeGetChildren(parent, name)
    local object = parent:FindFirstChild(name)
    if object then
        return object:GetChildren()
    else
        return {}
    end
end