repeat task.wait() until game:IsLoaded()

-- Notification Function
function Notification(text)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Made by OperationCryptic",
        Text = text,
        Icon = "rbxassetid://111229342765121",
        Duration = 15,
    })
end

-- Ensure `queue_on_teleport` is properly set up
local queue_on_teleport = queue_on_teleport or function(code)
    if syn and syn.queue_on_teleport then
        syn.queue_on_teleport(code)
    elseif queue_on_teleport then
        queue_on_teleport(code)
    else
        warn("Your executor does not support queue_on_teleport.")
    end
end

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local bindingtool
repeat task.wait() until game:GetService("Players").LocalPlayer.Data:FindFirstChild("Gold")
local goldv = game:GetService("Players").LocalPlayer.Data.Gold.Value
local purchasetools
local run = false
local colors = {
    SchemeColor = Color3.fromRGB(255, 0, 0),
    Background = Color3.fromRGB(20, 20, 20),
    Header = Color3.fromRGB(10, 10, 10),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(20, 20, 20),
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
local function rejoinServer()
    local teleportScript = [[
        repeat task.wait() until game:IsLoaded()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/MysticCr1/RobloxScripts/refs/heads/scripts/BABFT.lua'))()
        --RELAUNCH
    ]]
    queue_on_teleport(teleportScript)
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId)
end
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("BABFT", colors)

-- Settings Tab
local settings = Window:NewTab("Settings")
local set = settings:NewSection("Keybinds")

set:NewKeybind("Hide UI", "Press F to hide the UI", Enum.KeyCode.F, function()
    Library:ToggleUI()
end)

set:NewButton("Rejoin", "Rejoin the same server and replay the script", function()
    rejoinServer()
end)

-- Functions Tab
local fun = Window:NewTab("Functions")
local Func = fun:NewSection("Farming")

Func:NewToggle("Gold", "Autofarms gold for you", function(state)
    if state then
        run = true
        character:FindFirstChild("Head"):Destroy()
    else
        run = false
    end
end)

local Purchasing = fun:NewSection("Purchasing")

Purchasing:NewToggle("Tools", "Purchases tools automatically", function(state)
    purchasetools = state
end)
-- Auto-rejoin every 19 minutes
local rejoinDelay = 19 * 60 -- 19 minutes
spawn(function()
    while wait(rejoinDelay) do
        rejoinServer()
    end
end)

Notification("Script fully loaded and ready!")
