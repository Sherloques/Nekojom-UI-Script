local Fluent = loadstring(game:HttpGet("http://raw.githubusercontent.com/GhostSobe/Library/refs/heads/main/Fluent/Fluent"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Nekojom",
    SubTitle = "by Jom",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 360),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- https://lucide.dev/icons/ เว็บเอา icon
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "rbxassetid://10709782845" }),
    TP = Window:AddTab({ Title = "Teleport", Icon = "rbxassetid://10709775894" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Plr = game:GetService("Players")
local LocalPlr = Plr.LocalPlayer
local Options = Fluent.Options

do
    Tabs.Main:AddSection("[ Speed / ความเร็ว ]")

    local Input = Tabs.Main:AddInput("Input", {
        Title = "WalkSpeed",
        Default = "20",
        Placeholder = "",
        Numeric = false,
        Finished = false,
        Callback = function(Value)
            Speed = Value
        end
    })

    Input:OnChanged(function()
        --print("Set Speed :", Input.Value)
    end)
    
    Tabs.Main:AddButton({
        Title = "Set WalkSpeed",
        Description = "กดเพื่อเปลี่ยนความเร็ว",
        Callback = function()
            LocalPlr.Character.Humanoid.WalkSpeed = Speed
        end
    })

    Tabs.Main:AddSection("[ Jump / กระโดด ]")

    local Input = Tabs.Main:AddInput("Input", {
        Title = "JumpPower",
        Default = "50",
        Placeholder = "",
        Numeric = false,
        Finished = false,
        Callback = function(Value)
            Jump = Value
        end
    })

    Input:OnChanged(function()
        --print("Set Speed :", Input.Value)
    end)

    Tabs.Main:AddButton({
        Title = "Set JumpPower",
        Description = "กดเพื่อเปลี่ยนพลังกระโดด",
        Callback = function()
            LocalPlr.Character.Humanoid.JumpPower = Jump
        end
    })

    --[[ วิธีหาตำแหน่ง CFrame
    1.ให้ไปยืนจุดที่ต้องการจะให้วาปไป
    2.คัดลอกสคริปนี้ไปรัน
    setclipboard(tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame))
    จากนั้นมันจะคัดลอกคำแหน่งให้แล้วเอามาวางใน CFrame.new(ตำแหน่งที่ได้มา)
    ]]

    Tabs.TP:AddSection("[ Teleport / วาป ]")

    Tabs.TP:AddButton({
        Title = "Teleport To Shop Seeds",
        Description = "วาปไปที่ขายเมล็ด",
        Callback = function()
            LocalPlr.Character.HumanoidRootPart.CFrame = CFrame.new(86.5790176, 2.99999976, -27.0039711, 0.00114052149, -4.75095341e-08, -0.999999344, -1.16310509e-12, 1, -4.75095661e-08, 0.999999344, 5.53487881e-11, 0.00114052149)
        end
    })
end


SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

local CoreGui = game:GetService("CoreGui")
local logoGui = Instance.new("ScreenGui")

logoGui.Name = "NekoJomHub"
logoGui.ResetOnSpawn = false
logoGui.Parent = CoreGui.ScreenGui

local screenGui = nil
while not screenGui do
    for _, gui in pairs(CoreGui:GetChildren()) do
        if gui:IsA("ScreenGui") then
            screenGui = gui
            break
        end
    end
    task.wait(0.1)
end

local logoButton = Instance.new("ImageButton")
logoButton.Name = "LogoButton"
logoButton.Size = UDim2.new(0, 55, 0, 55)
logoButton.Position = UDim2.new(0, 65, 0, 50)
logoButton.BackgroundTransparency = 1
logoButton.Image = "rbxassetid://86373171106525"
logoButton.Parent = logoGui
logoButton.ZIndex = 999
logoButton.MouseButton1Click:Connect(function()
    CoreGui.ScreenGui:GetChildren()[2].Visible = not CoreGui.ScreenGui:GetChildren()[2].Visible
end)

function dragify(Frame, object)
    local dragToggle = false
    local dragSpeed = 0.25
    local dragInput = nil
    local dragStart = nil
    local startPos = nil

    local function updateInput(input)
        local Delta = input.Position - dragStart
        local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
        game:GetService("TweenService"):Create(object, TweenInfo.new(dragSpeed), {Position = Position}):Play()
    end

    Frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragToggle = true
            dragStart = input.Position
            startPos = object.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)

    Frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragToggle then
            updateInput(input)
        end
    end)
end

dragify(logoButton, logoButton)

SaveManager:LoadAutoloadConfig()

