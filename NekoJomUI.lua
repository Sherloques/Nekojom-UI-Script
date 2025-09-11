-- Gui to Lua with Tab Switching + Window Control
-- Version: 4.0

local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local CloseBtn = Instance.new("TextButton")
local MinBtn = Instance.new("TextButton")
local MaxBtn = Instance.new("TextButton")
local Sidebar = Instance.new("Frame")
local ContentFrame = Instance.new("Frame")

-- Parent GUI
ScreenGui.Parent = player:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Frame
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainFrame.BackgroundTransparency = 0.15 -- โปร่งใสขึ้น
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.25, 0, 0.15, 0)
MainFrame.Size = UDim2.new(0, 650, 0, 420)

-- Top Bar
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
TopBar.BackgroundTransparency = 0.2
TopBar.Size = UDim2.new(1, 0, 0, 35)

TitleLabel.Parent = TopBar
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.Size = UDim2.new(1, -120, 1, 0)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "Nekojom | All Scripts | Example Hub"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 16
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- ปุ่ม Close (X)
CloseBtn.Parent = TopBar
CloseBtn.BackgroundTransparency = 1
CloseBtn.Size = UDim2.new(0, 35, 1, 0)
CloseBtn.Position = UDim2.new(1, -35, 0, 0)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
CloseBtn.TextSize = 18

-- ปุ่ม Maximize (⛶)
MaxBtn.Parent = TopBar
MaxBtn.BackgroundTransparency = 1
MaxBtn.Size = UDim2.new(0, 35, 1, 0)
MaxBtn.Position = UDim2.new(1, -70, 0, 0)
MaxBtn.Font = Enum.Font.GothamBold
MaxBtn.Text = "⛶"
MaxBtn.TextColor3 = Color3.fromRGB(180, 255, 180)
MaxBtn.TextSize = 16

-- ปุ่ม Minimize (-)
MinBtn.Parent = TopBar
MinBtn.BackgroundTransparency = 1
MinBtn.Size = UDim2.new(0, 35, 1, 0)
MinBtn.Position = UDim2.new(1, -105, 0, 0)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.fromRGB(255, 220, 100)
MinBtn.TextSize = 20

-- Sidebar
Sidebar.Name = "Sidebar"
Sidebar.Parent = MainFrame
Sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
Sidebar.BackgroundTransparency = 0.25
Sidebar.Position = UDim2.new(0, 0, 0, 35)
Sidebar.Size = UDim2.new(0, 160, 1, -35)

-- Content Frame
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 1
ContentFrame.Position = UDim2.new(0, 170, 0, 45)
ContentFrame.Size = UDim2.new(1, -180, 1, -55)

-- สร้างปุ่ม Sidebar
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

-- ฟังก์ชันล้างเนื้อหา
local function clearContent()
	for _, v in pairs(ContentFrame:GetChildren()) do
		v:Destroy()
	end
end

-- ฟังก์ชันสร้างกล่องข้อความ
local function createBox(title, desc, posY)
	local Box = Instance.new("Frame")
	Box.Parent = ContentFrame
	Box.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
	Box.BackgroundTransparency = 0.15
	Box.Position = UDim2.new(0, 0, 0, posY)
	Box.Size = UDim2.new(1, -10, 0, 70)

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

-- Tab switching
HomeBtn.MouseButton1Click:Connect(function()
	clearContent()
	createBox("Welcome To My Script", "หากสคริปต์ไหนใช้ไม่ได้ โปรดติดต่อ Discord", 20)
	createBox("Discord Invite", "กดเพื่อคัดลอกลิงก์ Discord", 110)
end)

ScriptBtn.MouseButton1Click:Connect(function()
	clearContent()
	createBox("Script Hub", "รวม Script ทั้งหมดไว้ที่นี่", 20)
end)

PlayersBtn.MouseButton1Click:Connect(function()
	clearContent()
	createBox("Player List", "แสดงรายชื่อผู้เล่นทั้งหมด", 20)
end)

TeleportBtn.MouseButton1Click:Connect(function()
	clearContent()
	createBox("Teleport Menu", "เลือกตำแหน่งที่จะวาร์ป", 20)
end)

SettingsBtn.MouseButton1Click:Connect(function()
	clearContent()
	createBox("UI Settings", "ปรับแต่ง UI ที่นี่", 20)
end)

-- Window Controls
local isMinimized = false
local isMaximized = false
local originalSize = MainFrame.Size
local originalPos = MainFrame.Position

CloseBtn.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

MinBtn.MouseButton1Click:Connect(function()
	if not isMinimized then
		TweenService:Create(MainFrame, TweenInfo.new(0.3), {
			Size = UDim2.new(0, 650, 0, 35)
		}):Play()
		isMinimized = true
	else
		TweenService:Create(MainFrame, TweenInfo.new(0.3), {
			Size = originalSize
		}):Play()
		isMinimized = false
	end
end)

MaxBtn.MouseButton1Click:Connect(function()
	if not isMaximized then
		originalSize = MainFrame.Size
		originalPos = MainFrame.Position
		TweenService:Create(MainFrame, TweenInfo.new(0.3), {
			Size = UDim2.new(1, -50, 1, -50),
			Position = UDim2.new(0, 25, 0, 25)
		}):Play()
		isMaximized = true
	else
		TweenService:Create(MainFrame, TweenInfo.new(0.3), {
			Size = originalSize,
			Position = originalPos
		}):Play()
		isMaximized = false
	end
end)

-- เปิด Home เป็นค่าเริ่มต้น
HomeBtn.MouseButton1Click:Fire()
