-- Rayfieldロード
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Window作成
local Window = Rayfield:CreateWindow({
    Name = "nanayuzu hub",
    LoadingTitle = "Loading nanayuzu hub...",
    LoadingSubtitle = "By YourName",
    Theme = "Dark",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "nanayuzu_hub",
        FileName = "config"
    },
    KeySystem = false
})

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HR = Character:WaitForChild("HumanoidRootPart")
local Hum = Character:WaitForChild("Humanoid")
local Workspace = game:GetService("Workspace")

-- Global Toggles
_G.SuperStrength = false
_G.AntiGrab = false
_G.AutoClutch = false
_G.KillAura = false
_G.FlingAura = false
_G.InfiniteJump = false

-- ====================
-- Player Tab
-- ====================
local PlayerTab = Window:CreateTab("Player", 4483362458)
local Section = PlayerTab:CreateSection("Player Actions")

PlayerTab:CreateButton({
    Name = "Teleport to Player",
    Callback = function()
        local target = Players:GetPlayers()[2] -- 適当にプレイヤー選択
        if target and target.Character then
            HR.CFrame = target.Character.HumanoidRootPart.CFrame
        end
    end
})

PlayerTab:CreateButton({
    Name = "Bring Player to Me",
    Callback = function()
        local target = Players:GetPlayers()[2]
        if target and target.Character then
            target.Character.HumanoidRootPart.CFrame = HR.CFrame
        end
    end
})

PlayerTab:CreateButton({
    Name = "Kill Player",
    Callback = function()
        local target = Players:GetPlayers()[2]
        if target and target.Character and target.Character:FindFirstChild("Humanoid") then
            target.Character.Humanoid.Health = 0
        end
    end
})

-- ====================
-- Self Tab
-- ====================
local SelfTab = Window:CreateTab("Self", 4483362458)
local Section = SelfTab:CreateSection("Self Boosts")

SelfTab:CreateSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 500,
    Default = 16,
    Callback = function(value)
        Hum.WalkSpeed = value
    end
})

SelfTab:CreateSlider({
    Name = "JumpPower",
    Min = 50,
    Max = 500,
    Default = 50,
    Callback = function(value)
        Hum.JumpPower = value
    end
})

SelfTab:CreateToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(value)
        _G.InfiniteJump = value
    end
})

game:GetService("UserInputService").JumpRequest:Connect(function()
    if _G.InfiniteJump then
        Hum:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- ====================
-- Aura Tab
-- ====================
local AuraTab = Window:CreateTab("Aura", 4483362458)
local Section = AuraTab:CreateSection("Aura Actions")

AuraTab:CreateToggle({
    Name = "Kill Aura",
    Default = false,
    Callback = function(value)
        _G.KillAura = value
    end
})

AuraTab:CreateToggle({
    Name = "Fling Aura",
    Default = false,
    Callback = function(value)
        _G.FlingAura = value
    end
})

-- Aura Loop
spawn(function()
    while true do
        wait(0.1)
        if _G.KillAura then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Humanoid") then
                    p.Character.Humanoid.Health = 0
                end
            end
        end
        if _G.FlingAura then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    p.Character.HumanoidRootPart.Velocity = Vector3.new(0,100,0)
                end
            end
        end
    end
end)

-- ====================
-- Auto Tab
-- ====================
local AutoTab = Window:CreateTab("Auto", 4483362458)
AutoTab:CreateToggle({
    Name = "Auto Clutch",
    Default = false,
    Callback = function(value)
        _G.AutoClutch = value
    end
})

-- ====================
-- Anti Tab
-- ====================
local AntiTab = Window:CreateTab("Anti", 4483362458)
AntiTab:CreateToggle({
    Name = "Anti Grab",
    Default = false,
    Callback = function(value)
        _G.AntiGrab = value
    end
})

-- ====================
-- Misc Tab
-- ====================
local MiscTab = Window:CreateTab("Misc", 4483362458)
MiscTab:CreateLabel("nanayuzu hub by YourName")

-- ====================
-- Credits Tab
-- ====================
local CreditsTab = Window:CreateTab("Credits", 4483362458)
CreditsTab:CreateLabel("Made by YourName")
CreditsTab:CreateLabel("Inspired by Blitz Hub")

Rayfield:Init()
