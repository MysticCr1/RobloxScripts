local queue_on_teleport = queue_on_teleport or function(code)
    if syn and syn.queue_on_teleport then
        syn.queue_on_teleport(code)
    elseif queue_on_teleport then
        queue_on_teleport(code)
    else
        warn("Your executor does not support queue_on_teleport.")
    end
end
if game.PlaceId == 6516141723 then
  local teleportScript = string.format([[
                    repeat task.wait() until game:IsLoaded()
                    loadstring(game:HttpGet('https://raw.githubusercontent.com/MysticCr1/RobloxScripts/refs/heads/scripts/Doors.lua'))()
  ]]
  queue_on_teleport(teleportScript)
end
if game.PlaceId == 10449761463 then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/MysticCr1/RobloxScripts/refs/heads/scripts/TSB.lua'))()
end
