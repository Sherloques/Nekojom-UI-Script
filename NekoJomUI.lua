-- Roblox Custom Hub UI (เหมือน BONK HUB)
-- วางใน LocalScript (StarterPlayerScripts หรือ StarterGui)

local player = game.Players.LocalPlayer
local TweenService = game:GetService("TweenService")

-- ScreenGui
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "CustomHub"

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 500, 0, 320)
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -160)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = gui

local uiCorner = Instance.new("UICorner", mainFrame)
uiCorner.CornerRadius = UDim.new(0, 12)

local uiStroke = Instance.new("UIStroke", mainFrame)
uiStroke.Color = Color3.fromRGB(40, 120, 40)
uiStroke.Thickness = 2

-- Title Bar
local titleBar = Instance.new("Frame", mainFrame)
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
titleBar.BorderSizePixel = 0

local titleText = Instance.new("TextLabel", titleBar)
titleText.Size = UDim2.new(1, -50, 1, 0)
titleText.Position = UDim2.new(0, 10, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "BONK HUB • Key System | Free Version"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 18
titleText.TextXAlignment = Enum.TextXAlignment.Left

-- ปุ่มปิด (X)
local closeBtn = Instance.new("TextButton", titleBar)
closeBtn.Size = UDim2.new(0, 40, 1, 0)
closeBtn.Position = UDim2.new(1, -40, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 20

closeBtn.MouseButton1Click:Connect(function()
    mainFrame:Destroy()
end)

-- Section Roblox Game Info
local infoFrame = Instance.new("Frame", mainFrame)
infoFrame.Size = UDim2.new(1, -20, 0, 70)
infoFrame.Position = UDim2.new(0, 10, 0, 50)
infoFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
infoFrame.BorderSizePixel = 0
Instance.new("UICorner", infoFrame).CornerRadius = UDim.new(0, 10)

local gameIcon = Instance.new("ImageLabel", infoFrame)
gameIcon.Size = UDim2.new(0, 60, 0, 60)
gameIcon.Position = UDim2.new(0, 5, 0, 5)
gameIcon.Image = "rbxassetid://6031075930"
gameIcon.BackgroundTransparency = 1

local infoText = Instance.new("TextLabel", infoFrame)
infoText.Size = UDim2.new(1, -150, 1, 0)
infoText.Position = UDim2.new(0, 75, 0, 0)
infoText.BackgroundTransparency = 1
infoText.Text = "i need to buy key bonk hub!!!!!\nTime (ICT): 08:16:19"
infoText.TextColor3 = Color3.fromRGB(255, 255, 255)
infoText.Font = Enum.Font.Gotham
infoText.TextSize = 16
infoText.TextXAlignment = Enum.TextXAlignment.Left
infoText.TextYAlignment = Enum.TextYAlignment.Center

local greenBtn = Instance.new("TextButton", infoFrame)
greenBtn.Size = UDim2.new(0, 160, 0, 30)
greenBtn.Position = UDim2.new(1, -170, 0.5, -15)
greenBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
greenBtn.Text = "Loaded saved key"
greenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
greenBtn.Font = Enum.Font.GothamBold
greenBtn.TextSize = 14
Instance.new("UICorner", greenBtn).CornerRadius = UDim.new(0, 8)

-- Section User
local userFrame = Instance.new("Frame", mainFrame)
userFrame.Size = UDim2.new(1, -20, 0, 60)
userFrame.Position = UDim2.new(0, 10, 0, 130)
userFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
userFrame.BorderSizePixel = 0
Instance.new("UICorner", userFrame).CornerRadius = UDim.new(0, 10)

local userIcon = Instance.new("ImageLabel", userFrame)
userIcon.Size = UDim2.new(0, 50, 0, 50)
userIcon.Position = UDim2.new(0, 5, 0, 5)
userIcon.Image = "rbxassetid://6031068429"
userIcon.BackgroundTransparency = 1

local userText = Instance.new("TextLabel", userFrame)
userText.Size = UDim2.new(0.6, 0, 1, 0)
userText.Position = UDim2.new(0, 65, 0, 0)
userText.BackgroundTransparency = 1
userText.Text = "@Hy••••99\nID: ************"
userText.TextColor3 = Color3.fromRGB(255, 255, 255)
userText.Font = Enum.Font.Gotham
userText.TextSize = 14
userText.TextXAlignment = Enum.TextXAlignment.Left

-- ปุ่มลิงก์
local function makeButton(name, color, pos)
    local btn = Instance.new("TextButton", userFrame)
    btn.Size = UDim2.new(0, 90, 0, 30)
    btn.Position = UDim2.new(0, pos, 0.5, -15)
    btn.BackgroundColor3 = color
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    return btn
end

makeButton("Discord", Color3.fromRGB(100, 120, 255), 260)
makeButton("YouTube", Color3.fromRGB(220, 50, 50), 355)
makeButton("Website", Color3.fromRGB(0, 150, 255), 450)

-- Section Key Input
local keyBox = Instance.new("TextBox", mainFrame)
keyBox.Size = UDim2.new(1, -20, 0, 40)
keyBox.Position = UDim2.new(0, 10, 0, 200)
keyBox.PlaceholderText = "................................."
keyBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 16
Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0, 8)

-- ปุ่มด้านล่าง
local function makeBottomBtn(name, color, pos)
    local btn = Instance.new("TextButton", mainFrame)
    btn.Size = UDim2.new(0, 150, 0, 40)
    btn.Position = UDim2.new(0, pos, 0, 260)
    btn.BackgroundColor3 = color
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    return btn
end

makeBottomBtn("SUBMIT", Color3.fromRGB(0, 200, 100), 10)
makeBottomBtn("GET KEY", Color3.fromRGB(40, 40, 40), 170)
makeBottomBtn("HOW TO GET KEY", Color3.fromRGB(40, 40, 40), 330)
