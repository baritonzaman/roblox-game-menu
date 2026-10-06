local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Ana ScreenGui oluştur
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PremiumEmojiPanel"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

-- Ana panel
local mainPanel = Instance.new("Frame")
mainPanel.Name = "MainPanel"
mainPanel.Size = UDim2.new(0, 260, 0, 130)
mainPanel.Position = UDim2.new(1, -280, 1, -150)
mainPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
mainPanel.BackgroundTransparency = 0
mainPanel.BorderSizePixel = 0
mainPanel.Parent = screenGui

-- Panel köşeleri
local panelCorner = Instance.new("UICorner")
panelCorner.CornerRadius = UDim.new(0, 12)
panelCorner.Parent = mainPanel

-- Panel kenarı (subtle stroke)
local panelStroke = Instance.new("UIStroke")
panelStroke.Color = Color3.fromRGB(80, 80, 90)
panelStroke.Thickness = 1
panelStroke.Transparency = 0.5
panelStroke.Parent = mainPanel

-- Filigran arka plan (büyük emoji)
local watermarkLabel = Instance.new("TextLabel")
watermarkLabel.Name = "Watermark"
watermarkLabel.Size = UDim2.new(1, 0, 1, 0)
watermarkLabel.Position = UDim2.new(0, 0, 0, 0)
watermarkLabel.BackgroundTransparency = 1
watermarkLabel.Text = "🧪"
watermarkLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
watermarkLabel.Font = Enum.Font.GothamBold
watermarkLabel.TextSize = 120
watermarkLabel.TextTransparency = 0.85
watermarkLabel.ZIndex = 0
watermarkLabel.Parent = mainPanel

-- İçerik container
local contentFrame = Instance.new("Frame")
contentFrame.Name = "Content"
contentFrame.Size = UDim2.new(1, -20, 1, -20)
contentFrame.Position = UDim2.new(0, 10, 0, 10)
contentFrame.BackgroundTransparency = 1
contentFrame.ZIndex = 1
contentFrame.Parent = mainPanel

-- Grid layout
local gridLayout = Instance.new("UIGridLayout")
gridLayout.CellSize = UDim2.new(0, 70, 0, 100)
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

-- Herbir stat için kutu oluştur
for _, stat in ipairs(stats) do
	local statBox = Instance.new("Frame")
	statBox.Name = "StatBox"
	statBox.Size = UDim2.new(0, 70, 0, 100)
	statBox.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
	statBox.BorderSizePixel = 0
	statBox.Parent = contentFrame

	-- Kutu köşeleri
	local boxCorner = Instance.new("UICorner")
	boxCorner.CornerRadius = UDim.new(0, 8)
	boxCorner.Parent = statBox

	-- Kutu kenarı (subtle)
	local boxStroke = Instance.new("UIStroke")
	boxStroke.Color = Color3.fromRGB(70, 70, 85)
	boxStroke.Thickness = 0.8
	boxStroke.Transparency = 0.6
	boxStroke.Parent = statBox

	-- Emoji label
	local emojiLabel = Instance.new("TextLabel")
	emojiLabel.Name = "Emoji"
	emojiLabel.Size = UDim2.new(1, 0, 0, 45)
	emojiLabel.Position = UDim2.new(0, 0, 0, 12)
	emojiLabel.BackgroundTransparency = 1
	emojiLabel.Text = stat.emoji
	emojiLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	emojiLabel.Font = Enum.Font.GothamBold
	emojiLabel.TextSize = 28
	emojiLabel.Parent = statBox

	-- Value label
	local valueLabel = Instance.new("TextLabel")
	valueLabel.Name = "Value"
	valueLabel.Size = UDim2.new(1, 0, 0, 25)
	valueLabel.Position = UDim2.new(0, 0, 0, 57)
	valueLabel.BackgroundTransparency = 1
	valueLabel.Text = stat.value
	valueLabel.TextColor3 = Color3.fromRGB(180, 180, 190)
	valueLabel.Font = Enum.Font.Gotham
	valueLabel.TextSize = 11
	valueLabel.Parent = statBox

	-- Hover animasyonu
	local originalColor = statBox.BackgroundColor3
	local hoverColor = Color3.fromRGB(45, 45, 60)

	statBox.MouseEnter:Connect(function()
		local tweenInfo = TweenInfo.new(
			0.2,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		)
		local tween = game:GetService("TweenService"):Create(statBox, tweenInfo, {BackgroundColor3 = hoverColor})
		tween:Play()

		boxStroke.Transparency = 0.3
	end)

	statBox.MouseLeave:Connect(function()
		local tweenInfo = TweenInfo.new(
			0.2,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		)
		local tween = game:GetService("TweenService"):Create(statBox, tweenInfo, {BackgroundColor3 = originalColor})
		tween:Play()

		boxStroke.Transparency = 0.6
	end)
end

-- Panel fade-in animasyonu
mainPanel.BackgroundTransparency = 1
panelStroke.Transparency = 1

local fadeInfo = TweenInfo.new(
	0.6,
	Enum.EasingStyle.Quad,
	Enum.EasingDirection.Out
)

local fadeTween = game:GetService("TweenService"):Create(mainPanel, fadeInfo, {BackgroundTransparency = 0})
fadeTween:Play()

local strokeFadeInfo = TweenInfo.new(
	0.6,
	Enum.EasingStyle.Quad,
	Enum.EasingDirection.Out
)

local strokeTween = game:GetService("TweenService"):Create(panelStroke, strokeFadeInfo, {Transparency = 0.5})
strokeTween:Play()
