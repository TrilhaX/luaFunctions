game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
    if State == Enum.TeleportState.Started then
        queue_on_teleport([[-- put script/loadstring here who will auto execute after teleport]])
    end
end)