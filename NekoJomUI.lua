-- Gui to Lua with Tab Switching
-- Version: 3.2

-- Instances:
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Sidebar = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local ContentFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")

-- Parent GUI
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Frame
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.2, 0, 0.1, 0)
MainFrame.Size = UDim2.new(0, 600, 0, 400)

UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- Sidebar
Sidebar.Name = "Sidebar"
Sidebar.Parent = MainFrame
Sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
Sidebar.Size = UDim2.new(0, 150, 1, 0)

-- Function to create sidebar buttons
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

local HomeBtn = createButton("HomeBtn", "🏠 Home", 20)
local ScriptBtn = createButton("ScriptBtn", "📜 Script", 70)
local PlayersBtn = createButton("PlayersBtn", "👥 Players", 120)
local TeleportBtn = createButton("TeleportBtn", "📍 Teleport", 170)
local SettingsBtn = createButton("SettingsBtn", "⚙ Settings", 220)

-- Content Frame
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

-- Function to clear old content
local function clearContent()
	for _, v in pairs(ContentFrame:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "Title" then
			v:Destroy()
		end
	end
end

-- Function to create box content
local function createBox(title, desc, posY)
	local Box = Instance.new("Frame")
	Box.Parent = ContentFrame
	Box.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
	Box.Position = UDim2.new(0, 0, 0, posY)
	Box.Size = UDim2.new(1, -20, 0, 70)

	local BoxTitle = Instance.new("TextLabel")
	BoxTitle.Parent = Box
	BoxTitle.BackgroundTransparency = 1
	BoxTitle.Position = UDim2.new(0, 10, 0, 5)
	BoxTitle.Size = UDim2.new(1, -20, 0, 20)
	BoxTitle.Font = Enum.Font.GothamBold
	BoxTitle.Text = title
	BoxTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	BoxTitle.TextSize = 16
	BoxTitle.TextXAlignment = Enum.TextXAlignment.Left

	local BoxDesc = Instance.new("TextLabel")
	BoxDesc.Parent = Box
	BoxDesc.BackgroundTransparency = 1
	BoxDesc.Position = UDim2.new(0, 10, 0, 30)
	BoxDesc.Size = UDim2.new(1, -20, 0, 30)
	BoxDesc.Font = Enum.Font.Gotham
	BoxDesc.Text = desc
	BoxDesc.TextColor3 = Color3.fromRGB(200, 200, 200)
	BoxDesc.TextSize = 14
	BoxDesc.TextXAlignment = Enum.TextXAlignment.Left

	return Box
end

-- Tab switching functions
HomeBtn.MouseButton1Click:Connect(function()
	Title.Text = "Home"
	clearContent()
	createBox("Welcome To My Script", "หากสคริปต์ไหนใช้ไม่ได้โปรดติดต่อที่ Discord", 50)
	createBox("Discord Invite", "กดเพื่อคัดลอกลิงก์ Discord", 130)
end)

ScriptBtn.MouseButton1Click:Connect(function()
	Title.Text = "Script"
	clearContent()
	createBox("Script Hub", "รวม Script ต่างๆ เอาไว้ที่นี่", 50)
end)

PlayersBtn.MouseButton1Click:Connect(function()
	Title.Text = "Players"
	clearContent()
	createBox("Player List", "แสดงรายชื่อผู้เล่นทั้งหมด", 50)
end)

TeleportBtn.MouseButton1Click:Connect(function()
	Title.Text = "Teleport"
	clearContent()
	createBox("Teleport Menu", "เลือกจุดที่จะวาร์ป", 50)
end)

SettingsBtn.MouseButton1Click:Connect(function()
	Title.Text = "Settings"
	clearContent()
	createBox("UI Settings", "ปรับแต่ง UI ที่นี่", 50)
end)

-- Show Home by default
HomeBtn.MouseButton1Click:Fire()
