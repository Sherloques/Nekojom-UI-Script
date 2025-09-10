-- Roblox UI Hub Example (Close + Minimize)
-- วางใน LocalScript (StarterPlayerScripts หรือ StarterGui)

local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "CustomHub"

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 250)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = gui

-- มุมโค้ง
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 12)
uiCorner.Parent = mainFrame

-- เส้นขอบ
local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(0, 200, 120)
uiStroke.Thickness = 2
uiStroke.Parent = mainFrame

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, -80, 1, 0)
titleText.Position = UDim2.new(0, 10, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "Custom Hub"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 18
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

-- ปุ่มปิด (X)
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 40, 1, 0)
closeBtn.Position = UDim2.new(1, -40, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
closeBtn.Parent = titleBar

-- ปุ่มย่อ (_)
local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 40, 1, 0)
minBtn.Position = UDim2.new(1, -80, 0, 0)
minBtn.BackgroundColor3 = Color3.fromRGB(255, 180, 0)
minBtn.Text = "-"
minBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 22
minBtn.Parent = titleBar

-- Content ข้างใน (ตัวอย่างปุ่ม)
local testBtn = Instance.new("TextButton")
testBtn.Size = UDim2.new(0, 120, 0, 40)
testBtn.Position = UDim2.new(0.5, -60, 0.5, -20)
testBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
testBtn.Text = "Click Me!"
testBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
testBtn.Font = Enum.Font.GothamBold
testBtn.TextSize = 18
testBtn.Parent = mainFrame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 10)
btnCorner.Parent = testBtn

-- ฟังก์ชันปิด
closeBtn.MouseButton1Click:Connect(function()
    mainFrame:Destroy()
end)

-- ฟังก์ชันย่อ/ขยาย
local isMinimized = false
minBtn.MouseButton1Click:Connect(function()
    if not isMinimized then
        TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, 400, 0, 40)
        }):Play()
        isMinimized = true
    else
        TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, 400, 0, 250)
        }):Play()
        isMinimized = false
    end
end)
