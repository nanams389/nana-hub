-- Rayfield 読み込み
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/LinoriaLib/OrionLib/main/src/Orion.lua"))()

-- ウィンドウ作成
local Window = Rayfield:CreateWindow({
    Name = "nyz hub",
    LoadingTitle = "Loading nyz hub...",
    LoadingSubtitle = "by あなたの名前",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "nyzHubConfigs",
       FileName = "Config1"
    },
    Discord = {
       Enabled = false, -- Discord 統合を使う場合 true に
    },
    KeySystem = false -- キー認証を付けたい場合 true に
})

-- タブ作成例
local GrabsTab = Window:CreateTab("Grabs")
local AntiTab = Window:CreateTab("Anti")
local AutoTab = Window:CreateTab("Autos")
local MiscTab = Window:CreateTab("Misc")
local GrabLineTab = Window:CreateTab("Grab Line")
local BlobmanTab = Window:CreateTab("Blobman")

-- Grabs タブのボタン例
GrabsTab:CreateButton({
    Name = "Grab Player",
    Callback = function()
        print("Grab ボタン押された")
    end
})

GrabsTab:CreateSlider({
    Name = "Reach Distance",
    Range = {0, 50},
    Increment = 1,
    Suffix = "Studs",
    CurrentValue = 30,
    Flag = "ReachSlider",
    Callback = function(Value)
        print("Reach Distance set to "..Value)
    end
})

GrabsTab:CreateToggle({
    Name = "Silent Aim",
    CurrentValue = false,
    Flag = "SilentAimToggle",
    Callback = function(Value)
        print("Silent Aim: "..tostring(Value))
    end
})

-- Auto タブのトグル例
AutoTab:CreateToggle({
    Name = "Auto Clutch",
    CurrentValue = false,
    Flag = "AutoClutchToggle",
    Callback = function(Value)
        print("Auto Clutch: "..tostring(Value))
    end
})

-- Anti タブのトグル例
AntiTab:CreateToggle({
    Name = "Anti Grab",
    CurrentValue = false,
    Flag = "AntiGrabToggle",
    Callback = function(Value)
        print("Anti Grab: "..tostring(Value))
    end
})

-- Misc タブのスライダー例
MiscTab:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 200},
    Increment = 1,
    Suffix = "Studs/s",
    CurrentValue = 16,
    Flag = "WalkSpeedSlider",
    Callback = function(Value)
        print("Walk Speed set to "..Value)
    end
})

-- Rayfield UI 初期化完了
print("nyz hub UI loaded successfully!")
