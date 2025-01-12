local TweenService = game:GetService("TweenService")
repeat task.wait() until game:IsLoaded()
local queue_on_teleport = queue_on_teleport or function(code)
    if syn and syn.queue_on_teleport then
        syn.queue_on_teleport(code)
    elseif queue_on_teleport then
        queue_on_teleport(code)
    else
        warn("Your executor does not support queue_on_teleport.")
    end
end
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local player = game.Players.LocalPlayer
local character = player.Character
local bindingtool
local goldv = game:GetService("Players").LocalPlayer.Data.Gold.Value
local purchasetools
local run = false
local SaveValue
local colors = {
    SchemeColor = Color3.fromRGB(255, 0, 0),
    Background = Color3.fromRGB(20, 20, 20),
    Header = Color3.fromRGB(10, 10, 10),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}
local humanoidroot

local function setupCharacter(character)
    humanoidroot = character:WaitForChild("HumanoidRootPart")
end

local function removeVelocity()
    if humanoidroot then
        humanoidroot.Velocity = Vector3.new(0, 0, 0)
        humanoidroot.RotVelocity = Vector3.new(0, 0, 0)
    end
end

local function maintainZeroVelocity(tween)
    local connection
    connection = RunService.Stepped:Connect(function()
        removeVelocity()
    end)

    tween.Completed:Connect(function(playbackState)
        if playbackState == Enum.PlaybackState.Completed then
            connection:Disconnect()
        end
    end)
end

local function startTweens()
    local tween1 = TweenService:Create(
        humanoidroot,
        TweenInfo.new(2.5, Enum.EasingStyle.Linear),
        { CFrame = CFrame.new(-51.741737365722656, 46.0748176574707, -159.60386657714844) }
    )

    local tween2 = TweenService:Create(
        humanoidroot,
        TweenInfo.new(30, Enum.EasingStyle.Linear),
        { CFrame = CFrame.new(-51.741737365722656, 46.0748176574707, 8723.8603515625) }
    )
    local tween3 = TweenService:Create(
        humanoidroot,
        TweenInfo.new(2.5, Enum.EasingStyle.Linear),
        { CFrame = CFrame.new(-54.751220703125, -351.3304443359375, 9495.1142578125) }
    )
    tween2.Completed:Connect(function(playbackState)
        if playbackState == Enum.PlaybackState.Completed then
            maintainZeroVelocity(tween3)
            tween3:Play()
        end
    end)
    tween1.Completed:Connect(function(playbackState)
        if playbackState == Enum.PlaybackState.Completed then
            maintainZeroVelocity(tween2)
            tween2:Play()
        end
    end)

    maintainZeroVelocity(tween1)
    tween1:Play()
end

player.CharacterAdded:Connect(function(character)
    if run then
        setupCharacter(character)
        wait(2)
        startTweens()
    end
end)

RunService.Stepped:Connect(function()
    if purchasetools then
        if goldv > 2000 and not bindingtool then
            local args = {
                [1] = "Binding Tool",
                [2] = 1
            }

            workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer(unpack(args))
            bindingtool = true
        end
    end
end)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("BABFT", colors)
local settings = Window:NewTab("Settings")
local set = settings:NewSection("Keybinds")
set:NewKeybind("Hide UI", "Press F to hide the UI", Enum.KeyCode.F, function()
    Library:ToggleUI()
end)
local fun = Window:NewTab("Functions")
local Func = fun:NewSection("Farming")
Func:NewToggle("Gold", "Autofarms gold for you", function(state)
    if state then
        run = true
        character["Head"]:Destroy()
    else
        run = false
    end
end)
local Purchasing = fun:NewSection("Purchasing")
Purchasing:NewToggle("Tools", "Purchases tools automatically", function(state)
    purchasetools = state
end)

-- Rejoin Logic
local function rejoinServer()
    local teleportScript = [[
	loadstring(game:HttpGet('https://raw.githubusercontent.com/MysticCr1/RobloxScripts/refs/heads/scripts/BABFT.lua')()
    ]]
    queue_on_teleport(teleportScript)
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
end
set:NewButton("Rejoin", "Rejoin the same server and replay the script", function()
    rejoinServer()
end)
local rejoinDelay = 19 * 60
spawn(function()
    while wait(rejoinDelay) do
        rejoinServer()
    end
end)
