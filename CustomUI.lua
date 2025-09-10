-- UI Script สวยๆ โดยจ้ม 😁
-- วางใน LocalScript (StarterPlayer > StarterPlayerScripts)

local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "CustomUI"

-- สร้าง Frame หลัก
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BackgroundTransparency = 0.1
mainFrame.Parent = gui

-- UI มุมโค้ง
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 15)
uiCorner.Parent = mainFrame

-- เส้นขอบ
local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(0, 200, 255)
uiStroke.Thickness = 2
uiStroke.Parent = mainFrame

-- ปุ่ม
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 120, 0, 40)
button.Position = UDim2.new(0.5, -60, 0.8, -20)
button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
button.Text = "Click Me!"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamBold
button.TextSize = 18
button.Parent = mainFrame

-- มุมโค้งปุ่ม
local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 10)
btnCorner.Parent = button

-- Hover Animation
button.MouseEnter:Connect(function()
	TweenService:Create(button, TweenInfo.new(0.3), {
		BackgroundColor3 = Color3.fromRGB(0, 220, 255)
	}):Play()
end)

button.MouseLeave:Connect(function()
	TweenService:Create(button, TweenInfo.new(0.3), {
		BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	}):Play()
end)

-- เวลา Click จะขยาย Frame
button.MouseButton1Click:Connect(function()
	TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, 350, 0, 250)
	}):Play()
end)
