local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = game.Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local player = Players.LocalPlayer
local playerGui = player.PlayerGui
local hotbar = playerGui:FindFirstChild("Hotbar")
local backpack = hotbar:FindFirstChild("Backpack")
local hotbarFrame = backpack:FindFirstChild("Hotbar")
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")
local screengui = playerGui:FindFirstChild("ScreenGui")
local ultbar = screengui:FindFirstChild("MagicHealth")
local ultcolor = ultbar:FindFirstChild("Health")
local ulttext = ultbar:FindFirstChild("TextLabel")
LocalPlayer.PlayerGui.ScreenGui:WaitForChild("MagicHealth").Health.Bar.Bar.ImageColor3 = Color3.fromRGB(0,0,255)
local baseButton = hotbarFrame:FindFirstChild("1").Base
local ToolName = baseButton.ToolName
ToolName.Text = "Reversal Red"
local baseButton = hotbarFrame:FindFirstChild("2").Base
local ToolName = baseButton.ToolName
ToolName.Text = "Barrage"
local baseButton = hotbarFrame:FindFirstChild("3").Base
local ToolName = baseButton.ToolName
ToolName.Text = "Repulsion"
local baseButton = hotbarFrame:FindFirstChild("4").Base
local ToolName = baseButton.ToolName
ToolName.Text = "Strongest Toss"
local TpTool = Instance.new("Tool")
local players = game:GetService("Players")
local player = players.LocalPlayer
local backpack = player:WaitForChild("Backpack")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local function moveswap()
    local baseButton = hotbarFrame:FindFirstChild("1").Base
    local ToolName = baseButton.ToolName
    ToolName.Text = "Reversal Red"
    local baseButton = hotbarFrame:FindFirstChild("2").Base
    local ToolName = baseButton.ToolName
    ToolName.Text = "Barrage"
    local baseButton = hotbarFrame:FindFirstChild("3").Base
    local ToolName = baseButton.ToolName
    ToolName.Text = "Repulsion"
    local baseButton = hotbarFrame:FindFirstChild("4").Base
    local ToolName = baseButton.ToolName
    ToolName.Text = "Strongest Toss"
end
-- Function to create a sphere visible from the inside
local function createBall()
    local ball = Instance.new("Part")
    ball.Shape = Enum.PartType.Ball
    ball.Size = Vector3.new(200, 200, 200) -- Adjust the size as needed
    ball.Anchored = true
    ball.CanCollide = true
    ball.Material = Enum.Material.Neon -- This makes it look visible from the inside

    -- Set the position in front of the user
    local offset = humanoidRootPart.CFrame.LookVector * 250 -- Adjust distance as needed
    ball.CFrame = humanoidRootPart.CFrame + offset

    ball.Parent = workspace
    wait(24)
    -- Add cracking effect and shatter the sphere
    task.delay(0.1, function()
        for i = 1, 10 do
            task.wait(0.2)
            ball.Material = Enum.Material.Glass
            ball.Transparency = 0.5 + (i * 0.05) -- Increase transparency

            -- Create small cracks
            local crack = Instance.new("Decal")
            crack.Texture = "rbxassetid://123456789" -- Replace with actual crack texture ID
            crack.Face = Enum.NormalId.Front
            crack.Parent = ball
        end

        -- Shatter the sphere
        for _ = 1, 10 do
            local shard = Instance.new("Part")
            shard.Size = Vector3.new(2, 2, 2)
            shard.Shape = Enum.PartType.Ball
            shard.Material = Enum.Material.Glass
            shard.CFrame = ball.CFrame + Vector3.new(math.random(-5, 5), math.random(-5, 5), math.random(-5, 5))
            shard.Velocity = Vector3.new(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
            shard.Anchored = false
            shard.CanCollide = false
            shard.Parent = workspace
            task.wait(0.1)
        end

        ball:Destroy() -- Remove the original ball
    end)
end

-- Create the teleportation tool
local tool = Instance.new("Tool")
tool.Name = "Limitless"
tool.RequiresHandle = false
tool.Parent = backpack

-- Function to teleport the player
local function teleportPlayer(mouse)
local character = player.Character
if character then
local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
if humanoidRootPart then
humanoidRootPart.CFrame = CFrame.new(mouse.Hit.p)
end
end
end

-- Equipping and teleport logic
tool.Equipped:Connect(function()
local mouse = player:GetMouse()

local function onMouseClick()
teleportPlayer(mouse)
local warp = "rbxassetid://12618271998"
local newAnim = Instance.new("Animation")
newAnim.AnimationId = warp
local f = humanoid:LoadAnimation(newAnim)
f:Play()
f:AdjustSpeed(1)
end

local clickConnection = mouse.Button1Down:Connect(onMouseClick)

tool.Unequipped:Connect(function()
clickConnection:Disconnect()
end)
end)

-- Create a Tool in StarterPack for toggling ESP
local tool = Instance.new("Tool")
tool.Name = "Six Eyes"
tool.RequiresHandle = false

-- ESP Enabled State
local ESPEnabled = false

-- Function to toggle ESP
local function toggleESP()
    ESPEnabled = not ESPEnabled
    print("ESP is now:", ESPEnabled)
    
    -- Logic to enable/disable ESP
    if ESPEnabled then
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local highlight = Instance.new("Highlight")
                highlight.Name = "ESPHighlight"
                highlight.Adornee = player.Character
                highlight.FillColor = Color3.new(1, 1, 1) -- White color
                highlight.FillTransparency = 0.5
                highlight.OutlineColor = Color3.new(0, 0, 1) -- Blue color
                highlight.OutlineTransparency = 0
                highlight.Parent = player.Character
            end
        end
        print("ESP Activated")
    else
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("ESPHighlight") then
                player.Character.ESPHighlight:Destroy()
            end
        end
        print("ESP Deactivated")
    end
end

-- Tool Activation Event
tool.Activated:Connect(toggleESP)

-- Parent the tool to StarterPack
local player = game.Players.LocalPlayer
if player then
    local backpack = player:WaitForChild("Backpack")
    tool.Parent = backpack
end

ulttext.Text = "Strongest Sorcerer"
-- Animation IDs
local awakening = "rbxassetid://12447707844"
local awakeningid = "rbxassetid://13497875049"

-- Function to detect and replace animation
local function onAnimationPlayed(animTrack)
if animTrack.Animation.AnimationId == awakening then
-- Stop the current animation
animTrack:Stop()

-- Play the replacement animation
local newAnim = Instance.new("Animation")
newAnim.AnimationId = awakeningid
local f = humanoid:LoadAnimation(newAnim)
f:Play()
f:AdjustSpeed(1)
wait(3)
local baseButton = hotbarFrame:FindFirstChild("1").Base
local ToolName = baseButton.ToolName
ToolName.Text = "Red Counter"
local baseButton = hotbarFrame:FindFirstChild("2").Base
local ToolName = baseButton.ToolName
ToolName.Text = "Hollow Purple"
local baseButton = hotbarFrame:FindFirstChild("3").Base
local ToolName = baseButton.ToolName
ToolName.Text = "Lapse Blue"
local baseButton = hotbarFrame:FindFirstChild("4").Base
local ToolName = baseButton.ToolName
ToolName.Text = "Domain expansion: Infinite Void"
end
end
humanoid.AnimationPlayed:Connect(onAnimationPlayed)

-- Animation IDs
local table = "rbxassetid://11365563255"
local tableid = "rbxassetid://13071982935"

-- Function to detect and replace animation
local function onAnimationPlayed(animTrack)
if animTrack.Animation.AnimationId == table then
-- Stop the current animation
animTrack:Stop()

-- Play the replacement animation
local newAnim = Instance.new("Animation")
newAnim.AnimationId = tableid
local f = humanoid:LoadAnimation(newAnim)
f:Play()
f:AdjustSpeed(0.59)
wait(0.5)
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Hollow Purple", "All")
wait(5)
moveswap()
end
end
-- Connect the function to the AnimationPlayed event
humanoid.AnimationPlayed:Connect(onAnimationPlayed)

local norm= "rbxassetid://10468665991"
local normid= "rbxassetid://13073745835"

-- Function to detect and replace animation
local function onAnimationPlayed(animTrack)
if animTrack.Animation.AnimationId == norm then
-- Stop the current animation
animTrack:Stop()

-- Play the replacement animation
local newAnim = Instance.new("Animation")
newAnim.AnimationId = normid
local f = humanoid:LoadAnimation(newAnim)
f:Play()
f:AdjustSpeed(1)
end
end

-- Connect the function to the AnimationPlayed event
humanoid.AnimationPlayed:Connect(onAnimationPlayed)

local cons= "rbxassetid://10466974800"
local consid= "rbxassetid://13560306510"

-- Function to detect and replace animation
local function onAnimationPlayed(animTrack)
if animTrack.Animation.AnimationId == cons then
-- Stop the current animation
animTrack:Stop()

-- Play the replacement animation
local newAnim = Instance.new("Animation")
newAnim.AnimationId = consid
local f = humanoid:LoadAnimation(newAnim)
f:Play()
f:AdjustSpeed(2.5)
end
end

-- Connect the function to the AnimationPlayed event
humanoid.AnimationPlayed:Connect(onAnimationPlayed)

local uppe= "rbxassetid://12510170988"
local uppeid= "rbxassetid://12618271998"

-- Function to detect and replace animation
local function onAnimationPlayed(animTrack)
if animTrack.Animation.AnimationId == uppe then
-- Stop the current animation
animTrack:Stop()

-- Play the replacement animation
local newAnim = Instance.new("Animation")
newAnim.AnimationId = uppeid
local f = humanoid:LoadAnimation(newAnim)
f:Play()
f:AdjustSpeed(0.9)
end
end

-- Connect the function to the AnimationPlayed event
humanoid.AnimationPlayed:Connect(onAnimationPlayed)

local shove= "rbxassetid://10471336737"
local shoveid= "rbxassetid://12509505723"

-- Function to detect and replace animation
local function onAnimationPlayed(animTrack)
if animTrack.Animation.AnimationId == shove then
-- Stop the current animation
animTrack:Stop()

-- Play the replacement animation
local newAnim = Instance.new("Animation")
newAnim.AnimationId = shoveid
local f = humanoid:LoadAnimation(newAnim)
f:Play()
f:AdjustSpeed(1)
end
end

-- Connect the function to the AnimationPlayed event
humanoid.AnimationPlayed:Connect(onAnimationPlayed)

local blue= "rbxassetid://12983333733"
local blueid= "rbxassetid://15121659862"

-- Function to detect and replace animation
local function onAnimationPlayed(animTrack)
if animTrack.Animation.AnimationId == blue then
-- Stop the current animation
animTrack:Stop()

-- Play the replacement animation
local newAnim = Instance.new("Animation")
newAnim.AnimationId = blueid
local f = humanoid:LoadAnimation(newAnim)
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Maximum: Blue", "All")
f:Play()
f:AdjustSpeed(1)
wait(3)
moveswap()
end
end

-- Connect the function to the AnimationPlayed event
humanoid.AnimationPlayed:Connect(onAnimationPlayed)

local red= "rbxassetid://11343318134"
local redid= "rbxassetid://13073745835"

-- Function to detect and replace animation
local function onAnimationPlayed(animTrack)
if animTrack.Animation.AnimationId == red then
-- Stop the current animation
animTrack:Stop()

-- Play the replacement animation
local newAnim = Instance.new("Animation")
newAnim.AnimationId = redid
local f = humanoid:LoadAnimation(newAnim)
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Maximum: Red", "All")
f:Play()
f:AdjustSpeed(0.08)
wait(3)
moveswap()
end
end

-- Connect the function to the AnimationPlayed event
humanoid.AnimationPlayed:Connect(onAnimationPlayed)

local odp= "rbxassetid://13927612951"
local odpid= "rbxassetid://18459183268"

-- Function to detect and replace animation
local function onAnimationPlayed(animTrack)
if animTrack.Animation.AnimationId == odp then
-- Stop the current animation
animTrack:Stop()

-- Play the replacement animation
local newAnim = Instance.new("Animation")
newAnim.AnimationId = odpid
local f = humanoid:LoadAnimation(newAnim)
f:Play()
f:AdjustSpeed(0.75)
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Yoiki tenkai..", "All")
createBall()
wait(19)
moveswap()
end
end

-- Connect the function to the AnimationPlayed event
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
