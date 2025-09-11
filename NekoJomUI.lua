-- // ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomUI"
screenGui.Parent = game.CoreGui

-- // Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 650, 0, 400)
mainFrame.Position = UDim2.new(0.5, -325, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

-- // Top Bar
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 30)
topBar.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Text = "Nekojom | All Scripts"
title.Size = UDim2.new(1, -90, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = topBar

-- ปุ่ม Minimize / Maximize / Close
local function createTopButton(txt, posX)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 30, 1, 0)
    btn.Position = UDim2.new(1, posX, 0, 0)
    btn.BackgroundTransparency = 1
    btn.Text = txt
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.Parent = topBar
    return btn
end

local minimizeBtn = createTopButton("-", -90)
local maximizeBtn = createTopButton("□", -60)
local closeBtn = createTopButton("X", -30)

-- โลโก้ตอนย่อ
local minimizedLogo = Instance.new("ImageLabel")
minimizedLogo.Size = UDim2.new(0, 50, 0, 50)
minimizedLogo.Position = UDim2.new(0, 20, 0, 40)
minimizedLogo.BackgroundTransparency = 1
minimizedLogo.Image = "rbxassetid://118974663345349"
minimizedLogo.Visible = false
minimizedLogo.Parent = screenGui

-- ปิด
closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- ย่อ
local minimized = false
minimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    mainFrame.Visible = not minimized
    minimizedLogo.Visible = minimized
end)

-- ขยาย
local maximized = false
maximizeBtn.MouseButton1Click:Connect(function()
    if not maximized then
        mainFrame:TweenSize(UDim2.new(1, -40, 1, -40), "Out", "Sine", 0.3, true)
        mainFrame:TweenPosition(UDim2.new(0, 20, 0, 20), "Out", "Sine", 0.3, true)
    else
        mainFrame:TweenSize(UDim2.new(0, 650, 0, 400), "Out", "Sine", 0.3, true)
        mainFrame:TweenPosition(UDim2.new(0.5, -325, 0.5, -200), "Out", "Sine", 0.3, true)
    end
    maximized = not maximized
end)

-- // Sidebar Menu
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 180, 1, -30)
sidebar.Position = UDim2.new(0, 0, 0, 30)
sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
sidebar.BorderSizePixel = 0
sidebar.Parent = mainFrame

local sidebarLayout = Instance.new("UIListLayout")
sidebarLayout.Padding = UDim.new(0, 8)
sidebarLayout.FillDirection = Enum.FillDirection.Vertical
sidebarLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
sidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
sidebarLayout.Parent = sidebar

local function createMenuButton(text, icon)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 45)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.Parent = sidebar

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = btn

    local iconLabel = Instance.new("TextLabel")
    iconLabel.Size = UDim2.new(0, 40, 1, 0)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = icon
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.TextSize = 20
    iconLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    iconLabel.Parent = btn

    local txtLabel = Instance.new("TextLabel")
    txtLabel.Size = UDim2.new(1, -40, 1, 0)
    txtLabel.Position = UDim2.new(0, 40, 0, 0)
    txtLabel.BackgroundTransparency = 1
    txtLabel.Text = text
    txtLabel.Font = Enum.Font.GothamBold
    txtLabel.TextSize = 16
    txtLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    txtLabel.TextXAlignment = Enum.TextXAlignment.Left
    txtLabel.Parent = btn

    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
    end)

    return btn
end

-- เมนูทั้งหมด
local homeBtn = createMenuButton("Home", "🏠")
local scriptBtn = createMenuButton("Script", "📜")
local playersBtn = createMenuButton("Players", "👤")
local teleportBtn = createMenuButton("Teleport", "📍")
local settingsBtn = createMenuButton("Settings", "⚙")


