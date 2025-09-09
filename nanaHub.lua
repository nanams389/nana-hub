-- Rayfield 読み込み
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Nana Hub のウィンドウ
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

-- メインタブ
local MainTab = Window:CreateTab("Main", 4483362458)

-- 🔹 「物を飛ばす」ボタン（勉強用、処理は空）
MainTab:CreateButton({
    Name = "Launch Object",
    Callback = function()
        print("物を飛ばすボタンが押された（処理なし）")
    end,
})

-- 🔹 「プレイヤーを飛ばす」ボタン
MainTab:CreateButton({
    Name = "Launch Player",
    Callback = function()
        print("プレイヤーを飛ばすボタンが押された（処理なし）")
    end,
})

-- 🔹 「全員キル」ボタン
MainTab:CreateButton({
    Name = "Kill All Players",
    Callback = function()
        print("全員キルボタンが押された（処理なし）")
    end,
})

-- 🔹 「閉じる」ボタン
MainTab:CreateButton({
    Name = "Close Hub",
    Callback = function()
        Rayfield:Destroy()
    end,
})
