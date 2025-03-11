local BlockedGameID = {
    "4483381587",
}

local BlockedPlayerID = {
    "1",
}

function isPlayerBlocked(playerID)
    for _, id in ipairs(BlockedPlayerID) do
        if id == playerID then
            return true
        end
    end
    return false
end

function safeRemoteSpy()
    if table.find(BlockedGameID, tostring(game.PlaceId)) or isPlayerBlocked(tostring(game.Players.LocalPlayer.UserId)) then
        print("Blocked Game or Player")
        return
    end
    print("Authorized Game")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
end

safeRemoteSpy()