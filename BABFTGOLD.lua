repeat task.wait() until game:IsLoaded()

local timeLabel = Instance.new("TextLabel")
local gptmLabel = Instance.new("TextLabel")
local startTime = getgenv().startTime or os.time()
local TweenService = game:GetService("TweenService")
local starterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer
local Players = game.Players
local character = player.Character or player.CharacterAdded:Wait()
local playerGui = player:WaitForChild("PlayerGui")
local goldData = player:WaitForChild("Data"):WaitForChild("Gold")
local queue_on_teleport = queue_on_teleport or function(code)
    if syn and syn.queue_on_teleport then
        syn.queue_on_teleport(code)
    elseif queue_on_teleport then
        queue_on_teleport(code)
    else
        warn("Your executor does not support queue_on_teleport.")
    end
end

local initialGold = goldData.Value

local function setupCharacter(character)
    humanoidroot = character:WaitForChild("HumanoidRootPart")
end

local function updateTimer()
    local elapsedTime = os.time() - startTime
    local days = math.floor(elapsedTime / 86400) -- 86400 seconds in a day
    local hours = math.floor((elapsedTime % 86400) / 3600) -- 3600 seconds in an hour
    local minutes = math.floor((elapsedTime % 3600) / 60) -- 60 seconds in a minute
    local seconds = elapsedTime % 60
    
    if days > 0 then
        timeLabel.Text = string.format("Time Since Execute: %d days %02d:%02d:%02d", days, hours, minutes, seconds)
    elseif hours > 0 then
        timeLabel.Text = string.format("Time Since Execute: %02d:%02d:%02d", hours, minutes, seconds)
    else
        timeLabel.Text = string.format("Time Since Execute: %02d:%02d", minutes, seconds)
    end
end


local function updateAverageGPTM()
    local elapsedTotalTime = os.time() - startTime
    if elapsedTotalTime > 0 then
        local currentGold = goldData.Value
        local totalGoldEarned = currentGold - initialGold
        gptmLabel.Text = string.format("Gold Earned: %.2f", totalGoldEarned)
    end
end

local GC = getconnections or get_signal_cons
for i, v in pairs(GC(Players.LocalPlayer.Idled)) do
    if v["Disable"] then
        v["Disable"](v)
    elseif v["Disconnect"] then
        v["Disconnect"](v)
    end
end
local function hideguis()
    for _, gui in pairs(playerGui:GetChildren()) do
        if gui.Name == "BlackScreenGui" then else gui:Destroy() end
    end
end
local function preparescreen()
    local backpack = player:WaitForChild("Backpack")
    for _, tool in pairs(backpack:GetDescendants()) do
        tool:Destroy()
    end
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "BlackScreenGui"
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    screenGui.ResetOnSpawn = false
    local blackFrame = Instance.new("Frame")
    blackFrame.Size = UDim2.new(1, 0, 1, 500)
    blackFrame.Position = UDim2.new(0, 0, 0, -475)
    blackFrame.BackgroundColor3 = Color3.new(0, 0, 0)
    blackFrame.BorderSizePixel = 0
    blackFrame.BackgroundTransparency = 0.2
    blackFrame.ZIndex = 11
    blackFrame.Parent = screenGui
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Text = "CRYPTIC'S SCRIPTS"
    titleLabel.Font = Enum.Font.Fantasy
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.TextScaled = true
    titleLabel.Size = UDim2.new(0.5, 0, 0.25)
    titleLabel.Position = UDim2.new(0.25, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.ZIndex = 11
    titleLabel.Parent = screenGui
    timeLabel.Font = Enum.Font.Fantasy
    timeLabel.TextColor3 = Color3.new(1, 1, 1)
    timeLabel.TextScaled = true
    timeLabel.Size = UDim2.new(0.1, 0, 0.0625) -- 1/4th size
    timeLabel.Position = UDim2.new(0.15, 0, 0.25)
    timeLabel.BackgroundTransparency = 1
    timeLabel.ZIndex = 11
    timeLabel.Parent = screenGui
    gptmLabel.Font = Enum.Font.Fantasy
    gptmLabel.TextColor3 = Color3.new(1, 1, 1)
    gptmLabel.TextScaled = true
    gptmLabel.Size = UDim2.new(0.1, 0, 0.0625) -- 1/4th size
    gptmLabel.Position = UDim2.new(0.25, 0, 0.25)
    gptmLabel.BackgroundTransparency = 1
    gptmLabel.ZIndex = 11
    gptmLabel.Parent = screenGui
    starterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
    spawn(function()
        while task.wait() do
            updateTimer()
            updateAverageGPTM()
            hideguis()
        end
    end)
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
        TweenInfo.new(0.25, Enum.EasingStyle.Linear),
        { CFrame = CFrame.new(-51.741737365722656, 46.0748176574707, 750.60386657714844) }
    )
    local tween2 = TweenService:Create(
        humanoidroot,
        TweenInfo.new(20, Enum.EasingStyle.Linear),
        { CFrame = CFrame.new(-51.741737365722656, 46.0748176574707, 8723.8603515625) }
    )
    local tween3 = TweenService:Create(
        humanoidroot,
        TweenInfo.new(0.25, Enum.EasingStyle.Linear),
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

player.CharacterAdded:Connect(function(character)
    workspace:WaitForChild("ClaimRiverResultsGold"):FireServer()
    setupCharacter(character)
    wait(2)
    startTweens()
end)

local head = character:FindFirstChild("Head")
if head then
    head:Destroy()
    preparescreen()
    local gs = game:GetService 'GuiService'
    local reconnectDisabledList = {
        [Enum.ConnectionError.DisconnectLuaKick] = false,
        [Enum.ConnectionError.DisconnectSecurityKeyMismatch] = false,
        [Enum.ConnectionError.DisconnectNewSecurityKeyMismatch] = false,
        [Enum.ConnectionError.DisconnectDuplicateTicket] = false,
        [Enum.ConnectionError.DisconnectWrongVersion] = false,
        [Enum.ConnectionError.DisconnectProtocolMismatch] = false,
        [Enum.ConnectionError.DisconnectBadhash] = false,
        [Enum.ConnectionError.DisconnectIllegalTeleport] = false,
        [Enum.ConnectionError.DisconnectDuplicatePlayer] = false,
        [Enum.ConnectionError.DisconnectCloudEditKick] = false,
        [Enum.ConnectionError.DisconnectOnRemoteSysStats] = false,
        [Enum.ConnectionError.DisconnectRaknetErrors] = false,
        [Enum.ConnectionError.PlacelaunchFlooded] = false,
        [Enum.ConnectionError.PlacelaunchHashException] = false,
        [Enum.ConnectionError.PlacelaunchHashExpired] = false,
        [Enum.ConnectionError.PlacelaunchUnauthorized] = false,
        [Enum.ConnectionError.PlacelaunchUserLeft] = false,
        [Enum.ConnectionError.PlacelaunchRestricted] = false,
    }

    gs.ErrorMessageChanged:connect(
        function()
            local error_code = gs:GetErrorCode()
            local error_type = gs:GetErrorType()
            if error_type == Enum.ConnectionError.DisconnectErrors and not reconnectDisabledList[error_code] then
                local teleportScript = string.format([[
                    getgenv().startTime = %s
                    repeat task.wait() until game:IsLoaded()
                    loadstring(game:HttpGet('https://raw.githubusercontent.com/MysticCr1/RobloxScripts/refs/heads/scripts/BABFTGOLD.lua'))()
            ]], startTime)
                queue_on_teleport(teleportScript)
                print('Disconnect registered!')
                while task.wait(1) do
                    game:GetService 'TeleportService':TeleportToPlaceInstance(
                        game.PlaceId, game.JobId)
                end
            end
        end)
else
    warn("Head not found in the character.")
end
