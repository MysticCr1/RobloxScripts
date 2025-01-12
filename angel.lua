if game.workspace:FindFirstChild("ANGELPART") then
    return
end
local player = game.Players.LocalPlayer
local Players = game:GetService("Players")
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")
local playerGui = player.PlayerGui
local hotbar = playerGui:FindFirstChild("Hotbar")
local backpack = hotbar:FindFirstChild("Backpack")
local hotbarFrame = backpack:FindFirstChild("Hotbar")
local screengui = playerGui:FindFirstChild("ScreenGui")
local ultbar = screengui:FindFirstChild("MagicHealth")
local run = game:GetService("RunService")
local ulttext = ultbar:FindFirstChild("TextLabel")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- Configuration
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local timestopDuration = 3   -- How long the effect lasts
local distortIntensity = 0.2 -- Intensity of distortion

-- Function to distort objects
local function distortObjects()
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") and not part:IsDescendantOf(character) then
            local originalSize = part.Size
            local originalColor = part.Color
            local distortTween = TweenService:Create(
                part,
                TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
                {
                    Size = originalSize * Vector3.new(1 + distortIntensity, 1 + distortIntensity, 1 + distortIntensity),
                    Color = Color3.new(math.random(), math.random(), math.random())
                }
            )
            distortTween:Play()

            -- Stop distortion after timestopDuration
            task.delay(timestopDuration, function()
                distortTween:Cancel()
                part.Size = originalSize
                part.Color = originalColor
            end)
        end
    end
end

-- Function to apply color shift effect
local function applyColorShift()
    local lighting = game:GetService("Lighting")
    local colorCorrection = Instance.new("ColorCorrectionEffect")
    local blur = Instance.new("BlurEffect")

    colorCorrection.Parent = lighting
    blur.Parent = lighting
    blur.Size = 10
    colorCorrection.Saturation = 2
    colorCorrection.Contrast = 0.5

    task.delay(timestopDuration, function()
        blur:Destroy()
        colorCorrection:Destroy()
    end)
end

-- Main Timestop Effect
local function timestop()
    distortObjects()
    applyColorShift()

    -- Freeze parts visually (Optional)
    RunService:BindToRenderStep("FreezeObjects", Enum.RenderPriority.Camera.Value, function()
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") and not part:IsDescendantOf(character) then
                part.Velocity = Vector3.zero
                part.RotVelocity = Vector3.zero
            end
        end
    end)

    -- Remove the effect after the duration
    task.delay(timestopDuration, function()
        RunService:UnbindFromRenderStep("FreezeObjects")
    end)
end
-- Ensure exploit supports getgenv and Instance.new
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Function to create a part
local function createPart(size, color, positionOffset)
    local part = Instance.new("Part")
    part.Size = size
    part.Name = "CROSS"
    part.Color = color
    part.Anchored = true -- Anchor the part to manually control its position
    part.CanCollide = false
    part.Massless = true
    part.Parent = workspace

    -- Keep updating the part's position relative to the hand
    game:GetService("RunService").RenderStepped:Connect(function()
        local body=player.Character:WaitForChild("Right Arm")
        if body then
            part.CFrame = body.CFrame * CFrame.new(positionOffset)
            part.Position = body.Position
            part.Rotation = body.Rotation
        end
    end)

    return part
end

-- Function to summon the cross
function CROSSS()
    createPart(Vector3.new(2, 0.5, 0.5), Color3.new(1, 1, 1), Vector3.new(0, 0.3, 0)) -- Horizontal part
    createPart(Vector3.new(0.5, 2, 0.5), Color3.new(1, 1, 1), Vector3.new(0, 0, 0))   -- Vertical part
end

function MOVETITLES(run, hotbarFrame)
    local baseButton = hotbarFrame:FindFirstChild("1").Base
    local Tool1Name = baseButton.ToolName
    local baseButton = hotbarFrame:FindFirstChild("2").Base
    local Tool2Name = baseButton.ToolName
    local baseButton = hotbarFrame:FindFirstChild("3").Base
    local Tool3Name = baseButton.ToolName
    local baseButton = hotbarFrame:FindFirstChild("4").Base
    local Tool4Name = baseButton.ToolName
    print(Tool4Name.Text)
    print(Tool3Name.Text)
    print(Tool2Name.Text)
    print(Tool1Name.Text)
    run.RenderStepped:Connect(function()
        if Tool1Name.Text == "Normal Punch" then
            Tool1Name.Text = "Angelic Push"
        end
        if Tool2Name.Text == "Consecutive Punches" then
            Tool2Name.Text = "Barrage"
        end
        if Tool3Name.Text == "Shove" then
            Tool3Name.Text = "Leg Swipe"
        end
        if Tool4Name.Text == "Uppercut" then
            Tool4Name.Text = "Repel"
        end
        if Tool1Name.Text == "Death Counter" then
            Tool1Name.Text = "Angelic Repellance"
        end
        if Tool2Name.Text == "Table Flip" then
            Tool2Name.Text = "Angelic Force"
        end
        if Tool3Name.Text == "Serious Punch" then
            Tool3Name.Text = "Holy Cross"
        end
        if Tool4Name.Text == "Omni Directional Punch" then
            Tool4Name.Text = "WIP"
        end
        if Tool1Name.Text == "Permafrost" then
            Tool1Name.Text = "Angelic Push"
        end
        if Tool2Name.Text == "Consecutive Punches" then
            Tool2Name.Text = "Barrage"
        end
        if Tool3Name.Text == "Shove" then
            Tool3Name.Text = "Leg Swipe"
        end
        if Tool4Name.Text == "Uppercut" then
            Tool4Name.Text = "Repel"
        end
    end)
end

player.PlayerGui.ScreenGui:WaitForChild("MagicHealth").Health.Bar.Bar.ImageColor3 = Color3.fromRGB(255, 255, 0)
player.PlayerGui.Hotbar:WaitForChild("Backpack").LocalScript.Cooldown.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
ulttext.Text = "ANGELIC POWER"
MOVETITLES(run, hotbarFrame)
local normal = "rbxassetid://10468665991"
local consid = "rbxassetid://78521642007560"
local consequ = "rbxassetid://10466974800"
local ravage = "rbxassetid://16945550029"
local shove = "rbxassetid://10471336737"
local swift = "rbxassetid://16944265635"
local uppercut = "rbxassetid://12510170988"
local collat = "rbxassetid://13073745835"
local ult = "rbxassetid://12447707844"
local ULTA = "rbxassetid://18459220516"
local dc = "rbxassetid://11343318134"
local Repellance = "rbxassetid://116153572280464"
local Repellancend = "rbxassetid://114095570398448"
local tf = "rbxassetid://12447707844"
local Force = "rbxassetid://18459220516"
local sp = "rbxassetid://12447707844"
local Cross = "rbxassetid://18459220516"
local function onAnimationPlayed(animTrack)
    if animTrack.Animation.AnimationId == normal then
        animTrack:Stop()
        local newAnim = Instance.new("Animation")
        newAnim.AnimationId = consid
        local f = humanoid:LoadAnimation(newAnim)
        f:Play()
        wait(0.7)
        local effect = game:GetService("ReplicatedStorage").Resources.KJEffects.ImpactEffect2["Attachment"]:Clone()
        effect.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        for _, child in ipairs(effect:GetChildren()) do
            if child:IsA("ParticleEmitter") then
                child.Color = ColorSequence.new(Color3.fromRGB(255, 255, 0))
                child:Emit(2)
            end
        end
        game.Players.LocalPlayer.Character.HumanoidRootPart:WaitForChild("effect"):Destroy()
    end
    if animTrack.Animation.AnimationId == consequ then
        animTrack:Stop()
        local newAnim = Instance.new("Animation")
        newAnim.AnimationId = ravage
        local f = humanoid:LoadAnimation(newAnim)
        f:Play()
        f:AdjustSpeed(1)
        f.TimePosition = 1.9
        wait(1.56)
        f:Stop()
    end
    if animTrack.Animation.AnimationId == shove then
        animTrack:Stop()
        local newAnim = Instance.new("Animation")
        newAnim.AnimationId = swift
        local f = humanoid:LoadAnimation(newAnim)
        f:Play()
        f:AdjustSpeed(1)
    end
    if animTrack.Animation.AnimationId == uppercut then
        animTrack:Stop()
        local newAnim = Instance.new("Animation")
        newAnim.AnimationId = collat
        local f = humanoid:LoadAnimation(newAnim)
        f:Play()
        f:AdjustSpeed(1)
    end
    if animTrack.Animation.AnimationId == ult then
        animTrack:Stop()
        settings().Network.IncomingReplicationLag = 1000
        timestop()
        local newAnim = Instance.new("Animation")
        newAnim.AnimationId = ULTA
        local f = humanoid:LoadAnimation(newAnim)
        f:Play()
        f:AdjustSpeed(1)
        wait(3)
        f:Stop()
        settings().Network.IncomingReplicationLag = 0
    end
    if animTrack.Animation.AnimationId == dc then
        animTrack:Stop()
        local newAnim = Instance.new("Animation")
        newAnim.AnimationId = Repellance
        local f = humanoid:LoadAnimation(newAnim)
        f:Play()
        f:AdjustSpeed(1)
        wait(10)
        f:Stop()
        local newAnim = Instance.new("Animation")
        newAnim.AnimationId = Repellancend
        local f = humanoid:LoadAnimation(newAnim)
        f:Play()
        f:AdjustSpeed(1)
    end
    if animTrack.Animation.AnimationId == tf then
        animTrack:Stop()
        local newAnim = Instance.new("Animation")
        newAnim.AnimationId = Force
        local f = humanoid:LoadAnimation(newAnim)
        f:Play()
        f:AdjustSpeed(1)
    end
    if animTrack.Animation.AnimationId == sp then
        animTrack:Stop()
        local newAnim = Instance.new("Animation")
        newAnim.AnimationId = Cross
        local f = humanoid:LoadAnimation(newAnim)
        f:Play()
        f:AdjustSpeed(1)
    end
end
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
