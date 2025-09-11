local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Sidebar = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local HomeBtn = Instance.new("TextButton")
local ScriptBtn = Instance.new("TextButton")
local PlayersBtn = Instance.new("TextButton")
local TeleportBtn = Instance.new("TextButton")
local SettingsBtn = Instance.new("TextButton")
local ContentFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Box1 = Instance.new("Frame")
local Box1Title = Instance.new("TextLabel")
local Box1Desc = Instance.new("TextLabel")
local Box2 = Instance.new("Frame")
local Box2Title = Instance.new("TextLabel")
local Box2Desc = Instance.new("TextLabel")

-- Properties:
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.2, 0, 0.1, 0)
MainFrame.Size = UDim2.new(0, 600, 0, 400)

Sidebar.Name = "Sidebar"
Sidebar.Parent = MainFrame
Sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
Sidebar.Size = UDim2.new(0, 150, 1, 0)

UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- Buttons
local function createButton(name, text, posY)
	local btn = Instance.new("TextButton")
	btn.Name = name
	btn.Parent = Sidebar
	btn.BackgroundTransparency = 1
	btn.Position = UDim2.new(0, 0, 0, posY)
	btn.Size = UDim2.new(1, 0, 0, 40)
	btn.Font = Enum.Font.Gotham
	btn.Text = text
	btn.TextColor3 = Color3.fromRGB(220, 220, 220)
	btn.TextSize = 16
	return btn
end

HomeBtn = createButton("HomeBtn", "🏠 Home", 20)
ScriptBtn = createButton("ScriptBtn", "📜 Script", 70)
PlayersBtn = createButton("PlayersBtn", "👥 Players", 120)
TeleportBtn = createButton("TeleportBtn", "📍 Teleport", 170)
SettingsBtn = createButton("SettingsBtn", "⚙ Settings", 220)

-- Content
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 1
ContentFrame.Position = UDim2.new(0, 160, 0, 10)
ContentFrame.Size = UDim2.new(1, -170, 1, -20)

Title.Name = "Title"
Title.Parent = ContentFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "Home"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 24
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Box 1
Box1.Name = "Box1"
Box1.Parent = ContentFrame
Box1.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
Box1.Position = UDim2.new(0, 0, 0, 50)
Box1.Size = UDim2.new(1, -20, 0, 70)
Box1Title.Name = "Box1Title"
Box1Title.Parent = Box1
Box1Title.BackgroundTransparency = 1
Box1Title.Position = UDim2.new(0, 10, 0, 5)
Box1Title.Size = UDim2.new(1, -20, 0, 20)
Box1Title.Font = Enum.Font.GothamBold
Box1Title.Text = "Welcome To My Script"
Box1Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Box1Title.TextSize = 16
Box1Title.TextXAlignment = Enum.TextXAlignment.Left

Box1Desc.Name = "Box1Desc"
Box1Desc.Parent = Box1
Box1Desc.BackgroundTransparency = 1
Box1Desc.Position = UDim2.new(0, 10, 0, 30)
Box1Desc.Size = UDim2.new(1, -20, 0, 30)
Box1Desc.Font = Enum.Font.Gotham
Box1Desc.Text = "หากสคริปต์ไหนใช้ไม่ได้โปรดติดต่อที่ดิสคอร์ดด้านล่าง"
Box1Desc.TextColor3 = Color3.fromRGB(200, 200, 200)
Box1Desc.TextSize = 14
Box1Desc.TextXAlignment = Enum.TextXAlignment.Left

-- Box 2
Box2.Name = "Box2"
Box2.Parent = ContentFrame
Box2.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
Box2.Position = UDim2.new(0, 0, 0, 130)
Box2.Size = UDim2.new(1, -20, 0, 50)
Box2Title.Name = "Box2Title"
Box2Title.Parent = Box2
Box2Title.BackgroundTransparency = 1
Box2Title.Position = UDim2.new(0, 10, 0, 5)
Box2Title.Size = UDim2.new(1, -20, 0, 20)
Box2Title.Font = Enum.Font.GothamBold
Box2Title.Text = "Discord Invite"
Box2Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Box2Title.TextSize = 16
Box2Title.TextXAlignment = Enum.TextXAlignment.Left

Box2Desc.Name = "Box2Desc"
Box2Desc.Parent = Box2
Box2Desc.BackgroundTransparency = 1
Box2Desc.Position = UDim2.new(0, 10, 0, 25)
Box2Desc.Size = UDim2.new(1, -20, 0, 20)
Box2Desc.Font = Enum.Font.Gotham
Box2Desc.Text = "กดเพื่อคัดลอกลิงก์ดิสคอร์ด"
Box2Desc.TextColor3 = Color3.fromRGB(200, 200, 200)
Box2Desc.TextSize = 14
Box2Desc.TextXAlignment = Enum.TextXAlignment.Left
