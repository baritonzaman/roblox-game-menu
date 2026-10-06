local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "WoWStylePanel"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

-- Dış frame (gölge/3D efekti)
local outerFrame = Instance.new("Frame")
outerFrame.Name = "OuterFrame"
outerFrame.Size = UDim2.new(0, 270, 0, 140)
outerFrame.Position = UDim2.new(1, -290, 1, -160)
outerFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
outerFrame.BorderSizePixel = 0
outerFrame.Parent = screenGui

local outerCorner = Instance.new("UICorner")
outerCorner.CornerRadius = UDim.new(0, 8)
outerCorner.Parent = outerFrame

-- Ana panel
local mainPanel = Instance.new("Frame")
mainPanel.Name = "MainPanel"
mainPanel.Size = UDim2.new(1, -4, 1, -4)
mainPanel.Position = UDim2.new(0, 2, 0, 2)
mainPanel.BackgroundColor3 = Color3.fromRGB(30, 20, 50)
mainPanel.BorderSizePixel = 0
mainPanel.Parent = outerFrame

local panelCorner = Instance.new("UICorner")
panelCorner.CornerRadius = UDim.new(0, 6)
panelCorner.Parent = mainPanel

-- Top border (altın/parlak çizgi)
local topBorder = Instance.new("Frame")
topBorder.Name = "TopBorder"
topBorder.Size = UDim2.new(1, 0, 0, 3)
topBorder.Position = UDim2.new(0, 0, 0, 0)
topBorder.BackgroundColor3 = Color3.fromRGB(200, 170, 100)
topBorder.BorderSizePixel = 0
topBorder.Parent = mainPanel

-- Bottom border (koyu altın)
local bottomBorder = Instance.new("Frame")
bottomBorder.Name = "BottomBorder"
bottomBorder.Size = UDim2.new(1, 0, 0, 3)
bottomBorder.Position = UDim2.new(0, 0, 1, -3)
bottomBorder.BackgroundColor3 = Color3.fromRGB(100, 80, 50)
bottomBorder.BorderSizePixel = 0
bottomBorder.Parent = mainPanel

-- Sol border (mor)
local leftBorder = Instance.new("Frame")
leftBorder.Name = "LeftBorder"
leftBorder.Size = UDim2.new(0, 2, 1, 0)
leftBorder.Position = UDim2.new(0, 0, 0, 0)
leftBorder.BackgroundColor3 = Color3.fromRGB(150, 100, 200)
leftBorder.BorderSizePixel = 0
leftBorder.Parent = mainPanel

-- Sağ border (mor)
local rightBorder = Instance.new("Frame")
rightBorder.Name = "RightBorder"
rightBorder.Size = UDim2.new(0, 2, 1, 0)
rightBorder.Position = UDim2.new(1, -2, 0, 0)
rightBorder.BackgroundColor3 = Color3.fromRGB(150, 100, 200)
rightBorder.BorderSizePixel = 0
rightBorder.Parent = mainPanel

-- İçerik
local contentFrame = Instance.new("Frame")
contentFrame.Name = "Content"
contentFrame.Size = UDim2.new(1, -4, 1, -6)
contentFrame.Position = UDim2.new(0, 2, 0, 3)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainPanel

local gridLayout = Instance.new("UIGridLayout")
gridLayout.CellSize = UDim2.new(0, 75, 0, 105)
gridLayout.CellPadding = UDim2.new(0, 8, 0, 0)
gridLayout.FillDirection = Enum.FillDirection.Horizontal
gridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
gridLayout.VerticalAlignment = Enum.VerticalAlignment.Center
gridLayout.Parent = contentFrame

-- Stat verileri
local stats = {
	{emoji = "🧪", value = "12/30"},
	{emoji = "🌿", value = "28/45"},
	{emoji = "🔍", value = "4/10"},
}

-- Herbir stat için WoW tarzı kutu
for _, stat in ipairs(stats) do
	-- Dış kutu (gölge)
	local boxOuter = Instance.new("Frame")
	boxOuter.Name = "BoxOuter"
	boxOuter.Size = UDim2.new(0, 75, 0, 105)
	boxOuter.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	boxOuter.BorderSizePixel = 0
	boxOuter.Parent = contentFrame

	local boxOuterCorner = Instance.new("UICorner")
	boxOuterCorner.CornerRadius = UDim.new(0, 4)
	boxOuterCorner.Parent = boxOuter

	-- İç kutu (ana arka plan)
	local box = Instance.new("Frame")
	box.Name = "StatBox"
	box.Size = UDim2.new(1, -2, 1, -2)
	box.Position = UDim2.new(0, 1, 0, 1)
	box.BackgroundColor3 = Color3.fromRGB(50, 30, 80)
	box.BorderSizePixel = 0
	box.Parent = boxOuter

	local boxCorner = Instance.new("UICorner")
	boxCorner.CornerRadius = UDim.new(0, 3)
	boxCorner.Parent = box

	-- Kutu top border (parlak)
	local boxTop = Instance.new("Frame")
	boxTop.Size = UDim2.new(1, 0, 0, 2)
	boxTop.Position = UDim2.new(0, 0, 0, 0)
	boxTop.BackgroundColor3 = Color3.fromRGB(180, 140, 220)
	boxTop.BorderSizePixel = 0
	boxTop.Parent = box

	-- Emoji
	local emojiLabel = Instance.new("TextLabel")
	emojiLabel.Size = UDim2.new(1, 0, 0, 50)
	emojiLabel.Position = UDim2.new(0, 0, 0, 8)
	emojiLabel.BackgroundTransparency = 1
	emojiLabel.Text = stat.emoji
	emojiLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	emojiLabel.Font = Enum.Font.GothamBold
	emojiLabel.TextSize = 32
	emojiLabel.Parent = box

	-- Value (altın yazı, WoW tarzı)
	local valueLabel = Instance.new("TextLabel")
	valueLabel.Size = UDim2.new(1, 0, 0, 25)
	valueLabel.Position = UDim2.new(0, 0, 0, 62)
	valueLabel.BackgroundTransparency = 1
	valueLabel.Text = stat.value
	valueLabel.TextColor3 = Color3.fromRGB(220, 180, 80)
	valueLabel.Font = Enum.Font.GothamBold
	valueLabel.TextSize = 12
	valueLabel.Parent = box

	-- Hover efekti
	local originalColor = box.BackgroundColor3
	local hoverColor = Color3.fromRGB(80, 50, 120)

	boxOuter.MouseEnter:Connect(function()
		local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local tween = game:GetService("TweenService"):Create(box, tweenInfo, {BackgroundColor3 = hoverColor})
		tween:Play()
		boxTop.BackgroundColor3 = Color3.fromRGB(255, 200, 100)
	end)

	boxOuter.MouseLeave:Connect(function()
		local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local tween = game:GetService("TweenService"):Create(box, tweenInfo, {BackgroundColor3 = originalColor})
		tween:Play()
		boxTop.BackgroundColor3 = Color3.fromRGB(180, 140, 220)
	end)
end

-- Fade-in animasyonu
mainPanel.BackgroundTransparency = 1
topBorder.BackgroundTransparency = 1
bottomBorder.BackgroundTransparency = 1
leftBorder.BackgroundTransparency = 1
rightBorder.BackgroundTransparency = 1

local fadeInfo = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local panelTween = game:GetService("TweenService"):Create(mainPanel, fadeInfo, {BackgroundTransparency = 0})
panelTween:Play()

local topTween = game:GetService("TweenService"):Create(topBorder, fadeInfo, {BackgroundTransparency = 0})
topTween:Play()

local bottomTween = game:GetService("TweenService"):Create(bottomBorder, fadeInfo, {BackgroundTransparency = 0})
bottomTween:Play()

local leftTween = game:GetService("TweenService"):Create(leftBorder, fadeInfo, {BackgroundTransparency = 0})
leftTween:Play()

local rightTween = game:GetService("TweenService"):Create(rightBorder, fadeInfo, {BackgroundTransparency = 0})
rightTween:Play()
