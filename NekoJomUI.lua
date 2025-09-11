--// Roblox UI | รวมเมนู + ปุ่มจัดการหน้าต่าง + ย้ายได้
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 600, 0, 400)
mainFrame.Position = UDim2.new(0.2, 0, 0.2, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
mainFrame.BackgroundTransparency = 0.15
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- Corner
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 12)
uiCorner.Parent = mainFrame

-- Header
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 30)
header.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
header.BorderSizePixel = 0
header.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 12)
headerCorner.Parent = header

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -90, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "NekoJom | All Scripts"
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

-- ปุ่มปิด/ย่อ/ขยาย
local function createHeaderButton(txt, pos)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 30, 0, 30)
    btn.Position = pos
    btn.BackgroundTransparency = 1
    btn.Text = txt
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.Parent = header
    return btn
end

local closeBtn = createHeaderButton("X", UDim2.new(1, -30, 0, 0))
local minimizeBtn = createHeaderButton("-", UDim2.new(1, -60, 0, 0))
local maximizeBtn = createHeaderButton("▢", UDim2.new(1, -90, 0, 0))

-- โลโก้เวลาพับ
local logoBtn = Instance.new("ImageButton")
logoBtn.Size = UDim2.new(0, 60, 0, 60)
logoBtn.Position = UDim2.new(0.02, 0, 0.1, 0)
logoBtn.BackgroundTransparency = 1
logoBtn.Visible = false
logoBtn.Image = "rbxassetid://YOUR_LOGO_IMAGE_ID" -- << ใส่ asset id ของโลโก้ที่อัปไว้
logoBtn.Parent = screenGui

-- ฟังก์ชันปุ่ม
local minimized = false
local maximized = false
local oldSize = mainFrame.Size
local oldPos = mainFrame.Position

closeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    logoBtn.Visible = true
end)

minimizeBtn.MouseButton1Click:Connect(function()
    if not minimized then
        mainFrame.Visible = false
        logoBtn.Visible = true
        minimized = true
    end
end)

logoBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = true
    logoBtn.Visible = false
    minimized = false
end)

maximizeBtn.MouseButton1Click:Connect(function()
    if not maximized then
        oldSize = mainFrame.Size
        oldPos = mainFrame.Position
        mainFrame.Size = UDim2.new(1, -40, 1, -40)
        mainFrame.Position = UDim2.new(0, 20, 0, 20)
        maximized = true
    else
        mainFrame.Size = oldSize
        mainFrame.Position = oldPos
        maximized = false
    end
end)

--// Sidebar Menu
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 200, 1, -30)
sidebar.Position = UDim2.new(0, 0, 0, 30)
sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
sidebar.BorderSizePixel = 0
sidebar.Parent = mainFrame

local sidebarLayout = Instance.new("UIListLayout")
sidebarLayout.Padding = UDim.new(0, 5)
sidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
sidebarLayout.Parent = sidebar

-- Function สร้างปุ่มเมนู
local function createMenuButton(text, icon)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.Position = UDim2.new(0, 5, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    btn.Text = "   " .. text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.TextColor3 = Color3.fromRGB(220, 220, 220)
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = sidebar

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    local iconLabel = Instance.new("TextLabel")
    iconLabel.Size = UDim2.new(0, 30, 0, 40)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = icon
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.TextSize = 18
    iconLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    iconLabel.Parent = btn

    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    end)

    return btn
end

-- เมนูทั้งหมด
local homeBtn = createMenuButton("Home", "🏠")
local scriptBtn = createMenuButton("Script", "📜")
local playersBtn = createMenuButton("Players", "👤")
local teleportBtn = createMenuButton("Teleport", "📍")
local settingsBtn = createMenuButton("Settings", "⚙")
