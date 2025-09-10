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
local RunService = game:GetService("RunService")

-- Global Toggles
_G.SuperStrength = false
_G.AntiGrab = false
_G.AutoClutch = false
_G.KillAura = false
_G.FlingAura = false
_G.InfiniteJump = false
_G.GodMode = false
_G.NoClip = false

-- ====================
-- Player Tab
-- ====================
local PlayerTab = Window:CreateTab("Player", 4483362458)
local Section = PlayerTab:CreateSection("Player Actions")

-- Player選択ドロップダウン
local playerDropdown = {}
for i, plr in pairs(Players:GetPlayers()) do
    if plr ~= LocalPlayer then
        table.insert(playerDropdown, plr.Name)
    end
end
local selectedPlayerName = playerDropdown[1] or ""

PlayerTab:CreateDropdown({
    Name = "Select Player",
    Options = playerDropdown,
    CurrentOption = selectedPlayerName,
    Callback = function(option)
        selectedPlayerName = option
    end
})

-- ボタン: テレポート
PlayerTab:CreateButton({
    Name = "Teleport to Player",
    Callback = function()
        local target = Players:FindFirstChild(selectedPlayerName)
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            HR.CFrame = target.Character.HumanoidRootPart.CFrame
        end
    end
})

-- ボタン: プレイヤーを自分の位置へ
PlayerTab:CreateButton({
    Name = "Bring Player to Me",
    Callback = function()
        local target = Players:FindFirstChild(selectedPlayerName)
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            target.Character.HumanoidRootPart.CFrame = HR.CFrame
        end
    end
})

-- ボタン: キル
PlayerTab:CreateButton({
    Name = "Kill Player",
    Callback = function()
        local target = Players:FindFirstChild(selectedPlayerName)
        if target and target.Character and target.Character:FindFirstChild("Humanoid") then
            target.Character.Humanoid.Health = 0
        end
    end
})

-- ボタン: バリア
PlayerTab:CreateButton({
    Name = "Give Barrier",
    Callback = function()
        local target = Players:FindFirstChild(selectedPlayerName)
        if target and target.Character then
            local hrp = target.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local barrier = Instance.new("Part")
                barrier.Size = Vector3.new(5,5,5)
                barrier.Transparency = 0.5
                barrier.Anchored = true
                barrier.CanCollide = true
                barrier.Position = hrp.Position
                barrier.Name = "Barrier"
                barrier.Parent = Workspace
                game:GetService("Debris"):AddItem(barrier, 5)
            end
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
    Callback = function(value) Hum.WalkSpeed = value end
})

SelfTab:CreateSlider({
    Name = "JumpPower",
    Min = 50,
    Max = 500,
    Default = 50,
    Callback = function(value) Hum.JumpPower = value end
})

SelfTab:CreateToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(value) _G.InfiniteJump = value end
})

SelfTab:CreateToggle({
    Name = "God Mode",
    Default = false,
    Callback = function(value) _G.GodMode = value end
})

SelfTab:CreateToggle({
    Name = "NoClip",
    Default = false,
    Callback = function(value) _G.NoClip = value end
})

-- Jump接続
game:GetService("UserInputService").JumpRequest:Connect(function()
    if _G.InfiniteJump then Hum:ChangeState(Enum.HumanoidStateType.Jumping) end
end)

-- NoClip処理
RunService.Stepped:Connect(function()
    if _G.NoClip then
        for _, part in pairs(Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- ====================
-- Aura Tab
-- ====================
local AuraTab = Window:CreateTab("Aura", 4483362458)
AuraTab:CreateToggle({
    Name = "Kill Aura",
    Default = false,
    Callback = function(value) _G.KillAura = value end
})
AuraTab:CreateToggle({
    Name = "Fling Aura",
    Default = false,
    Callback = function(value) _G.FlingAura = value end
})

spawn(function()
    while true do
        wait(0.1)
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                if _G.KillAura and p.Character:FindFirstChild("Humanoid") then
                    p.Character.Humanoid.Health = 0
                end
                if _G.FlingAura and p.Character:FindFirstChild("HumanoidRootPart") then
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
    Callback = function(value) _G.AutoClutch = value end
})

-- ====================
-- Anti Tab
-- ====================
local AntiTab = Window:CreateTab("Anti", 4483362458)
AntiTab:CreateToggle({
    Name = "Anti Grab",
    Default = false,
    Callback = function(value) _G.AntiGrab = value end
})

-- ====================
-- Misc / Credits
-- ====================
local MiscTab = Window:CreateTab("Misc", 4483362458)
MiscTab:CreateLabel("nanayuzu hub by YourName")

local CreditsTab = Window:CreateTab("Credits", 4483362458)
CreditsTab:CreateLabel("Made by YourName")
CreditsTab:CreateLabel("Inspired by Blitz Hub")

Rayfield:Init()

