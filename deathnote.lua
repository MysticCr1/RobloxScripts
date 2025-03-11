-- Death Note Script with GUI (Username and Display Name Support)
-- Made by PaperX™

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local textbox = Instance.new("TextBox")
local submitButton = Instance.new("TextButton")
local closeButton = Instance.new("TextButton")
local titleLabel = Instance.new("TextLabel")

-- Setup GUI elements
gui.Name = "DeathNoteGui"
gui.Parent = player:WaitForChild("PlayerGui")

frame.Name = "DeathNoteFrame"
frame.Size = UDim2.new(0, 300, 0, 400)
frame.Position = UDim2.new(0.5, -150, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.5
frame.Parent = gui

titleLabel.Name = "TitleLabel"
titleLabel.Text = "Death Note"
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 24
titleLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = frame

textbox.Name = "NameInput"
textbox.PlaceholderText = "Write the username or display name..."
textbox.Size = UDim2.new(1, -20, 0, 40)
textbox.Position = UDim2.new(0, 10, 0, 60)
textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
textbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textbox.TextSize = 18
textbox.ClearTextOnFocus = true
textbox.Parent = frame

submitButton.Name = "SubmitButton"
submitButton.Text = "Write"
submitButton.Size = UDim2.new(0, 100, 0, 40)
submitButton.Position = UDim2.new(0, 10, 0, 110)
submitButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
submitButton.TextColor3 = Color3.fromRGB(0, 0, 0)
submitButton.Font = Enum.Font.GothamBold
submitButton.TextSize = 18
submitButton.Parent = frame

closeButton.Name = "CloseButton"
closeButton.Text = "Close"
closeButton.Size = UDim2.new(0, 100, 0, 40)
closeButton.Position = UDim2.new(1, -110, 0, 110)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 18
closeButton.Parent = frame

-- Function to kill the player using username or display name
local function killPlayer(playerIdentifier)
    local targetPlayer = nil
    
    -- Check if it's a username or display name
    if game.Players:FindFirstChild(playerIdentifier) then
        targetPlayer = game.Players[playerIdentifier]
    else
        for _, p in pairs(game.Players:GetPlayers()) do
            if p.DisplayName:lower() == playerIdentifier:lower() then
                targetPlayer = p
                break
            end
        end
    end
    
    -- Kill the player if found
    if targetPlayer then
        local character = targetPlayer.Character
        if character and character:FindFirstChild("Humanoid") then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            humanoid.Health = 0
            print(playerIdentifier .. " has been written in the Death Note.")
        end
    else
        print("Player not found!")
    end
end

-- Handle button presses
submitButton.MouseButton1Click:Connect(function()
    local playerIdentifier = textbox.Text
    if playerIdentifier ~= "" then
        killPlayer(playerIdentifier)
        textbox.Text = ""  -- Clear text after execution
        gui:Destroy()  -- Close the Death Note
    else
        print("Please enter a valid username or display name.")
    end
end)

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()  -- Close the Death Note GUI
end)

print("Death Note GUI Loaded. Type the username or display name of the player.")
