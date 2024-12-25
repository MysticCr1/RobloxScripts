local Players = game:GetService("Players")
function Chat(MSG)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(MSG, "All")
end
local player = game.Players.LocalPlayer
local rightArm = player.Character["Right Arm"]
local lleg = player.Character["Left Leg"]
local c3 = Color3.fromHex("0000ff")
function Fistvfx()
    local effect = game.ReplicatedStorage.Resources.FiveSeasonsFX["CharFX"].ArmFX:Clone()
    effect.Parent = rightArm
    effect.Name = "DIEVFX"
    effect.Rotation = Vector3.new(180, 0, -180)
    for _, child in ipairs(effect:GetChildren()) do
        if child:IsA("ParticleEmitter") then
            child.Color = ColorSequence.new(c3)
            child:Emit(1)
        end
    end
end

local character = player.Character or player.CharacterAdded:Wait()
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local playerGui = player.PlayerGui
local hotbar = playerGui:FindFirstChild("Hotbar")
local backpack = hotbar:FindFirstChild("Backpack")
local hotbarFrame = backpack:FindFirstChild("Hotbar")
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")
local screengui = playerGui:FindFirstChild("ScreenGui")
local ultbar = screengui:FindFirstChild("MagicHealth")
local ultcolor = ultbar:FindFirstChild("Health")
local ulttext = ultbar:FindFirstChild("TextLabel")
ulttext.Text = "WEAK."
ultcolor.Bar.Bar.ImageColor3 = Color3.fromRGB(103, 166, 255)
local baseButton = hotbarFrame:FindFirstChild("1").Base
local ToolName = baseButton.ToolName
ToolName.Text = "JUDGEMENT!"
local baseButton = hotbarFrame:FindFirstChild("2").Base
local ToolName = baseButton.ToolName
ToolName.Text = "Die!"
local baseButton = hotbarFrame:FindFirstChild("3").Base
local ToolName = baseButton.ToolName
ToolName.Text = ""
local baseButton = hotbarFrame:FindFirstChild("4").Base
local ToolName = baseButton.ToolName
ToolName.Text = ""
local numberOfSpirals = 7
local radius = 20
local height = 190
local duration = 1.1
local steps = 200
local angleStep = (math.pi * 2 * numberOfSpirals) / steps
local radiusStep = radius / steps
local timeStep = duration / steps
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
local leth = "rbxassetid://12296113986"
local flow = "rbxassetid://12272894215"
local function getNearestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, otherPlayer in pairs(Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character then
            if otherPlayer.Name == "Weakest Dummy" or otherPlayer.Name == "Marquardt36765" then
                return
            end
            local otherRootPart = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
            if otherRootPart then
                local distance = (rootPart.Position - otherRootPart.Position).Magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestPlayer = otherPlayer
                end
            end
        end
    end
    return closestPlayer
end
local function onAnimationPlayed(animTrack)
    if animTrack.Animation.AnimationId == flow then
        animTrack:Stop()
        local newAnim = Instance.new("Animation")
        local vl = Instance.new("Sound", workspace)
        vl.SoundId = "rbxassetid://18553892205"
        vl.Volume = 0.5
        vl:Play()
        newAnim.AnimationId = "rbxassetid://13927612951"
        local f = humanoid:LoadAnimation(newAnim)
        f:Play()
        f:AdjustSpeed(2.5)
        for i = 1, 25 do
            wait(0)
            local targetp = getNearestPlayer()
            local targetRootPart = targetp.Character:FindFirstChild("HumanoidRootPart")
            player.Character.HumanoidRootPart.CFrame = targetp.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
            if targetRootPart then
                local targetPosition = Vector3.new(
                    targetRootPart.Position.X,
                    rootPart.Position.Y,
                    targetRootPart.Position.Z
                )
                local targetCFrame = CFrame.new(rootPart.Position, targetPosition)
                rootPart.CFrame = rootPart.CFrame:Lerp(targetCFrame, 1)
            end
        end
    end
end
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
local function onAnimationPlayed(animTrack)
    if animTrack.Animation.AnimationId == leth then
        Fistvfx()
        local centerOffset = rootPart.Position
        for i = 0, steps do
            task.wait(timeStep)
            local angle = i * angleStep
            local currentRadius = radius - i * radiusStep
            local x = math.cos(angle) * currentRadius + centerOffset.X
            local z = math.sin(angle) * currentRadius + centerOffset.Z
            local y = (i / steps) * height + centerOffset.Y

            local targetPosition = Vector3.new(x, y, z)
            rootPart.CFrame = CFrame.new(targetPosition)
        end
        local vl = Instance.new("Sound", workspace)
        vl.SoundId = "rbxassetid://18553878118"
        vl.Volume = 0.5
        vl:Play()
        rootPart.CFrame = CFrame.new(centerOffset)
        Chat("Die!")
        rightArm.DIEVFX:Destroy()
        wait(0.5)
        for i = 0, 20 do
            local ring = game:GetService("ReplicatedStorage").Resources.StoicBomb["stoic bomb boom entrance"].Attachment
            :Clone()
            ring.Parent = lleg
            ring.Rotation = Vector3.new(180, 0, -180)
            for _, child in ipairs(ring:GetChildren()) do
                if child:IsA("ParticleEmitter") then
                    child:Emit(1)
                end
            end
        end
    end
end
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
game.StarterGui:SetCore("SendNotification", {
    Title = "By OperationCryptic",
    Text = "MINOS PRIME SCRIPT",
    Icon = "rbxassetid://111229342765121",
    Duration = 15,
})
