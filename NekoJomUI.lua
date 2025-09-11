if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end

local Fluent = loadstring(game:HttpGet("http://raw.githubusercontent.com/GhostSobe/Library/refs/heads/main/Fluent/Fluent"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostSobe/Library/refs/heads/main/Fluent/InterfaceManager"))()

local Window = Fluent:CreateWindow({
    Title = "Rocket | All Scripts | Grow a Garden |",
    SubTitle = "by Khaotom",
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
    "AvOnTop",
    "Attack Hub",
    "Than hub",
    "Fetching's Hub",
    "Jimi Hub",
    "Black Hub",
    "Doggo's Hub",
    "Mauscripts",
    "Xerox Hub",
    "Gumanba",
    "Somtank",
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
                Icon = "rbxassetid://118974663345349",
                Text = "ได้คัดลอกลิ้งค์ไปยังคีบอร์ดของคุณแล้ว",
                Duration = 4,
            })
        end
    })
    end)

    Tabs.Script:AddSection("[ Nokey / ไม่มีคีย์ ]")

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
            if Scripts == "AvOnTop" then
                loadstring(game:HttpGet("https://get-avth-ontop.netlify.app/my-paste/script.lua"))()
            elseif Scripts == "Jimi Hub" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/bunnnwee/JimiHub/refs/heads/main/GrowAGarden-Normal"))();
            elseif Scripts == "Black Hub" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Skibidiking123/Fisch1/refs/heads/main/FischMain"))();
            elseif Scripts == "Doggo's Hub" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/doggoman230/growagarden/refs/heads/main/script"))();
            elseif Scripts == "Mauscripts" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/nootmaus/GrowAAGarden/refs/heads/main/mauscripts"))();
            elseif Scripts == "Xerox Hub" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-xyzs/GAG/refs/heads/main/GrowAGardenXE"))();
            elseif Scripts == "Gumanba" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/GrowaGarden", true))();
            elseif Scripts == "Somtank" then
                loadstring(game:HttpGet('https://pastebin.com/raw/BjkuU1TV'))();
            -- elseif Scripts == "Thunder Z" then
            --     loadstring(game:HttpGet('https://raw.githubusercontent.com/ThundarZ/Welcome/refs/heads/main/Main/GaG/Main.lua'))();
            -- elseif Scripts == "Bonk Hub" then
            --     loadstring(game:HttpGet("https://bonkhubloader.netlify.app",true))()
            -- elseif Scripts == "Speed Hub" then
            --    loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))();
            elseif Scripts == "Fetching's Hub" then
                loadstring(game:HttpGet('https://github.com/96soul/-/blob/main/load.gg?raw=true', true))();
            elseif Scripts == "Attack Hub" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Marukulaes/Attack-Hub/refs/heads/main/Grow%20A%20Graden"))();
            elseif Scripts == "Than hub" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/thantzy/thanhub/refs/heads/main/thanv1"))();
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

logoGui.Name = "GhostHub"
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
logoButton.Image = "rbxassetid://118974663345349"
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
