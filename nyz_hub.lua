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
       Enabled = false,
    },
    KeySystem = false
})

-- タブ作成
local GrabsTab = Window:CreateTab("Grabs")
local AntiTab = Window:CreateTab("Anti")
local AutoTab = Window:CreateTab("Autos")
local MiscTab = Window:CreateTab("Misc")
local GrabLineTab = Window:CreateTab("Grab Line")
local BlobmanTab = Window:CreateTab("Blobman")
local DiscordTab = Window:CreateTab("Discord")

------------------------
-- Grabs Tab
------------------------
GrabsTab:CreateButton({
    Name = "Grab Player",
    Callback = function()
        print("Grab ボタン押された")
        -- ここに掴む処理を実装
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
        -- ここにリーチ距離を反映
    end
})

GrabsTab:CreateToggle({
    Name = "Silent Aim",
    CurrentValue = false,
    Flag = "SilentAimToggle",
    Callback = function(Value)
        print("Silent Aim: "..tostring(Value))
        -- ここにサイレントエイム機能
    end
})

------------------------
-- Auto Tab
------------------------
AutoTab:CreateToggle({
    Name = "Auto Clutch",
    CurrentValue = false,
    Flag = "AutoClutchToggle",
    Callback = function(Value)
        print("Auto Clutch: "..tostring(Value))
        -- ここに自動クラッチ機能
    end
})

AutoTab:CreateToggle({
    Name = "Freeze Toggle(Auto Clutch)",
    CurrentValue = false,
    Flag = "FreezeToggle",
    Callback = function(Value)
        print("Freeze: "..tostring(Value))
        -- ここにフリーズ処理
    end
})

AutoTab:CreateSlider({
    Name = "Freeze Delay",
    Range = {1, 10},
    Increment = 1,
    Suffix = "s",
    CurrentValue = 5,
    Flag = "FreezeDelaySlider",
    Callback = function(Value)
        print("Freeze Delay set to "..Value)
        -- ここにディレイ設定
    end
})

------------------------
-- Anti Tab
------------------------
AntiTab:CreateToggle({
    Name = "Anti Grab",
    CurrentValue = false,
    Flag = "AntiGrabToggle",
    Callback = function(Value)
        print("Anti Grab: "..tostring(Value))
        -- ここにアンチグラブ処理
    end
})

------------------------
-- Misc Tab
------------------------
MiscTab:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 200},
    Increment = 1,
    Suffix = "Studs/s",
    CurrentValue = 16,
    Flag = "WalkSpeedSlider",
    Callback = function(Value)
        print("Walk Speed set to "..Value)
        -- ここにウォークスピード変更処理
    end
})

------------------------
-- Grab Line Tab
------------------------
GrabLineTab:CreateButton({
    Name = "Create Grab Line",
    Callback = function()
        print("Create Grab Line pressed")
        -- Grab Line 作成処理
    end
})

------------------------
-- Blobman Tab
------------------------
BlobmanTab:CreateButton({
    Name = "Spawn Blobman",
    Callback = function()
        print("Spawn Blobman pressed")
        -- Blobman 出現処理
    end
})

------------------------
-- Discord Tab
------------------------
DiscordTab:CreateButton({
    Name = "Join Our Discord",
    Callback = function()
        print("Discord Button Pressed")
        -- サーバー URL を開く
        local url = "https://discord.gg/あなたのサーバー"
        if syn then
            syn.request({Url = url, Method = "GET"})
        else
            -- 通常環境では通知だけ
            print("Open Discord link manually: "..url)
        end
    end
})

------------------------
-- 完了メッセージ
------------------------
print("nyz hub UI loaded successfully!")

