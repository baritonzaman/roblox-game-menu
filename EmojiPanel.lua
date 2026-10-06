local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "WoWRedPanel"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

-- Dış panel (gölge/3D efekti)
local outerPanel = Instance.new("Frame")
outerPanel.Name = "OuterPanel"
outerPanel.Size = UDim2.new(0, 280, 0, 150)
outerPanel.Position = UDim2.new(1, -300, 1, -170)
outerPanel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
outerPanel.BorderSizePixel = 0
outerPanel.Parent = screenGui

local outerCorner = Instance.new("UICorner")
outerCorner.CornerRadius = UDim.new(0, 8)
outerCorner.Parent = outerPanel

-- Ana panel
local mainPanel = Instance.new("Frame")
mainPanel.Name = "MainPanel"
mainPanel.Size = UDim2.new(1, -4, 1, -4)
mainPanel.Position = UDim2.new(0, 2, 0, 2)
mainPanel.BackgroundColor3 = Color3.fromRGB(40, 10, 10)
mainPanel.BorderSizePixel = 0
mainPanel.Parent = outerPanel

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 6)
mainCorner.Parent = mainPanel

-- Top border (altın/parlak çizgi - WoW tarzı)
local topBorder = Instance.new("Frame")
topBorder.Name = "TopBorder"
topBorder.Size = UDim2.new(1, 0, 0, 4)
topBorder.Position = UDim2.new(0, 0, 0, 0)
topBorder.BackgroundColor3 = Color3.fromRGB(220, 190, 90)
topBorder.BorderSizePixel = 0
topBorder.Parent = mainPanel

-- Bottom border (koyu altın)
local bottomBorder = Instance.new("Frame")
bottomBorder.Name = "BottomBorder"
bottomBorder.Size = UDim2.new(1, 0, 0, 4)
bottomBorder.Position = UDim2.new(0, 0, 1, -4)
bottomBorder.BackgroundColor3 = Color3.fromRGB(120, 80, 40)
bottomBorder.BorderSizePixel = 0
bottomBorder.Parent = mainPanel

-- Sol border (kırmızı)
local leftBorder = Instance.new("Frame")
leftBorder.Name = "LeftBorder"
leftBorder.Size = UDim2.new(0, 3, 1, 0)
leftBorder.Position = UDim2.new(0, 0, 0, 0)
leftBorder.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
leftBorder.BorderSizePixel = 0
leftBorder.Parent = mainPanel

-- Sağ border (kırmızı)
local rightBorder = Instance.new("Frame")
rightBorder.Name = "RightBorder"
rightBorder.Size = UDim2.new(0, 3, 1, 0)
rightBorder.Position = UDim2.new(1, -3, 0, 0)
rightBorder.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
rightBorder.BorderSizePixel = 0
rightBorder.Parent = mainPanel

-- İçerik alanı
local contentFrame = Instance.new("Frame")
contentFrame.Name = "Content"
contentFrame.Size = UDim2.new(1, -6, 1, -8)
contentFrame.Position = UDim2.new(0, 3, 0, 4)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainPanel

local gridLayout = Instance.new("UIGridLayout")
gridLayout.CellSize = UDim2.new(0, 78, 0, 110)
gridLayout.CellPadding = UDim2.new(0, 12, 0, 0)
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

-- Her bir stat için WoW tarzı kutu
for _, stat in ipairs(stats) do
	-- Dış kutu (gölge)
	local boxOuter = Instance.new("Frame")
	boxOuter.Name = "BoxOuter"
	boxOuter.Size = UDim2.new(0, 78, 0, 110)
	boxOuter.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	boxOuter.BorderSizePixel = 0
	boxOuter.Parent = contentFrame

	local boxOuterCorner = Instance.new("UICorner")
	boxOuterCorner.CornerRadius = UDim.new(0, 5)
	boxOuterCorner.Parent = boxOuter

	-- Ana kutu
	local box = Instance.new("Frame")
	box.Name = "StatBox"
	box.Size = UDim2.new(1, -2, 1, -2)
	box.Position = UDim2.new(0, 1, 0, 1)
	box.BackgroundColor3 = Color3.fromRGB(60, 20, 20)
	box.BorderSizePixel = 0
	box.Parent = boxOuter

	local boxCorner = Instance.new("UICorner")
	boxCorner.CornerRadius = UDim.new(0, 4)
	boxCorner.Parent = box

	-- Kutu top border (parlak altın)
	local boxTopBorder = Instance.new("Frame")
	boxTopBorder.Name = "BoxTopBorder"
	boxTopBorder.Size = UDim2.new(1, 0, 0, 3)
	boxTopBorder.Position = UDim2.new(0, 0, 0, 0)
	boxTopBorder.BackgroundColor3 = Color3.fromRGB(200, 160, 80)
	boxTopBorder.BorderSizePixel = 0
	boxTopBorder.Parent = box

	-- Kutu left border (kırmızı)
	local boxLeftBorder = Instance.new("Frame")
	boxLeftBorder.Name = "BoxLeftBorder"
	boxLeftBorder.Size = UDim2.new(0, 2, 1, 0)
	boxLeftBorder.Position = UDim2.new(0, 0, 0, 0)
	boxLeftBorder.BackgroundColor3 = Color3.fromRGB(160, 40, 40)
	boxLeftBorder.BorderSizePixel = 0
	boxLeftBorder.Parent = box

	-- Emoji label
	local emojiLabel = Instance.new("TextLabel")
	emojiLabel.Name = "Emoji"
	emojiLabel.Size = UDim2.new(1, 0, 0, 52)
	emojiLabel.Position = UDim2.new(0, 0, 0, 8)
	emojiLabel.BackgroundTransparency = 1
	emojiLabel.Text = stat.emoji
	emojiLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	emojiLabel.Font = Enum.Font.GothamBold
	emojiLabel.TextSize = 36
	emojiLabel.Parent = box

	-- Value label (altın yazı, WoW tarzı)
	local valueLabel = Instance.new("TextLabel")
	valueLabel.Name = "Value"
	valueLabel.Size = UDim2.new(1, -4, 0, 28)
	valueLabel.Position = UDim2.new(0, 2, 0, 66)
	valueLabel.BackgroundTransparency = 1
	valueLabel.Text = stat.value
	valueLabel.TextColor3 = Color3.fromRGB(255, 209, 100)
	valueLabel.Font = Enum.Font.GothamBold
	valueLabel.TextSize = 14
	valueLabel.TextScaled = true
	valueLabel.Parent = box

	-- Hover animasyonu
	local originalColor = box.BackgroundColor3
	local hoverColor = Color3.fromRGB(90, 30, 30)

	boxOuter.MouseEnter:Connect(function()
		local tweenInfo = TweenInfo.new(
			0.15,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		)
		local tween = game:GetService("TweenService"):Create(box, tweenInfo, {BackgroundColor3 = hoverColor})
		tween:Play()

		-- Top border parladığında altına dönüşsün
		local borderTween = game:GetService("TweenService"):Create(boxTopBorder, tweenInfo, {
			BackgroundColor3 = Color3.fromRGB(255, 220, 100)
		})
		borderTween:Play()
	end)

	boxOuter.MouseLeave:Connect(function()
		local tweenInfo = TweenInfo.new(
			0.15,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		)
		local tween = game:GetService("TweenService"):Create(box, tweenInfo, {BackgroundColor3 = originalColor})
		tween:Play()

		local borderTween = game:GetService("TweenService"):Create(boxTopBorder, tweenInfo, {
			BackgroundColor3 = Color3.fromRGB(200, 160, 80)
		})
		borderTween:Play()
	end)
end

-- Fade-in animasyonu
mainPanel.BackgroundTransparency = 1
topBorder.BackgroundTransparency = 1
bottomBorder.BackgroundTransparency = 1
leftBorder.BackgroundTransparency = 1
rightBorder.BackgroundTransparency = 1

local fadeInfo = TweenInfo.new(
	0.7,
	Enum.EasingStyle.Quad,
	Enum.EasingDirection.Out
)

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
