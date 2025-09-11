--// Roblox UI with Minimize, Maximize, Close, Drag, and Logo when minimized

-- Services
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 500, 0, 300)
mainFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BackgroundTransparency = 0.2
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

-- Title Text
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -90, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "NekoJom | Custom Hub"
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = titleBar

-- Buttons (Minimize, Maximize, Close)
local function createButton(name, text, posX)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 25, 0, 25)
    btn.Position = UDim2.new(1, posX, 0.1, 0)
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Parent = titleBar
    return btn
end

local minimizeBtn = createButton("Minimize", "_", -80)
local maximizeBtn = createButton("Maximize", "▢", -55)
local closeBtn = createButton("Close", "X", -30)

-- Content
local content = Instance.new("Frame")
content.Size = UDim2.new(1, 0, 1, -30)
content.Position = UDim2.new(0, 0, 0, 30)
content.BackgroundTransparency = 1
content.Parent = mainFrame

-- Example Label
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0, 50)
label.Position = UDim2.new(0, 0, 0, 10)
label.BackgroundTransparency = 1
label.Text = "Hello! This is your custom UI 🎉"
label.Font = Enum.Font.Gotham
label.TextSize = 18
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.Parent = content

-- Minimized Logo
local minimizedLogo = Instance.new("ImageButton")
minimizedLogo.Size = UDim2.new(0, 80, 0, 80)
minimizedLogo.Position = UDim2.new(0.05, 0, 0.7, 0)
minimizedLogo.Image = "rbxassetid://YOUR_IMAGE_ID" -- 👈 ใส่รูปโลโก้ตรงนี้
minimizedLogo.Visible = false
minimizedLogo.Parent = screenGui

-- Button Functions
local minimized = false
minimizeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    minimizedLogo.Visible = true
    minimized = true
end)

maximizeBtn.MouseButton1Click:Connect(function()
    if mainFrame.Size == UDim2.new(0, 500, 0, 300) then
        mainFrame.Size = UDim2.new(0.9, 0, 0.9, 0)
        mainFrame.Position = UDim2.new(0.05, 0, 0.05, 0)
    else
        mainFrame.Size = UDim2.new(0, 500, 0, 300)
        mainFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

minimizedLogo.MouseButton1Click:Connect(function()
    mainFrame.Visible = true
    minimizedLogo.Visible = false
    minimized = false
end)
