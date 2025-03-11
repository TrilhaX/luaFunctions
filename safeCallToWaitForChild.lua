function safeWaitForChild(parent, childName, timeout)
    local child = parent:FindFirstChild(childName)
    local elapsedTime = 0
    while not child and elapsedTime < timeout do
        wait(0.1)
        elapsedTime = elapsedTime + 0.1
        child = parent:FindFirstChild(childName)
    end
    return child
end