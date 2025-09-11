if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end

local Fluent = loadstring(game:HttpGet("http://raw.githubusercontent.com/GhostSobe/Library/refs/heads/main/Fluent/Fluent"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostSobe/Library/refs/heads/main/Fluent/InterfaceManager"))()

local Window = Fluent:CreateWindow({
    Title = "Nekojom | All Scripts",
    SubTitle = "by jom",
    TabWidth = 160,
    Size = UDim2.fromOffset(550, 350),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Home = Window:AddTab({ Title = "Home", Icon = "home" }),
    Script = Window:AddTab({ Title = "Script", Icon = "rbxassetid://10734907168" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

local Plr = cloneref(game:GetService("Players"))
local PlaceId, JobId = game.PlaceId, game.JobId
local LocalPlr = Plr.LocalPlayer
local StarterGui = cloneref(game:GetService("StarterGui"))
local TeleportService = cloneref(game:GetService("TeleportService"))

local Script = {
    "Lemon Hub",
    "BlueX Hub",
    "Ronix hub",

}


do
    pcall(function()
    Tabs.Home:AddParagraph({
        Title = "Welcome To My Script",
        Content = "หากสคริปต์ไหนใช้ไม่ได้โปรดติดต่อที่ดิสคอร์ดด้านล่าง\nหรืออยากให้เพิ่มสคริปต์ไหนก็สามารถแจ้งได้ที่ Discord ด้านล่าง"
    })

    Tabs.Home:AddButton({
        Title = "Discord Invite",
        Description = "กดเพื่อคัดลอกลิ้งค์ดิสคอร์ด",
        Callback = function()
            setclipboard("https://discord.gg/yt-rocket")
            StarterGui:SetCore("SendNotification", {
                Title = "System",
                Icon = "rbxassetid://86373171106525",
                Text = "ได้คัดลอกลิ้งค์ไปยังคีบอร์ดของคุณแล้ว",
                Duration = 4,
            })
        end
    })
    end)

    Tabs.Script:AddSection("[ key / มีคีย์ ]")

    local Dropdown = Tabs.Script:AddDropdown("Dropdown", {
        Title = "Select Scripts",
        Values = Script,
        Multi = false,
        Default = "เลือกสคริปต์",
    })

    --Dropdown:SetValue("four")

    Dropdown:OnChanged(function(Value)
        Scripts = Value
    end)
--------------------------------------------
    Tabs.Script:AddButton({
        Title = "Click To Execute",
        Description = "กดเพื่อรันสคริปต์",
        Callback = function()
            if Scripts == "Lemon Hub" then
                loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/ffdfeadf0af798741806ea404682a938.lua"))();
            elseif Scripts == "BlueX-Hub" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/Main.lua"))();
            elseif Scripts == "Ronix" then
                loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/ffdfeadf0af798741806ea404682a938.lua"))();

            end
        end
    })
end

    Tabs.Script:AddSection("[ Other / อื่นๆ ]")

    local Dropdown = Tabs.Script:AddDropdown("Dropdown", {
        Title = "Select Scripts",
        Values = Script,
        Multi = false,
        Default = "เลือกสคริปต์",
    })

    --Dropdown:SetValue("four")

    Dropdown:OnChanged(function(Value)
        Scripts = Value
    end)
--------------------------------------------
    Tabs.Script:AddButton({
        Title = "Click To Execute",
        Description = "กดเพื่อรันสคริปต์",
        Callback = function()
            if Scripts == "Fiy" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostSobe/Script/refs/heads/main/Fly"))();
            elseif Scripts == "AFK" then
                loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostSobe/Script/refs/heads/main/antiafk'))();
            elseif Scripts == "infiniteyield" then
                loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostSobe/Script/refs/heads/main/infiniteyield'))();

            end
        end
    })
end

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("Ghost Hub")
SaveManager:SetFolder("Ghost Hub/specific-game")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
-- SaveManager:BuildConfigSection(Tabs.Settings)
Window:SelectTab(1)


local CoreGui = game:GetService("CoreGui")
local logoGui = Instance.new("ScreenGui")

logoGui.Name = "JomHub"
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
