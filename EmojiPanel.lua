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
mainPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
mainPanel.BackgroundTransparency = 0.05
mainPanel.BorderSizePixel = 0
mainPanel.Parent = screenGui

-- Panel köşeleri
local panelCorner = Instance.new("UICorner")
panelCorner.CornerRadius = UDim.new(0, 16)
panelCorner.Parent = mainPanel

-- Panel kenarı (stroke)
local panelStroke = Instance.new("UIStroke")
panelStroke.Color = Color3.fromRGB(100, 180, 255)
panelStroke.Thickness = 1.5
panelStroke.Transparency = 0.3
panelStroke.Parent = mainPanel

-- Geri plan gradient efekti (fake)
local glowBackground = Instance.new("Frame")
glowBackground.Name = "GlowBg"
glowBackground.Size = UDim2.new(1, 30, 1, 30)
glowBackground.Position = UDim2.new(0, -15, 0, -15)
glowBackground.BackgroundColor3 = Color3.fromRGB(100, 180, 255)
glowBackground.BackgroundTransparency = 0.95
glowBackground.BorderSizePixel = 0
glowBackground.ZIndex = 0
glowBackground.Parent = mainPanel

local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(0, 20)
glowCorner.Parent = glowBackground

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
	{emoji = "🧪", value = "12/30", color = Color3.fromRGB(150, 100, 255)},
	{emoji = "🌿", value = "28/45", color = Color3.fromRGB(100, 200, 100)},
	{emoji = "🔍", value = "4/10", color = Color3.fromRGB(255, 200, 100)},
}

-- Herbir stat için kutu oluştur
for _, stat in ipairs(stats) do
	local statBox = Instance.new("Frame")
	statBox.Name = "StatBox"
	statBox.Size = UDim2.new(0, 70, 0, 100)
	statBox.BackgroundColor3 = Color3.fromRGB(35, 40, 50)
	statBox.BorderSizePixel = 0
	statBox.Parent = contentFrame

	-- Kutu köşeleri
	local boxCorner = Instance.new("UICorner")
	boxCorner.CornerRadius = UDim.new(0, 12)
	boxCorner.Parent = statBox

	-- Kutu kenarı (renkli stroke)
	local boxStroke = Instance.new("UIStroke")
	boxStroke.Color = stat.color
	boxStroke.Thickness = 1.5
	boxStroke.Transparency = 0.4
	boxStroke.Parent = statBox

	-- Emoji label
	local emojiLabel = Instance.new("TextLabel")
	emojiLabel.Name = "Emoji"
	emojiLabel.Size = UDim2.new(1, 0, 0, 45)
	emojiLabel.Position = UDim2.new(0, 0, 0, 10)
	emojiLabel.BackgroundTransparency = 1
	emojiLabel.Text = stat.emoji
	emojiLabel.TextColor3 = stat.color
	emojiLabel.Font = Enum.Font.GothamBold
	emojiLabel.TextSize = 32
	emojiLabel.Parent = statBox

	-- Value label
	local valueLabel = Instance.new("TextLabel")
	valueLabel.Name = "Value"
	valueLabel.Size = UDim2.new(1, -8, 0, 30)
	valueLabel.Position = UDim2.new(0, 4, 0, 55)
	valueLabel.BackgroundTransparency = 1
	valueLabel.Text = stat.value
	valueLabel.TextColor3 = Color3.fromRGB(200, 220, 255)
	valueLabel.Font = Enum.Font.GothamBold
	valueLabel.TextSize = 13
	valueLabel.TextScaled = true
	valueLabel.Parent = statBox

	-- Hover animasyonu
	local originalColor = statBox.BackgroundColor3
	local hoverColor = Color3.fromRGB(50, 60, 80)

	statBox.MouseEnter:Connect(function()
		local tweenInfo = TweenInfo.new(
			0.15,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		)
		local tween = game:GetService("TweenService"):Create(statBox, tweenInfo, {BackgroundColor3 = hoverColor})
		tween:Play()

		boxStroke.Thickness = 2.5
		boxStroke.Transparency = 0.2
	end)

	statBox.MouseLeave:Connect(function()
		local tweenInfo = TweenInfo.new(
			0.15,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		)
		local tween = game:GetService("TweenService"):Create(statBox, tweenInfo, {BackgroundColor3 = originalColor})
		tween:Play()

		boxStroke.Thickness = 1.5
		boxStroke.Transparency = 0.4
	end)
end

-- Panel fade-in animasyonu
mainPanel.BackgroundTransparency = 1
panelStroke.Transparency = 1

local fadeInfo = TweenInfo.new(
	0.8,
	Enum.EasingStyle.Quad,
	Enum.EasingDirection.Out
)

local fadeTween = game:GetService("TweenService"):Create(mainPanel, fadeInfo, {BackgroundTransparency = 0.05})
fadeTween:Play()

local strokeFadeInfo = TweenInfo.new(
	0.8,
	Enum.EasingStyle.Quad,
	Enum.EasingDirection.Out
)

local strokeTween = game:GetService("TweenService"):Create(panelStroke, strokeFadeInfo, {Transparency = 0.3})
strokeTween:Play()
