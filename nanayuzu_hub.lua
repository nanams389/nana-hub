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
_G.InfiniteJump = false
_G.KillAura = false
_G.FlingAura = false
_G.PullAura = false
_G.SlowAura = false
_G.AntiGrab = false
_G.AntiKick = false
_G.AntiFling = false

-- ====================
-- Player Tab
-- ====================
local PlayerTab = Window:CreateTab("Player", 4483362458)
local Section = PlayerTab:CreateSection("Player Actions")

-- Player Dropdown
local playerDropdown = {}
for i, plr in pairs(Players:GetPlayers()) do
    if plr ~= LocalPlayer then
        table.insert(playerDropdown, plr.Name)
    end
end
local selectedPlayerName = playerDropdown[1]

PlayerTab:CreateDropdown({
    Name = "Select Player",
    Options = playerDropdown,
    CurrentOption = selectedPlayerName,
    Callback = function(option)
        selectedPlayerName = option
    end
})

-- Player Buttons
local function getTarget() return Players:FindFirstChild(selectedPlayerName) end

PlayerTab:CreateButton({Name = "Teleport to Player", Callback = function()
    local target = getTarget()
    if target and target.Character then HR.CFrame = target.Character.HumanoidRootPart.CFrame end
end})

PlayerTab:CreateButton({Name = "Bring Player to Me", Callback = function()
    local target = getTarget()
    if target and target.Character then target.Character.HumanoidRootPart.CFrame = HR.CFrame end
end})

PlayerTab:CreateButton({Name = "Kill Player", Callback = function()
    local target = getTarget()
    if target and target.Character and target.Character:FindFirstChild("Humanoid") then
        target.Character.Humanoid.Health = 0
    end
end})

PlayerTab:CreateButton({Name = "Give Barrier", Callback = function()
    local target = getTarget()
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
            game:GetService("Debris"):AddItem(barrier,5)
        end
    end
end})

PlayerTab:CreateButton({Name = "Fling Player", Callback = function()
    local target = getTarget()
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        target.Character.HumanoidRootPart.Velocity = Vector3.new(0,500,0)
    end
end})

PlayerTab:CreateButton({Name = "Freeze Player", Callback = function()
    local target = getTarget()
    if target and target.Character then
        for _, part in pairs(target.Character:GetChildren()) do
            if part:IsA("BasePart") then part.Anchored = true end
        end
    end
end})

PlayerTab:CreateButton({Name = "Kick Player", Callback = function()
    local target = getTarget()
    if target then target:Kick("Kicked by nanayuzu hub") end
end})

-- ====================
-- Self Tab
-- ====================
local SelfTab = Window:CreateTab("Self",4483362458)
local Section = SelfTab:CreateSection("Self Boosts")

SelfTab:CreateSlider({Name = "WalkSpeed", Min=16, Max=500, Default=16, Callback=function(v) Hum.WalkSpeed=v end})
SelfTab:CreateSlider({Name = "JumpPower", Min=50, Max=500, Default=50, Callback=function(v) Hum.JumpPower=v end})

SelfTab:CreateToggle({Name="Infinite Jump", Default=false, Callback=function(v) _G.InfiniteJump=v end})
SelfTab:CreateToggle({Name="Super Strength", Default=false, Callback=function(v) _G.SuperStrength=v end})

game:GetService("UserInputService").JumpRequest:Connect(function()
    if _G.InfiniteJump then Hum:ChangeState(Enum.HumanoidStateType.Jumping) end
end)

-- ====================
-- Aura Tab
-- ====================
local AuraTab = Window:CreateTab("Aura",4483362458)
local Section = AuraTab:CreateSection("Aura Actions")

AuraTab:CreateToggle({Name="Kill Aura", Default=false, Callback=function(v) _G.KillAura=v end})
AuraTab:CreateToggle({Name="Fling Aura", Default=false, Callback=function(v) _G.FlingAura=v end})
AuraTab:CreateToggle({Name="Pull Aura", Default=false, Callback=function(v) _G.PullAura=v end})
AuraTab:CreateToggle({Name="Slow Aura", Default=false, Callback=function(v) _G.SlowAura=v end})

spawn(function()
    while true do
        wait(0.1)
        for _,p in pairs(Players:GetPlayers()) do
            if p~=LocalPlayer and p.Character and p.Character:FindFirstChild("Humanoid") then
                if _G.KillAura then p.Character.Humanoid.Health=0 end
                if _G.FlingAura then p.Character.HumanoidRootPart.Velocity=Vector3.new(0,100,0) end
                -- Pull/Slow can be implemented here
            end
        end
    end
end)

-- ====================
-- Anti Tab
-- ====================
local AntiTab = Window:CreateTab("Anti",4483362458)
AntiTab:CreateToggle({Name="Anti Grab", Default=false, Callback=function(v) _G.AntiGrab=v end})
AntiTab:CreateToggle({Name="Anti Kick", Default=false, Callback=function(v) _G.AntiKick=v end})
AntiTab:CreateToggle({Name="Anti Fling", Default=false, Callback=function(v) _G.AntiFling=v end})

-- ====================
-- Misc / Credits
-- ====================
local MiscTab = Window:CreateTab("Misc",4483362458)
MiscTab:CreateLabel("nanayuzu hub by YourName")

local CreditsTab = Window:CreateTab("Credits",4483362458)
CreditsTab:CreateLabel("Made by YourName")
CreditsTab:CreateLabel("Inspired by Blitz Hub")

Rayfield:Init()


