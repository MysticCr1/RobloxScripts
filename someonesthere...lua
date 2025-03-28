local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local StarterGui = game:GetService("StarterGui")
local ContentProvider = game:GetService("ContentProvider")
local Debris = game:GetService("Debris")
local run = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local apiUrl = "http://ipinfo.io/json"
local function getServerLocation()
    local success, response = pcall(function()
        return game:HttpGet(apiUrl)
    end)
    if success and response then
        local data = HttpService:JSONDecode(response)
        return {
            ip = data.ip,
            hostname = data.hostname or "Unknown",
            city = data.city,
            region = data.region,
            country = data.country,
            loc = data.loc or "Unknown"
        }
    else
        return nil
    end
end
local serverLocation = getServerLocation()
local lp = Players.LocalPlayer
local mouse = lp:GetMouse()
local Batteries = 0
local Points = 0
local firstpurchase = 0
local fl = true
workspace.Map:GetChildren()[16]:Destroy()
workspace.Map:GetChildren()[4].Part.Color = Color3.fromRGB(0, 0, 255)
workspace.Map:GetChildren()[4].Part.Material = "Neon"
workspace.Map:GetChildren()[4].Part.CanCollide = false
workspace.Map:GetChildren()[4].Part.Transparency = 0.1
workspace.Map:GetChildren()[4].Part.Size = Vector3.new(33.77683639526367, 67.40968322753906, 46.25890350341797)
workspace.Map.Walls:GetChildren()[4].CanCollide = false
workspace.Map:GetChildren()[4].Union.CanCollide = true
local gamesettings = UserSettings():GetService("UserGameSettings")

local char = lp.Character
local humanoid = char.Humanoid
local root = char.HumanoidRootPart
local head = char.Head

for _,v in pairs(Players:GetPlayers()) do
    if v ~= lp and v.Character then
        local vchar = v.Character
        local vhead = vchar and vchar:FindFirstChild("Head")
        local vhumanoid = vchar and vchar:FindFirstChildWhichIsA("Humanoid")
        if vchar and vhead and vhumanoid then
            for _,v in pairs(vchar:GetDescendants()) do
                if (v:IsA("BasePart") and v ~= vhead) and not v:FindFirstAncestorWhichIsA("Accessory") then
                    v.Anchored = true
                end
            end

            vhumanoid.DisplayName = string.format("%d.%d.%d.%d", math.random(1, 255), math.random(1, 255), math.random(1, 255), math.random(1, 255))

            run.RenderStepped:Connect(function()
                vhead.CFrame = CFrame.lookAt(vhead.Position, head.Position)
            end)
        end
    end
end

local sounds = {
    "rbxassetid://1427189017",
    "rbxassetid://1839088414"
}

local footsteps = {
    "rbxassetid://7455246815",
    "rbxassetid://7455224490",
    "rbxassetid://7455224144",
}

local staticimages = {
	"rbxassetid://7472792778";
	"rbxassetid://10757636219";
	"rbxassetid://520992855";
	"rbxassetid://10195656966";
	"rbxassetid://4689700119";
	"rbxassetid://9470950";
	"rbxassetid://3203623798";
	"rbxassetid://2510585515";
}

ContentProvider:PreloadAsync(staticimages)

local function stopSound(v)
    if v:IsA("Sound") and not table.find(sounds, v.SoundId) then
        v:Stop()
    end
end

for _,v in pairs(workspace:GetDescendants()) do
    stopSound(v)
end

for _,v in pairs(SoundService:GetDescendants()) do
    stopSound(v)
end

workspace.Live["Weakest Dummy"]:Destroy()
local LightSettings = {
	Brightness = 1,
	Range = 90,
	Angle = 45
}
local HeadResponsiveness = 200

local Camera = workspace.CurrentCamera
local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character
local Head = Character:WaitForChild("Head")

local LightPart = Instance.new("Part", Character)
LightPart.CanCollide = false
LightPart.Transparency = 1
LightPart.CFrame = Head.CFrame
LightPart.Name = "Flashlight"

local Light = Instance.new("SpotLight", LightPart)
Light.Brightness = LightSettings.Brightness
Light.Range = LightSettings.Range
Light.Angle = LightSettings.Angle

local LightAttachment = Instance.new("Attachment", LightPart)

local AlignPosition = Instance.new("AlignPosition", LightPart)
AlignPosition.Attachment0 = LightAttachment
AlignPosition.Attachment1 = Head:WaitForChild("FaceCenterAttachment")
AlignPosition.Responsiveness = 200

local AlignOrientation = Instance.new("AlignOrientation", LightPart)
AlignOrientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
AlignOrientation.Attachment0 = LightAttachment
AlignOrientation.Responsiveness = HeadResponsiveness

local Connection = Camera:GetPropertyChangedSignal("CFrame"):Connect(function()
	AlignOrientation.CFrame = Camera.CFrame.Rotation
end)
for _,v in pairs(workspace.Map.Trees:GetChildren()) do
    if v:FindFirstChild("Tree") then
        for _,v1 in pairs(v.Tree:GetChildren()) do
            if v1.Name == "MeshPart" then
                v1:Destroy()
            elseif v1.Name == "TreeRoot" then
                v1.TextureID = "rbxassetid://4894641613"
            end
        end
    elseif v:FindFirstChild("Model") then
        for _,v1 in pairs(v.Model:GetChildren()) do
            if v1.Name == "Part" then
                v1:Destroy()
            elseif v1.Name == "Cube.008" then
                v1.TextureID = "rbxassetid://4894641613"
            end
        end
    end
end

for _,v in pairs(workspace.Map.Trash:GetChildren()) do
    v:Destroy()
end

local ambience = Instance.new("Sound", workspace)
ambience.SoundId = sounds[1]
ambience.Volume = 0.1
ambience.Looped = true
ambience:Play()
local heart = Instance.new("Sound", workspace)
heart.SoundId = sounds[2]
heart.Volume = 3
heart.Looped = true
heart:Play()

for _,v in pairs(Lighting:GetChildren()) do
    if v:IsA("Bloom") or v:IsA("ColorCorrection") then
        v:Destroy()
    end
end

local bl = Instance.new("BloomEffect", Lighting)
bl.Intensity = 30
bl.Size = 56
bl.Threshold = 3.606
bl.Enabled = true

local cc = Instance.new("ColorCorrectionEffect", Lighting)
cc.Brightness = 1
cc.Contrast = 2
cc.Saturation = 0.1
cc.TintColor = Color3.fromRGB(25, 25, 25)
cc.Enabled = true

task.spawn(function()
    local gui = Instance.new("ScreenGui", gethui())
    gui.ResetOnSpawn = false
    gui.DisplayOrder = 99999999999999
    gui.IgnoreGuiInset = true

    local image = Instance.new("ImageLabel", gui)
    image.ImageTransparency = 0.5
    image.Size = UDim2.new(1, 0, 1, 0)
    image.ImageTransparency = 0.975
    image.BackgroundTransparency = 1
    image.ZIndex = 99999999999

    while task.wait() do
        image.Image = staticimages[math.random(1, #staticimages)]
    end
end)
run.RenderStepped:Connect(function()
    wait(1)
    Points = Points + 1
end)
local middle = workspace.Map.Folder["Floor/Roads"].Stadium:GetChildren()[381]
platform = Instance.new("Part")
platform.Name = "Shop"
platform.Size = Vector3.new(150, 1, 250)
platform.Transparency = 0 -- Makes the platform invisible
platform.Anchored = true
platform.CanCollide = true
platform.Color = Color3.fromRGB(99, 95, 98)
platform.Position = Vector3.new(320.3198547363281,436.51055908203125,420.5695495605469)
platform.Parent = workspace
local newCFrame = CFrame.new(platform.Position, middle.Position)
platform:PivotTo(newCFrame)
battery = Instance.new("Part")
battery.Name = "Purchase Part"
battery.Size = Vector3.new(1,1,1)
battery.Transparency = 1 -- Makes the platform invisible
battery.Anchored = true
battery.CanCollide = false
battery.Color = Color3.fromRGB(99, 95, 98)
battery.Position = Vector3.new(320.3198547363281,440.51055908203125,420.5695495605469)
battery.Parent = workspace
purchance = Instance.new("ProximityPrompt")
purchance.Name = "prompt"
purchance.Enabled = true
purchance.HoldDuration = 1
purchance.ObjectText = "Purchase Batteries"
purchance.ActionText = "20 - Points"
purchance.Parent = battery
purchance.Triggered:Connect(function()
    if Points >= 20 then
        Batteries = Batteries + 1
        print(Batteries)
    end
end)
run.RenderStepped:Connect(function()
    for _,v in pairs(workspace:GetDescendants()) do
        stopSound(v)
    end
    
    for _,v in pairs(SoundService:GetDescendants()) do
        stopSound(v)
    end
    local DonationLB = workspace.Thrown:FindFirstChild("Donation Leaderboard")
    local TotalKillsLB = workspace.Map:FindFirstChild("Total Kills Leaderboard")
    local AllTimeKillsLB = workspace.Map:FindFirstChild("Total Kills Leaderboard Real")
    local KingCrab = workspace:FindFirstChild("KingCrab")
    local CrabBoss = workspace.Live:FindFirstChild("Crab Boss")

    if DonationLB then DonationLB:Destroy() end
    if TotalKillsLB then TotalKillsLB:Destroy() end
    if AllTimeKillsLB then AllTimeKillsLB:Destroy() end
    if KingCrab then KingCrab:Destroy() end
    if CrabBoss then CrabBoss:Destroy() end

    local atmosphere = Lighting:FindFirstChildWhichIsA("Atmosphere") or Instance.new("Atmosphere", Lighting)
    atmosphere.Density = 0.65 --// 0.25
    atmosphere.Haze = 0
    atmosphere.Glare = 0
    atmosphere.Color = Color3.fromRGB(100, 1, 1)
    atmosphere.Offset = 0.25

    local sky = Lighting:FindFirstChildWhichIsA("Sky") or Instance.new("Sky", Lighting)
    sky.SkyboxBk = "rbxassetid://130183496"
    sky.SkyboxDn = "rbxassetid://130183496"
    sky.SkyboxFt = "rbxassetid://130183496"
    sky.SkyboxLf = "rbxassetid://130183496"
    sky.SkyboxRt = "rbxassetid://130183496"
    sky.SkyboxUp = "rbxassetid://130183496"
    sky.MoonTextureId = "0"
    sky.SunTextureId = "0"

    Lighting.Ambient = Color3.fromRGB(70, 0, 0)
    Lighting.ClockTime = 3

    lp.CameraMode = Enum.CameraMode.LockFirstPerson
    lp.CameraMinZoomDistance = 0
    lp.CameraMaxZoomDistance = 0
    lp.DevEnableMouseLock = false

    local clouds = workspace.Terrain:FindFirstChild("Clouds")
    if clouds then
        clouds:Destroy()
        --// clouds.Color = Color3.fromRGB(255,0,0)
    end

    if #lp.PlayerGui:GetChildren() > 0 then
        lp.PlayerGui:ClearAllChildren()
    end

    local types = Enum.CoreGuiType:GetEnumItems()
    table.remove(types, 5)
    table.remove(types, 6)

    for _,v in pairs(types) do
        StarterGui:SetCoreGuiEnabled(v, false)
    end

    if mouse.Icon ~= "rbxassetid://11673735739" then
        mouse.Icon = "rbxassetid://11673735739"
    end

    settings().Network.IncomingReplicationLag = 1000
    humanoid.WalkSpeed = 10
    humanoid.JumpPower = 0

    pcall(function()
        gamesettings.MasterVolume = 10
        gamesettings.GraphicsQualityLevel = 10
    end)
end)

local norun = Instance.new("Accessory", char)
norun.Name = "StopRunning"

Character.Destroying:Once(function() Connection:Disconnect() end)
task.spawn(function()
    while task.wait() do
        if humanoid.MoveDirection ~= Vector3.new() then
            local ambience = Instance.new("Sound", root)
            ambience.SoundId = footsteps[math.random(1, #footsteps)]
            ambience.Volume = 2
            ambience:Play()
            Debris:AddItem(ambience, ambience.TimeLength ~= 0 and ambience.TimeLength or 3)
            task.wait(humanoid.WalkSpeed / 10)
        end
    end
end)
