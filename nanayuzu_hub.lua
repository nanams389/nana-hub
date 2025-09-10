-- Rayfieldロード
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "nana blitz hub",
    LoadingTitle = "Loading nana blitz hub...",
    LoadingSubtitle = "By nanams389",
    Theme = "Dark",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "nana_blitz_hub",
        FileName = "config"
    },
    KeySystem = false
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HR = Character:WaitForChild("HumanoidRootPart")
local Hum = Character:WaitForChild("Humanoid")
local Workspace = game:GetService("Workspace")

-- グローバルアンチフラグ
_G.AntiKick = false
_G.AntiGrab = false
_G.AntiBlob = false
_G.AntiFling = false
_G.AntiSlow = false
_G.AntiBarrier = false
_G.AntiKill = false
_G.AntiAura = false

-- ====================
-- Anti Tab
-- ====================
local AntiTab = Window:CreateTab("Anti",4483362458)
AntiTab:CreateSection("アンチ系機能")

AntiTab:CreateToggle({Name="Anti Kick", Default=false, Callback=function(v)
    _G.AntiKick = v
    Rayfield:Notify({Title="Anti Kick",Content="Kick防御: "..tostring(v),Duration=2})
end})

AntiTab:CreateToggle({Name="Anti Grab", Default=false, Callback=function(v)
    _G.AntiGrab = v
    Rayfield:Notify({Title="Anti Grab",Content="Grab防御: "..tostring(v),Duration=2})
end})

AntiTab:CreateToggle({Name="Anti Blob", Default=false, Callback=function(v)
    _G.AntiBlob = v
    Rayfield:Notify({Title="Anti Blob",Content="Blob防御: "..tostring(v),Duration=2})
end})

AntiTab:CreateToggle({Name="Anti Fling", Default=false, Callback=function(v)
    _G.AntiFling = v
    Rayfield:Notify({Title="Anti Fling",Content="Fling防御: "..tostring(v),Duration=2})
end})

AntiTab:CreateToggle({Name="Anti Slow", Default=false, Callback=function(v)
    _G.AntiSlow = v
    Rayfield:Notify({Title="Anti Slow",Content="Slow防御: "..tostring(v),Duration=2})
end})

AntiTab:CreateToggle({Name="Anti Barrier", Default=false, Callback=function(v)
    _G.AntiBarrier = v
    Rayfield:Notify({Title="Anti Barrier",Content="Barrier防御: "..tostring(v),Duration=2})
end})

AntiTab:CreateToggle({Name="Anti Kill", Default=false, Callback=function(v)
    _G.AntiKill = v
    Rayfield:Notify({Title="Anti Kill",Content="Kill防御: "..tostring(v),Duration=2})
end})

AntiTab:CreateToggle({Name="Anti Aura", Default=false, Callback=function(v)
    _G.AntiAura = v
    Rayfield:Notify({Title="Anti Aura",Content="Aura防御: "..tostring(v),Duration=2})
end})

-- ====================
-- Player Tab（自分用とサンプル）
-- ====================
local PlayerTab = Window:CreateTab("Player",4483362458)
PlayerTab:CreateSection("Player Actions")

PlayerTab:CreateButton({Name = "Teleport to Spawn", Callback = function()
    HR.CFrame = CFrame.new(0, 10, 0)
end})

PlayerTab:CreateButton({Name = "Fling Self", Callback = function()
    HR.Velocity = Vector3.new(0, 500, 0)
end})

PlayerTab:CreateButton({Name = "Heal Self", Callback = function()
    Hum.Health = Hum.MaxHealth
end})

PlayerTab:CreateButton({Name = "Become Blobaman", Callback = function()
    for _, part in pairs(Character:GetChildren()) do
        if part:IsA("BasePart") then
            part.Size = Vector3.new(5,5,5)
            part.BrickColor = BrickColor.new("Bright blue")
        end
    end
end})

PlayerTab:CreateButton({Name = "Kick All Players (サンプル)", Callback = function()
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            print("Kick: " .. plr.Name)
        end
    end
    Rayfield:Notify({Title="Kick All", Content="全員Kickしようとしました（実際はできません）", Duration=3})
end})

-- ====================
-- Self Tab
-- ====================
local SelfTab = Window:CreateTab("Self",4483362458)
SelfTab:CreateSection("Self Boosts")

SelfTab:CreateSlider({Name = "WalkSpeed", Min=16, Max=500, Default=16, Callback=function(v) Hum.WalkSpeed=v end})
SelfTab:CreateSlider({Name = "JumpPower", Min=50, Max=500, Default=50, Callback=function(v) Hum.JumpPower=v end})

SelfTab:CreateToggle({Name="Infinite Jump", Default=false, Callback=function(v) _G.InfiniteJump=v end})
SelfTab:CreateToggle({Name="Super Strength", Default=false, Callback=function(v) _G.SuperStrength=v end})

game:GetService("UserInputService").JumpRequest:Connect(function()
    if _G.InfiniteJump then Hum:ChangeState(Enum.HumanoidStateType.Jumping) end
end)

-- ====================
-- Aura Tab（自分へのAura例）
-- ====================
local AuraTab = Window:CreateTab("Aura",4483362458)
AuraTab:CreateSection("Aura Actions")

AuraTab:CreateToggle({Name="Auto Heal", Default=false, Callback=function(v) _G.AutoHeal=v end})
AuraTab:CreateToggle({Name="Auto Fling", Default=false, Callback=function(v) _G.AutoFling=v end})

spawn(function()
    while true do
        wait(0.5)
        if _G.AutoHeal then Hum.Health = Hum.MaxHealth end
        if _G.AutoFling then HR.Velocity = Vector3.new(0,100,0) end
    end
end)

-- ====================
-- Misc / Credits
-- ====================
local MiscTab = Window:CreateTab("Misc",4483362458)
MiscTab:CreateLabel("nana blitz hub by nanams389")
MiscTab:CreateButton({Name="リセット",Callback=function() Hum.Health=0 end})

local CreditsTab = Window:CreateTab("Credits",4483362458)
CreditsTab:CreateLabel("Made by nanams389")
CreditsTab:CreateLabel("Inspired by Blitz Hub")

Rayfield:Init()


