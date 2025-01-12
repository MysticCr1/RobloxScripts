local player = game.Players.LocalPlayer
local rightArm = player.Character["Right Arm"]
local leftArm = player.Character["Left Arm"]
local c3 = Color3.fromHex("#ff0000")
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
local function ATTACKCOLOR(player)
    if player:IsA("Model") then
        rizz(player)
    else
        rizz(player.Character or player.CharacterAdded:Wait())
        table.insert(connections, player.CharacterAdded:Connect(rizz))
    end
end
function GUI(LocalPlayer, ulttext)
    wait(0.1)
    LocalPlayer.PlayerGui.ScreenGui:WaitForChild("MagicHealth").Health.Bar.Bar.ImageColor3 = Color3.fromRGB(255, 0, 0)
    LocalPlayer.PlayerGui.Hotbar:WaitForChild("Backpack").LocalScript.Cooldown.BackgroundColor3 = Color3.fromRGB(255, 0,
        0)
    ulttext.Text = "20 Series"
end

-- HAND VFX

function Fistvfxr()
    local effect = game.ReplicatedStorage.Resources.FiveSeasonsFX["CharFX"].ArmFX:Clone()
    effect.Parent = rightArm
    effect.Name = "DIEVFXR"
    effect.Rotation = Vector3.new(180, 0, -180)
    for _, child in ipairs(effect:GetChildren()) do
        if child:IsA("ParticleEmitter") then
            child.Color = ColorSequence.new(c3)
            child:Emit(1)
        end
    end
end
function Fistvfxl()
    local effect = game.ReplicatedStorage.Resources.FiveSeasonsFX["CharFX"].ArmFX:Clone()
    effect.Parent = leftArm
    effect.Name = "DIEVFXL"
    effect.Rotation = Vector3.new(180, 0, -180)
    for _, child in ipairs(effect:GetChildren()) do
        if child:IsA("ParticleEmitter") then
            child.Color = ColorSequence.new(c3)
            child:Emit(1)
        end
    end
end

-- ULT HANDLING

function ULT(humanoid)
    local awakening = "rbxassetid://12342141464"
    local awakeningid = "rbxassetid://18445236460"
    local function onAnimationPlayed(animTrack)
        if animTrack.Animation.AnimationId == awakening then
            animTrack:Stop()
            local newAnim = Instance.new("Animation")
            newAnim.AnimationId = awakeningid
            local f = humanoid:LoadAnimation(newAnim)
            f:Play()
            f:AdjustSpeed(0.5)
        end
    end
    humanoid.AnimationPlayed:Connect(onAnimationPlayed)
    local crushed = "rbxassetid://13630786846"
    local crushedid = "rbxassetid://17354976067"
    local function onAnimationPlayed(animTrack)
        if animTrack.Animation.AnimationId == crushed then
            animTrack:Stop()
            local newAnim = Instance.new("Animation")
            newAnim.AnimationId = crushedid
            local f = humanoid:LoadAnimation(newAnim)
            f:Play()
            f.TimePosition = 1.5
        end
    end
    humanoid.AnimationPlayed:Connect(onAnimationPlayed)
end

-- MOVES

function MOVES(humanoid)
    local flowing = "rbxassetid://12273188754"
    local flowingid = "rbxassetid://81827172076105"
    local function onAnimationPlayed(animTrack)
        if animTrack.Animation.AnimationId == flowing then
            animTrack:Stop()
            local newAnim = Instance.new("Animation")
            newAnim.AnimationId = flowingid
            local f = humanoid:LoadAnimation(newAnim)
            f:Play()
            Fistvfxl()
            Fistvfxr()
            wait(2)
            rightArm.DIEVFXR:Destroy()
            leftArm.DIEVFXL:Destroy()
        end
    end
    humanoid.AnimationPlayed:Connect(onAnimationPlayed)

    local lethal = "rbxassetid://12296113986"
    local lethalid = "rbxassetid://17325254223"
    local function onAnimationPlayed(animTrack)
        if animTrack.Animation.AnimationId == lethal then
            animTrack:Stop()
            local newAnim = Instance.new("Animation")
            newAnim.AnimationId = lethalid
            local f = humanoid:LoadAnimation(newAnim)
            f:Play()
            wait(1.8)
            local effect = game:GetService("ReplicatedStorage").Resources.KJEffects.ImpactEffect2["Attachment"]:Clone()

            -- the parent of the vfx
            effect.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart

            -- emitting za partcle
            for _, child in ipairs(effect:GetChildren()) do
                if child:IsA("ParticleEmitter") then
                    child:Emit(2) -- Emit 1 particle
                end
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart:WaitForChild("effect"):Destroy()
        end
    end
    humanoid.AnimationPlayed:Connect(onAnimationPlayed)

    local hunters = "rbxassetid://12309835105"
    local huntersid = "rbxassetid://16944345619"
    local function onAnimationPlayed(animTrack)
        if animTrack.Animation.AnimationId == hunters then
            animTrack:Stop()
            local lleg = player.Character["Left Leg"]
            local newAnim = Instance.new("Animation")
            newAnim.AnimationId = huntersid
            local f = humanoid:LoadAnimation(newAnim)
            f:Play()
            wait(0.6)
            local effect = game:GetService("ReplicatedStorage").Resources.KJEffects.ImpactEffect2["Attachment"]:Clone()

            -- the parent of the vfx
            effect.Parent = lleg

            -- emitting za partcle
            for _, child in ipairs(effect:GetChildren()) do
                if child:IsA("ParticleEmitter") then
                    child:Emit(1) -- Emit 1 particle
                end
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart:WaitForChild("effect"):Destroy()
        end
    end
    humanoid.AnimationPlayed:Connect(onAnimationPlayed)

    local preys = "rbxassetid://13603396939"
    local preysid = "rbxassetid://16945550029"
    local function onAnimationPlayed(animTrack)
        if animTrack.Animation.AnimationId == preys then
            animTrack:Stop()
            local newAnim = Instance.new("Animation")
            newAnim.AnimationId = preysid
            local f = humanoid:LoadAnimation(newAnim)
            f:Play()
            f:AdjustSpeed(1.75)
            Fistvfxl()
            Fistvfxr()
            wait(2)
            rightArm.DIEVFXR:Destroy()
            leftArm.DIEVFXL:Destroy()
        end
    end
    humanoid.AnimationPlayed:Connect(onAnimationPlayed)

    local crushed = "rbxassetid://13630786846"
    local crushedid = "rbxassetid://17354976067"
    local function onAnimationPlayed(animTrack)
        if animTrack.Animation.AnimationId == crushed then
            animTrack:Stop()
            local newAnim = Instance.new("Animation")
            newAnim.AnimationId = crushedid
            local f = humanoid:LoadAnimation(newAnim)
            f:Play()
            f.TimePosition = 1.5
        end
    end
    humanoid.AnimationPlayed:Connect(onAnimationPlayed)
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
    print(Tool4Name)
    print(Tool3Name)
    print(Tool2Name)
    print(Tool1Name)
    run.RenderStepped:Connect(function()
        if Tool1Name.Text == "Flowing Water" then
            Tool1Name.Text = "Spiraling Storm"
        end
        if Tool2Name.Text == "Lethal Whirlwind Stream" then
            Tool2Name.Text = "Collateral Ruin"
        end
        if Tool3Name.Text == "Hunter's Grasp" then
            Tool3Name.Text = "Swift Sweep"
        end
        if Tool4Name.Text == "Prey's Peril" then
            Tool4Name.Text = "Ravage"
        end
    end)
end

-- RESPAWN HANDLING

function STARTUP()
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
    local run = game:GetService("RunService")
    local ulttext = ultbar:FindFirstChild("TextLabel")
    local LocalPlayer = Players.LocalPlayer
    wait(0.1)
    GUI(LocalPlayer, ulttext)
    ULT(humanoid)
    MOVES(humanoid)
    MOVETITLES(run, hotbarFrame)
    ATTACKCOLOR(player)
end

player.CharacterAdded:Connect(STARTUP)
STARTUP()