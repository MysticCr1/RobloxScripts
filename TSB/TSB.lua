local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Cryptic Hub - TSB",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "ALL MY SCRIPTS YOU RETARDS",
    LoadingSubtitle = "Love, Cryptic",
    Theme = "default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

    DisableRayfieldPrompts = true,
    DisableBuildWarnings = true, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

    ConfigurationSaving = {
        Enabled = true,
        FolderName = "CRYPTIC'S SCRIPTS", -- Create a custom folder for your hub/game
        FileName = "Cryptic Hub"
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
local SAI = Window:CreateTab("Saitama")
local Button = SAI:CreateButton({
    Name = "Gojo",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MysticCr1/RobloxScripts/refs/heads/scripts/gojosait.lua"))()
    end,
})
local Button = SAI:CreateButton({
    Name = "Angel",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MysticCr1/RobloxScripts/refs/heads/scripts/angel.lua"))()
    end,
})
local GAR = Window:CreateTab("Garou")
local Button = GAR:CreateButton({
    Name = "Minos",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MysticCr1/RobloxScripts/refs/heads/scripts/Minos.lua"))()
    end,
})
local Button = GAR:CreateButton({
    Name = "Dimention Walker",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MysticCr1/RobloxScripts/refs/heads/scripts/DMGBR.lua"))()
    end,
})
local GEN = Window:CreateTab("Genos")
local SON = Window:CreateTab("Sonic")
local MET = Window:CreateTab("Metal")
local ATO = Window:CreateTab("Atomic")
local SUR = Window:CreateTab("Suriyu")
local CHI = Window:CreateTab("Child")
local MISC = Window:CreateTab("Miscellaneous")
