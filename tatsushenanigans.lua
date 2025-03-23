local Players = game:GetService("Players")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local hrp = character:WaitForChild("HumanoidRootPart")
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
local baseButton = hotbarFrame:FindFirstChild("1").Base
local m1 = baseButton.ToolName
local baseButton = hotbarFrame:FindFirstChild("2").Base
local m2 = baseButton.ToolName
local baseButton = hotbarFrame:FindFirstChild("3").Base
local m3 = baseButton.ToolName
local baseButton = hotbarFrame:FindFirstChild("4").Base
local m4 = baseButton.ToolName

local isToggled = false
local flip = false

local posTable = {
    originalPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
}
function Pausecamera()
    local previousCFrame = camera.CFrame
    camera.CameraType = Enum.CameraType.Scriptable
    camera.CFrame = previousCFrame
end
function UnPausecamera()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        camera.CameraType = Enum.CameraType.Custom
        camera.CameraSubject = player.Character.Humanoid
    end
end

--names

local function subtitle(move, text)
    game.Players.LocalPlayer.PlayerGui:FindFirstChild("Hotbar"):FindFirstChild("Backpack"):FindFirstChild("Hotbar"):FindFirstChild(move).Base.Reuse.Text = text
    game.Players.LocalPlayer.PlayerGui:FindFirstChild("Hotbar"):FindFirstChild("Backpack"):FindFirstChild("Hotbar"):FindFirstChild(move).Base.Reuse.Reuse.Text = text
    game.Players.LocalPlayer.PlayerGui:FindFirstChild("Hotbar"):FindFirstChild("Backpack"):FindFirstChild("Hotbar"):FindFirstChild(move).Base.Reuse.Visible = true   
end
local function title(move, text)
    game.Players.LocalPlayer.PlayerGui:FindFirstChild("Hotbar"):FindFirstChild("Backpack"):FindFirstChild("Hotbar"):FindFirstChild(move).Base.ToolName.Text = text
end
task.spawn(function()
    local hasdied = false
    repeat
        wait()
        if humanoid.Health == 0 then
            hasdied = true
        end
        if not isToggled then
            if m1.Text == "Crushing Pull" then
                title("1", "Soul Grab")
            end
            if m2.Text == "Windstorm Fury" then
                title("2", "W.I.P")
            end
            if m3.Text == "Stone Coffin" then
                title("3", "Showstopper")
            end
            if m4.Text == "Expulsive Push" then
                title("4", "W.I.P")
            end
        end
    until hasdied
end)
task.spawn(function()
    local hasdied = false
    repeat
        wait()
        if humanoid.Health == 0 then
            hasdied = true
        end
        if not isToggled then
            if m1.Text == "Soul Grab" then
                subtitle("1", "Instakill")
            end
            if m2.Text == "W.I.P" then
                subtitle("2", "Stun (Janky)")
            end
            if m3.Text == "Showstopper" then
                subtitle("3", "USD (Broken)")
            end
            if m4.Text == "W.I.P" then
                subtitle("4", "Normal")
            end
        end
        if isToggled then
            if m1.Text == "Soul Grab" then
                subtitle("1", "Jail")
            end
            if m2.Text == "W.I.P" then
                subtitle("2", "Stun (Janky)")
            end
            if m3.Text == "Showstopper" then
                subtitle("3", "USD (Broken)")
            end
            if m4.Text == "W.I.P" then
                subtitle("4", "Normal")
            end
        end
    until hasdied
end)
local ultshit = game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenGui"):FindFirstChild("MagicHealth"):FindFirstChild("TextLabel")
ultshit.Text = "W.I.P"
ultshit.TextLabel.Text = "W.I.P"

-- moves

local function onAnimationPlayed(animTrack)
    if animTrack.Animation.AnimationId == "rbxassetid://16139108718" then
        if not isToggled then
            posTable.originalPos = hrp.Position
            Pausecamera()
            wait(0.3)
            hrp.CFrame = hrp.CFrame * CFrame.new(0, -750, 0)
            wait(0.7)
            UnPausecamera()
            hrp.CFrame = CFrame.new(posTable.originalPos)
        end
        if isToggled then
            posTable.originalPos = hrp.Position
            Pausecamera()
            wait(0.3)
            hrp.CFrame = CFrame.new(438.7888488769531, 439.51055908203125, -376.19354248046875)
            wait(0.8)
            UnPausecamera()
            hrp.CFrame = CFrame.new(posTable.originalPos)
        end
    end
end
game.Players.LocalPlayer.Character.Humanoid.AnimationPlayed:Connect(onAnimationPlayed)
local function onAnimationPlayed(animTrack)
    if animTrack.Animation.AnimationId == "rbxassetid://16515850153" then
        task.spawn(function()
            flip = true
            wait(0.5)
            flip = false
        end)
        repeat
            wait()
            character.HumanoidRootPart.CFrame = CFrame.new(character.HumanoidRootPart.Position) + Vector3.new(0,-2,0)
            character.HumanoidRootPart.CFrame = CFrame.new(character.HumanoidRootPart.Position) * CFrame.Angles(math.rad(-90), 0, 0)
        until not flip
    end
end
game.Players.LocalPlayer.Character.Humanoid.AnimationPlayed:Connect(onAnimationPlayed)

local function onAnimationPlayed(animTrack)
    if animTrack.Animation.AnimationId == "rbxassetid://16571461202" then
        Pausecamera()
        wait(0.3)
        hrp.CFrame = CFrame.new(438.7888488769531, 439.51055908203125, -376.19354248046875)
        wait(0.7)
        UnPausecamera()
        hrp.CFrame = CFrame.new(posTable.originalPos)
    end
end
game.Players.LocalPlayer.Character.Humanoid.AnimationPlayed:Connect(onAnimationPlayed)

local function onAnimationPlayed(animTrack)
    if animTrack.Animation.AnimationId == "rbxassetid://16431491215" then
        task.spawn(function()
            flip = true
            wait(0.5)
            flip = false
        end)
        repeat
            wait()
            local hrp = character.HumanoidRootPart
            local currentCFrame = hrp.CFrame
            local lookDirection = hrp.CFrame.LookVector
            hrp.CFrame = CFrame.new(currentCFrame.Position) * CFrame.Angles(math.pi, 0, 0)
            hrp.CFrame = CFrame.lookAt(hrp.Position, hrp.Position + lookDirection)
        until not flip
    end
end

game.Players.LocalPlayer.Character.Humanoid.AnimationPlayed:Connect(onAnimationPlayed)

-- Toggles

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local textLabel = Instance.new("TextLabel")
textLabel.Parent = screenGui
textLabel.Size = UDim2.new(0, 50, 0, 50)
textLabel.Position = UDim2.new(0, 10, 1, -10)
textLabel.AnchorPoint = Vector2.new(0, 1)
textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.new(0,0,0)
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
    end
end
game:GetService("UserInputService").InputBegan:Connect(toggleVariable)
