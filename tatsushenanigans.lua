local camera = workspace.CurrentCamera
local player = game.Players.LocalPlayer
local char = player.Character
local hrp = char.HumanoidRootPart

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

--indicatorbullshit
local function subtitle(move, text)
    game.Players.LocalPlayer.PlayerGui:FindFirstChild("Hotbar"):FindFirstChild("Backpack"):FindFirstChild("Hotbar"):FindFirstChild(move).Base.Reuse.Text = text
    game.Players.LocalPlayer.PlayerGui:FindFirstChild("Hotbar"):FindFirstChild("Backpack"):FindFirstChild("Hotbar"):FindFirstChild(move).Base.Reuse.Reuse.Text = text
    game.Players.LocalPlayer.PlayerGui:FindFirstChild("Hotbar"):FindFirstChild("Backpack"):FindFirstChild("Hotbar"):FindFirstChild(move).Base.Reuse.Visible = true   
end
repeat
    wait()
    if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Hotbar"):FindFirstChild("Backpack"):FindFirstChild("Hotbar"):FindFirstChild("1").Base.ToolName.Text == "Crushing Pull" then
        subtitle("1", "Instakill")
    end
    if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Hotbar"):FindFirstChild("Backpack"):FindFirstChild("Hotbar"):FindFirstChild("2").Base.ToolName.Text == "Windstorm Fury" then
        subtitle("2", "Stun (Janky)")
    end
    if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Hotbar"):FindFirstChild("Backpack"):FindFirstChild("Hotbar"):FindFirstChild("3").Base.ToolName.Text == "Stone Coffin" then
        subtitle("3", "Normal")
    end
    if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Hotbar"):FindFirstChild("Backpack"):FindFirstChild("Hotbar"):FindFirstChild("4").Base.ToolName.Text == "Expulsive Push" then
        subtitle("4", "Normal")
    end
until not true
local function onAnimationPlayed(animTrack)
    if animTrack.Animation.AnimationId == "rbxassetid://16139108718" then
        posTable.originalPos = hrp.Position
        Pausecamera()
        wait(0.3)
        hrp.CFrame = hrp.CFrame * CFrame.new(0, -490, 0)
        wait(0.7)
        UnPausecamera()
        hrp.CFrame = CFrame.new(posTable.originalPos)
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
            char.HumanoidRootPart.CFrame = CFrame.new(char.HumanoidRootPart.Position) + Vector3.new(0,-2,0)
            char.HumanoidRootPart.CFrame = CFrame.new(char.HumanoidRootPart.Position) * CFrame.Angles(math.rad(-90), 0, 0)
        until not flip
    end
end
game.Players.LocalPlayer.Character.Humanoid.AnimationPlayed:Connect(onAnimationPlayed)
