--[[
    noobhub+ Update Notice GUI (Mobile Optimized)
    作者: noob
    機能: スマホ対応で noobhub+ はアップデート中です
--]]

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NoobHubNotice"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- 背景（半透明で中央にフォーカス）
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bg.BackgroundTransparency = 0.35
bg.Parent = gui
bg.ZIndex = 1

-- メインウィンドウ
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.85, 0, 0.28, 0)
frame.Position = UDim2.new(0.075, 0, 0.36, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Parent = gui
frame.ZIndex = 2

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 20)
corner.Parent = frame

-- タイトル
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -30, 0.55, 0)
title.Position = UDim2.new(0, 15, 0.08, 0)
title.BackgroundTransparency = 1
title.Text = "noobhub+ はアップデート中です"
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255, 225, 0)
title.Font = Enum.Font.GothamBold
title.ZIndex = 3
title.Parent = frame

-- サブテキスト（小さく補足）
local subtext = Instance.new("TextLabel")
subtext.Size = UDim2.new(1, -20, 0.25, 0)
subtext.Position = UDim2.new(0, 10, 0.55, 0)
subtext.BackgroundTransparency = 1
subtext.Text = "少し機能を変更中です"
subtext.TextScaled = true
subtext.TextColor3 = Color3.fromRGB(230, 230, 230)
subtext.Font = Enum.Font.Gotham
subtext.ZIndex = 3
subtext.Parent = frame

-- 閉じるボタン（押しやすい大きめ）
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0.6, 0, 0.25, 0)
closeButton.Position = UDim2.new(0.2, 0, 0.75, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 230, 0)
closeButton.Text = "閉じる"
closeButton.TextScaled = true
closeButton.Font = Enum.Font.GothamBold
closeButton.TextColor3 = Color3.fromRGB(20, 20, 20)
closeButton.ZIndex = 4
closeButton.Parent = frame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 14)
btnCorner.Parent = closeButton

-- ドロップシャドウ
local shadow = Instance.new("ImageLabel")
shadow.Size = UDim2.new(1, 30, 1, 30)
shadow.Position = UDim2.new(0, -15, 0, -15)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://1316045217"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.6
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.ZIndex = 1
shadow.Parent = frame

-- フェードイン
for i = 1, 0, -0.05 do
	task.wait(0.03)
	bg.BackgroundTransparency = 0.35 + i * 0.65
	frame.BackgroundTransparency = i
	title.TextTransparency = i
	subtext.TextTransparency = i
	closeButton.TextTransparency = i
end

-- 閉じる処理（スムーズフェードアウト）
closeButton.MouseButton1Click:Connect(function()
	for i = 0, 1, 0.05 do
		task.wait(0.03)
		bg.BackgroundTransparency = 0.35 + i * 0.65
		frame.BackgroundTransparency = i
		title.TextTransparency = i
		subtext.TextTransparency = i
		closeButton.TextTransparency = i
	end
	gui:Destroy()
end)
