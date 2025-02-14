local Players = game:GetService("Players")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")
local playerGui = player.PlayerGui
local hotbar = playerGui:FindFirstChild("Hotbar")
local backpack = hotbar:FindFirstChild("Backpack")
local hotbarFrame = backpack:FindFirstChild("Hotbar")
local screengui = playerGui:FindFirstChild("ScreenGui")
local ultbar = screengui:FindFirstChild("MagicHealth")
local ultcolor = ultbar:FindFirstChild("Health")
local ulttext = ultbar:FindFirstChild("TextLabel")
local Players = game:GetService("Players")
local camera = workspace.CurrentCamera
function Pausecamera()
    local previousCFrame = camera.CFrame
    camera.CameraType = Enum.CameraType.Scriptable
    camera.CFrame = previousCFrame
end

local c3 = Color3.fromHex("ff0074")
local LocalPlayer = Players.LocalPlayer
LocalPlayer.PlayerGui.ScreenGui:WaitForChild("MagicHealth").Health.Bar.Bar.ImageColor3 = c3
LocalPlayer.PlayerGui.Hotbar:WaitForChild("Backpack").LocalScript.Cooldown.BackgroundColor3 = c3
local player = game.Players.LocalPlayer
local connections = {}
local isToggled = false
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local textLabel = Instance.new("TextLabel")
textLabel.Parent = screenGui
textLabel.Size = UDim2.new(0, 50, 0, 50)
textLabel.Position = UDim2.new(0, 10, 1, -10)
textLabel.AnchorPoint = Vector2.new(0, 1)
textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
textLabel.BackgroundTransparency = 0.5
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextSize = 36
textLabel.Text = "1"
local function toggleVariable(input)
    if game:GetService("UserInputService"):GetFocusedTextBox() then
        return
    end

    if input.KeyCode == Enum.KeyCode.T then
        isToggled = not isToggled
        textLabel.Text = isToggled and "2" or "1"
        if isToggled then
            local baseButton = hotbarFrame:FindFirstChild("1").Base
            local ToolName = baseButton.ToolName
            ToolName.Text = "Void"
            local baseButton = hotbarFrame:FindFirstChild("2").Base
            local ToolName = baseButton.ToolName
            ToolName.Text = "Distortion"
            local baseButton = hotbarFrame:FindFirstChild("3").Base
            local ToolName = baseButton.ToolName
            ToolName.Text = "Swap"
            local baseButton = hotbarFrame:FindFirstChild("4").Base
            local ToolName = baseButton.ToolName
            ToolName.Text = "Griddy"
        else
            local baseButton = hotbarFrame:FindFirstChild("1").Base
            local ToolName = baseButton.ToolName
            ToolName.Text = "Banish"
            local baseButton = hotbarFrame:FindFirstChild("2").Base
            local ToolName = baseButton.ToolName
            ToolName.Text = "Smash"
            local baseButton = hotbarFrame:FindFirstChild("3").Base
            local ToolName = baseButton.ToolName
            ToolName.Text = "Swap"
            local baseButton = hotbarFrame:FindFirstChild("4").Base
            local ToolName = baseButton.ToolName
            ToolName.Text = "Griddy"
        end
    end
end
game:GetService("UserInputService").InputBegan:Connect(toggleVariable)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local function hawk_tuah(pe)
    if pe:IsA("ParticleEmitter") or pe:IsA("Trail") then
        pe.Color = ColorSequence.new(c3)
        if not pe.LightEmission then
            pe.LightEmission = 1
        end
    elseif pe:IsA("Decal") then
        pe.Color3 = Color3.new(c3.R, c3.G, c3.B)
    elseif pe:IsA("Light") then
        pe.Color = c3
    end
end
local function rizz(char)
    local weapons = {
        "#KATANAWEAPON",
        "#NinjaKATANA",
        "#BATWEAPON"
    }
    for _, weaponName in ipairs(weapons) do
        local weapon = char:FindFirstChild(weaponName)
        if weapon then
            for _, pe in weapon:GetDescendants() do
                hawk_tuah(pe)
            end
            table.insert(connections, weapon.DescendantAdded:Connect(hawk_tuah))
        end
    end
    for _, pe in char:GetDescendants() do
        hawk_tuah(pe)
    end
    table.insert(connections, char.DescendantAdded:Connect(hawk_tuah))
end
local function recolor(player)
    if player:IsA("Model") then
        rizz(player)
    else
        rizz(player.Character or player.CharacterAdded:Wait())
        table.insert(connections, player.CharacterAdded:Connect(rizz))
    end
end
local rightArm = player.Character["Right Arm"]
local leftArm = player.Character["Left Arm"]
function Fistvfxr(color)
    local effect = game.ReplicatedStorage.Resources.FiveSeasonsFX["CharFX"].ArmFX:Clone()
    effect.Parent = rightArm
    effect.Name = "DIEVFXR"
    effect.Rotation = Vector3.new(180, 0, -180)
    for _, child in ipairs(effect:GetChildren()) do
        if child:IsA("ParticleEmitter") then
            child.Color = ColorSequence.new(color)
            child:Emit(1)
        end
    end
end

function Fistvfxl(color)
    local effect = game.ReplicatedStorage.Resources.FiveSeasonsFX["CharFX"].ArmFX:Clone()
    effect.Parent = leftArm
    effect.Name = "DIEVFXL"
    effect.Rotation = Vector3.new(180, 0, -180)
    for _, child in ipairs(effect:GetChildren()) do
        if child:IsA("ParticleEmitter") then
            child.Color = ColorSequence.new(color)
            child:Emit(1)
        end
    end
end

recolor(player)
local baseButton = hotbarFrame:FindFirstChild("1").Base
local ToolName = baseButton.ToolName
ToolName.Text = "Banish"
local baseButton = hotbarFrame:FindFirstChild("2").Base
local ToolName = baseButton.ToolName
ToolName.Text = "Smash"
local baseButton = hotbarFrame:FindFirstChild("3").Base
local ToolName = baseButton.ToolName
ToolName.Text = "Swap"
local baseButton = hotbarFrame:FindFirstChild("4").Base
local ToolName = baseButton.ToolName
ToolName.Text = "Griddy"

ulttext.Text = "Dimension Walker"
local posTable = {
    originalPos = rootPart.Position,                                            -- Store original position
    warpPos = Vector3.new(-67.25288391113281, 29.253990173339844, 20332.546875) -- Define destination position (adjust to your liking)
}
local toggleState = false
local function toggleTeleport()
    if toggleState then
        rootPart.CFrame = CFrame.new(posTable.originalPos)
        toggleState = false
    else
        posTable.originalPos = rootPart.Position
        rootPart.CFrame = CFrame.new(posTable.warpPos)
        toggleState = true
    end
end
local flowing = "rbxassetid://12273188754"
local lethal = "rbxassetid://12296113986"
local hunters = "rbxassetid://12307656616"
local prey = "rbxassetid://13603396939"
local taunt = "rbxassetid://13715326691"
local ult = "rbxassetid://12342141464"
local ultid = "rbxassetid://16734584478"
local tp1 = Vector3.new(-67.25288391113281, 29.253990173339844, 20332.546875)
local tp2 = Vector3.new(186.7188720703125, 1210.46263122558594, 69.70562744140625)
wait(1)
local function onAnimationPlayed(animTrack)
    if animTrack.Animation.AnimationId == flowing then
        if isToggled == false then
            if toggleState == false then
                rootPart.Anchored = true
                wait(1.3)
                rootPart.Anchored = false
                Pausecamera()
                local originalPosition = rootPart.Position
                rootPart.CFrame = CFrame.new(tp1)
                wait(0.5)
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    camera.CameraType = Enum.CameraType.Custom
                    camera.CameraSubject = player.Character.Humanoid
                end
                rootPart.CFrame = CFrame.new(originalPosition)
            else
                rootPart.Anchored = true
                wait(1.3)
                rootPart.Anchored = false
                Pausecamera()
                local originalPosition = rootPart.Position
                rootPart.CFrame = CFrame.new(posTable.originalPos)
                wait(0.5)
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    camera.CameraType = Enum.CameraType.Custom
                    camera.CameraSubject = player.Character.Humanoid
                end
                rootPart.CFrame = CFrame.new(originalPosition)
            end
        elseif isToggled == true then
            local color = Color3.fromRGB(255, 255, 255)
            rootPart.Anchored = true
            Fistvfxl(color)
            Fistvfxr(color)
            local originalPosition = rootPart.Position
            wait(1.5)
            rootPart.Anchored = false
            Pausecamera()
            local positionAbove = CFrame.new(rootPart.Position + Vector3.new(0, -190, 0))
            rootPart.CFrame = positionAbove
            wait(0.5)
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                camera.CameraType = Enum.CameraType.Custom
                camera.CameraSubject = player.Character.Humanoid
            end
            leftArm.DIEVFXL:Destroy()
            rightArm.DIEVFXR:Destroy()
            rootPart.CFrame = CFrame.new(originalPosition)
        end
    end
end
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
local function onAnimationPlayed(animTrack)
    if animTrack.Animation.AnimationId == lethal then
        if isToggled == false then
            rootPart.Anchored = true
            wait(1.3)
            rootPart.Anchored = false
            Pausecamera()
            local originalPosition = rootPart.Position
            rootPart.CFrame = CFrame.new(rootPart.Position + Vector3.new(0, 450, 0))
            wait(0.5)
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                camera.CameraType = Enum.CameraType.Custom
                camera.CameraSubject = player.Character.Humanoid
            end
            rootPart.CFrame = CFrame.new(originalPosition)
        elseif isToggled == true then
            rootPart.Anchored = true
            wait(1.3)
            rootPart.Anchored = false
            Pausecamera()
            local originalPosition = rootPart.Position
            rootPart.CFrame = CFrame.new(tp2)
            wait(0.5)
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                camera.CameraType = Enum.CameraType.Custom
                camera.CameraSubject = player.Character.Humanoid
            end
            rootPart.CFrame = CFrame.new(originalPosition)
        end
    end
end
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
local function onAnimationPlayed(animTrack)
    if animTrack.Animation.AnimationId == hunters then
        toggleTeleport()
    end
end
humanoid.AnimationPlayed:Connect(onAnimationPlayed)

local function onAnimationPlayed(animTrack)
    if animTrack.Animation.AnimationId == prey then
        -- Stop the current animation
        animTrack:Stop()

        -- Play the replacement animation
        local newAnim = Instance.new("Animation")
        newAnim.AnimationId = taunt
        local f = humanoid:LoadAnimation(newAnim)
        f:Play()
        f:AdjustSpeed(2.5)
    end
end
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
local function onAnimationPlayed(animTrack)
    if animTrack.Animation.AnimationId == ult then
        -- Stop the current animation
        animTrack:Stop()

        -- Play the replacement animation
        local newAnim = Instance.new("Animation")
        newAnim.AnimationId = ultid
        local f = humanoid:LoadAnimation(newAnim)
        f:Play()
        f:AdjustSpeed(1.1)
    end
end
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
