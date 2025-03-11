function fireproximityprompt(Obj, Amount, Skip)
	if not Obj then
		return warn("userdata<ProximityPrompt> expected")
	end
	local Obj = Obj:IsA("ProximityPrompt") and Obj or Obj:FindFirstChildWhichIsA("ProximityPrompt")
	if Obj and Obj.ClassName == "ProximityPrompt" then
		Obj.Enabled = true
		Amount = Amount or 1
		local PromptTime = Obj.HoldDuration
		if typeof(Skip) == "boolean" and Skip then
			Obj.HoldDuration = 0
		end
		for i = 1, Amount do
			Obj:InputHoldBegin()
			if typeof(Skip) == "boolean" and not Skip then
				task.wait(Obj.HoldDuration)
			elseif typeof(Skip) == "number" then
				task.wait(Skip)
			end
			Obj:InputHoldEnd()
		end
		Obj.HoldDuration = PromptTime
	else
		return warn("userdata<ProximityPrompt> expected")
	end
end