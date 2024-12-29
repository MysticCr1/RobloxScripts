-- Wait until the game is fully loaded
repeat task.wait() until game:IsLoaded()

-- Services and LocalPlayer
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer

-- Function to queue code execution after teleport
local queue_on_teleport = queue_on_teleport or function(code)
    if syn and syn.queue_on_teleport then
        syn.queue_on_teleport(code)
    elseif queue_on_teleport then
        queue_on_teleport(code)
    else
        warn("Your executor does not support queue_on_teleport.")
    end
end

-- Define the code to execute after teleport
local teleportCode = [[
    loadstring(game:HttpGet("https://scripts.alchemyhub.xyz"))()
]]

-- Function to rejoin the game
task.spawn(function()
    while true do
        task.wait(1800) -- Wait for 30 minutes (1800 seconds)
        queue_on_teleport(teleportCode)
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end
end)

-- Connect the teleport event to set up the queue
LocalPlayer.OnTeleport:Connect(function()
    queue_on_teleport(teleportCode)
end)

-- Notify that the teleport script is set up
print("Teleport script setup complete. Teleport to see it in action.")
