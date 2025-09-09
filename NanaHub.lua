-- Rayfield 読み込み
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Nana Hub ウィンドウ作成（Blitz Hub風デザイン）
local Window = Rayfield:CreateWindow({
    Name = "nana hub",
    LoadingTitle = "nana hub",
    LoadingSubtitle = "UI Study Only",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "NanaHubConfig",
        FileName = "NanaHub"
    }
})

-- ========================
-- 🔹 Mainタブ
-- ========================
local MainTab = Window:CreateTab("Main", 4483362458)

-- ボタン類
MainTab:CreateButton({Name = "Launch Object", Callback = function() print("物を飛ばすボタン（勉強用）") end})
MainTab:CreateButton({Name = "Launch Player", Callback = function() print("プレイヤーを飛ばすボタン（勉強用）") end})
MainTab:CreateButton({Name = "Kill All Players", Callback = function() print("全員キルボタン（勉強用）") end})
MainTab:CreateButton({Name = "Kick Player", Callback = function() print("Kick Playerボタン（勉強用）") end})
MainTab:CreateButton({Name = "Kill All", Callback = function() print("Kill Allボタン（勉強用）") end})
MainTab:CreateButton({Name = "Ride Blobman", Callback = function() print("Blobmanに乗るボタン（勉強用）") end})
MainTab:CreateButton({Name = "Blob Kick", Callback = function() print("Blob Kickボタン（勉強用）") end})
MainTab:CreateButton({Name = "Close Hub", Callback = function() Rayfield:Destroy() end})

-- スライダー類（Speed & Jump Power）
MainTab:CreateSlider({
    Name = "Speed",
    Range = {16,100},
    Increment = 1,
    Suffix = " stud/s",
    CurrentValue = 16,
    Flag = "SpeedFlag",
    Callback = function(value) print("Speed変更:", value) end
})

MainTab:CreateSlider({
    Name = "Jump Power",
    Range = {50,500},
    Increment = 5,
    Suffix = " stud",
    CurrentValue = 50,
    Flag = "JumpFlag",
    Callback = function(value) print("Jump Power変更:", value) end
})

-- スピードアップ・ジャンプ力ボタン（勉強用）
MainTab:CreateButton({Name = "Apply Speed", Callback = function()
    print("Speed適用ボタン（勉強用）:", Rayfield.Flags.SpeedFlag.Value)
end})

MainTab:CreateButton({Name = "Apply Jump", Callback = function()
    print("Jump Power適用ボタン（勉強用）:", Rayfield.Flags.JumpFlag.Value)
end})

-- トグル類（Anti系）
MainTab:CreateToggle({Name = "Anti Grab", CurrentValue = false, Flag = "AntiGrabFlag", Callback = function(value) print("Anti Grab "..(value and "ON" or "OFF")) end})
MainTab:CreateToggle({Name = "Anti Kick", CurrentValue = false, Flag = "AntiKickFlag", Callback = function(value) print("Anti Kick "..(value and "ON" or "OFF")) end})
MainTab:CreateToggle({Name = "Anti Lag", CurrentValue = false, Flag = "AntiLagFlag", Callback = function(value) print("Anti Lag "..(value and "ON" or "OFF")) end})

-- ========================
-- 🔹 Homeタブ（整理用）
-- ========================
local HomeTab = Window:CreateTab("Home", 4483362458)
HomeTab:CreateButton({Name = "Welcome Message", Callback = function() print("Welcomeボタン（勉強用）") end})
HomeTab:CreateButton({Name = "About Hub", Callback = function() print("About Hubボタン（勉強用）") end})
HomeTab:CreateSlider({Name = "Dummy Slider", Range = {0,10}, Increment = 1, Suffix = "", CurrentValue = 0, Flag = "DummyFlag", Callback = function(value) print("Dummy Slider:", value) end})
HomeTab:CreateToggle({Name = "Dummy Toggle", CurrentValue = false, Flag = "DummyToggleFlag", Callback = function(value) print("Dummy Toggle "..(value and "ON" or "OFF")) end})

