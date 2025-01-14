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

Notification("Script loaded successfully")
local rejoinqueued
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
local starterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local playerGui = player:WaitForChild("PlayerGui")
local backpack = player:WaitForChild("Backpack")
local function setupCharacter(character)
    humanoidroot = character:WaitForChild("HumanoidRootPart")
    print("HumanoidRootPart set up:", humanoidroot)
end
local function preparescreen()
    for _, gui in pairs(playerGui:GetChildren()) do
        if gui.Name == "GoldGui" then
            gui.Enabled = false
        end
        gui:Destroy()
    end
    for _, tool in pairs(backpack:GetChildren()) do
        tool:Destroy()
    end
    -- Create the ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "BlackScreenGui"
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Create the Frame to cover the screen
    local blackFrame = Instance.new("Frame")
    blackFrame.Size = UDim2.new(1, 0, 1, 500)     -- Slightly larger to cover all edges
    blackFrame.Position = UDim2.new(0, 0, 0, -475) -- Position slightly above the top edge
    blackFrame.BackgroundColor3 = Color3.new(0, 0, 0) -- Black color
    blackFrame.BorderSizePixel = 0                -- No border
    blackFrame.BackgroundTransparency = 0.2       -- Slightly transparent
    blackFrame.Parent = screenGui

    -- Add TextLabel to the ScreenGui
    local textLabel = Instance.new("TextLabel")
    textLabel.Text = "CRYPTIC'S SCRIPTS"       -- The displayed text
    textLabel.Font = Enum.Font.Fantasy         -- Curvy font
    textLabel.TextColor3 = Color3.new(1, 1, 1) -- White text
    textLabel.TextScaled = true                -- Make the text scale to fit the label
    textLabel.Size = UDim2.new(0.5, 0, 0.25)   -- Size is 50% width, 25% height of the screen
    textLabel.Position = UDim2.new(0.25, 0, 0.075) -- Centered horizontally, top-middle of the screen
    textLabel.BackgroundTransparency = 1       -- No background
    textLabel.Parent = screenGui
    starterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
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
    if not humanoidroot then
        warn("HumanoidRootPart not found. Aborting tweens.")
        return
    end

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
        { CFrame = CFrame.new(-54.751220703125, -351.3304443359375, 9489.1142578125) }
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

local function rejoinServer()
    local teleportScript = [[
        repeat task.wait() until game:IsLoaded()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/MysticCr1/RobloxScripts/refs/heads/scripts/BABFTGOLD.lua'))()
    ]]
    queue_on_teleport(teleportScript)
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId)
end

player.CharacterAdded:Connect(function(character)
    if rejoinqueued then
        rejoinServer()
        return
    end
    setupCharacter(character)
    wait(2)
    startTweens()
end)

local rejoinDelay = 19 * 60
spawn(function()
    while wait(rejoinDelay) do
        rejoinqueued = true
    end
end)

local head = character:FindFirstChild("Head")
if head then
    head:Destroy()
    preparescreen()
else
    warn("Head not found in the character.")
end
