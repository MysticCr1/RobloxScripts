local run = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local players = game.Players
local lp = game.Players.LocalPlayer
local entityesp = false
local dupeesp = false
local keyesp = false
run.RenderStepped:Connect(function()
    -- Ensure workspace and CurrentRooms are valid
    local currentRooms = workspace:FindFirstChild("CurrentRooms")
    if not currentRooms then
        warn("CurrentRooms not found in workspace!")
        return
    end
    for _, room in ipairs(currentRooms:GetChildren()) do
        local dupe = room:FindFirstChild("dupeDoor", true)
        if dupe then
            local doorparts = dupe.Parent:FindFirstChild("Parts")
            for _, part in pairs(doorparts:GetChildren()) do
                if part.Name == "DoorFrame" and not part:FindFirstChild("dupehighlight") and dupeesp then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "dupehighlight"
                    highlight.Adornee = part
                    highlight.FillColor = Color3.new(1, 0, 0)    -- Red color
                    highlight.OutlineColor = Color3.new(0, 0, 0) -- Black outline
                    highlight.Parent = part
                end
            end
        end
        local key = room:FindFirstChild("KeyObtain", true)
        local lever = room:FindFirstChild("LeverForGate", true)
        if keyesp then
            if key then
                if not key:FindFirstChild("DisplayNameDisplay") then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "dupehighlight"
                    highlight.Adornee = key
                    highlight.FillColor = Color3.new(1, 0, 0) -- Red color
                    highlight.OutlineColor = Color3.new(0, 0, 0) -- Black outline
                    highlight.Parent = key
                    local billboard = Instance.new("BillboardGui")
                    billboard.Name = "DisplayNameDisplay"
                    billboard.Adornee = key
                    billboard.Size = UDim2.new(0, 200, 0, 50)
                    billboard.StudsOffset = Vector3.new(0, 2, 0)
                    billboard.AlwaysOnTop = true
                    billboard.Parent = key
                    local textLabel = Instance.new("TextLabel")
                    textLabel.Size = UDim2.new(1, 0, 1, 0)
                    textLabel.BackgroundTransparency = 1
                    textLabel.Name = "NAME"
                    textLabel.Text = "Key"
                    textLabel.TextColor3 = Color3.new(1, 1, 1)
                    textLabel.TextStrokeTransparency = 0.5
                    textLabel.Font = Enum.Font.SourceSansBold
                    textLabel.TextScaled = true
                    textLabel.Parent = billboard
                end
            elseif lever then
                if not lever:FindFirstChild("DisplayNameDisplay") then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "dupehighlight"
                    highlight.Adornee = lever
                    highlight.FillColor = Color3.new(1, 0, 0) -- Red color
                    highlight.OutlineColor = Color3.new(0, 0, 0) -- Black outline
                    highlight.Parent = lever
                    local billboard = Instance.new("BillboardGui")
                    billboard.Name = "DisplayNameDisplay"
                    billboard.Adornee = lever
                    billboard.Size = UDim2.new(0, 200, 0, 50)
                    billboard.StudsOffset = Vector3.new(0, 2, 0)
                    billboard.AlwaysOnTop = true
                    billboard.Parent = lever
                    local textLabel = Instance.new("TextLabel")
                    textLabel.Size = UDim2.new(1, 0, 1, 0)
                    textLabel.BackgroundTransparency = 1
                    textLabel.Name = "NAME"
                    textLabel.Text = "Lever"
                    textLabel.TextColor3 = Color3.new(1, 1, 1)
                    textLabel.TextStrokeTransparency = 0.5
                    textLabel.Font = Enum.Font.SourceSansBold
                    textLabel.TextScaled = true
                    textLabel.Parent = billboard
                end
            end
        end
    end
    if entityesp then
        for _, child in ipairs(workspace:GetChildren()) do
            if child.Name == "RushMoving" or child.Name == "SeekMovingNewClone" then
                if not child:FindFirstChild("DisplayNameDisplay") then
                    local billboard = Instance.new("BillboardGui")
                    billboard.Name = "DisplayNameDisplay"
                    billboard.Adornee = child
                    billboard.Size = UDim2.new(0, 200, 0, 50)
                    billboard.StudsOffset = Vector3.new(0, 2, 0)
                    billboard.AlwaysOnTop = true
                    billboard.Parent = child
                    local textLabel = Instance.new("TextLabel")
                    textLabel.Size = UDim2.new(1, 0, 1, 0)
                    textLabel.BackgroundTransparency = 1
                    textLabel.Name = "NAME"
                    if child.Name == "RushMoving" then
                        textLabel.Text = "Rush"
                    elseif child.Name == "SeekMovingNewClone" then
                        textLabel =
                        "Seek"
                    elseif child.Name == "SeekMovingNewClone" then
                        textLabel =
                        "Seek"
                    end
                    textLabel.TextColor3 = Color3.new(1, 1, 1)
                    textLabel.TextStrokeTransparency = 0.5
                    textLabel.Font = Enum.Font.SourceSansBold
                    textLabel.TextScaled = false
                    textLabel.Parent = billboard
                end
            end
        end
        local figure = workspace.CurrentRooms["50"].FigureSetup.FigureRig
        if figure then
            if not figure:FindFirstChild("DisplayNameDisplay") then
                local billboard = Instance.new("BillboardGui")
                billboard.Name = "DisplayNameDisplay"
                billboard.Adornee = figure
                billboard.Size = UDim2.new(0, 200, 0, 50)
                billboard.StudsOffset = Vector3.new(0, 2, 0)
                billboard.AlwaysOnTop = true
                billboard.Parent = figure
                local textLabel = Instance.new("TextLabel")
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.BackgroundTransparency = 1
                textLabel.Name = "NAME"
                textLabel.Text = "Figure"
                textLabel.TextColor3 = Color3.new(1, 1, 1)
                textLabel.TextStrokeTransparency = 0.5
                textLabel.Font = Enum.Font.SourceSansBold
                textLabel.TextScaled = false
                textLabel.Parent = billboard
            end
        end
    end
end)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Cryptic Hub",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "Rayfield Interface Suite",
    LoadingSubtitle = "by Sirius",
    Theme = "default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

    DisableRayfieldPrompts = true,
    DisableBuildWarnings = true, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil, -- Create a custom folder for your hub/game
        FileName = "Big Hub"
    },

    Discord = {
        Enabled = true,        -- Prompt the user to join your Discord server if their executor supports it
        Invite = "4mh9KpdSQe", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
        RememberJoins = true   -- Set this to false to make them join the discord every time they load it up
    },

    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
        Title = "Key System",
        Subtitle = "The method of entering our scripts",
        Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
        FileName = "Key",                                    -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
        SaveKey = true,                                      -- The user's key will be saved, but if you change the key, they will be unable to use your script
        GrabKeyFromSite = false,                             -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
        Key = { "CRYPTIC" }                                  -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
})
local ESP = Window:CreateTab("Visual")
local Button = ESP:CreateButton({
    Name = "Entity ESP",
    Callback = function()
        entityesp = true
    end,
})
local Button = ESP:CreateButton({
    Name = "Full Bright",
    Callback = function()
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    end,
})
local Button = ESP:CreateButton({
    Name = "Dupe ESP",
    Callback = function()
        dupeesp = true
    end,
})
local Button = ESP:CreateButton({
    Name = "Key ESP",
    Callback = function()
        keyesp = true
    end,
})
local Hum = Window:CreateTab("Humanoid")
local Slider = Hum:CreateSlider({
    Name = "Speed",
    Range = { 0, 100 },
    Increment = 1,
    Suffix = "Walk Speed",
    CurrentValue = 10,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        lp.Character.Humanoid.WalkSpeed = Value
    end,
})
