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
    Player = Window:AddTab({ Title = "Player", Icon = "rbxassetid://10747373176" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "star" }),
    TP = Window:AddTab({ Title = "Teleport", Icon = "rbxassetid://10709775894" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}


local Options = Fluent.Options
local Plr = game:GetService("Players")
local LocalPlr = Plr.LocalPlayer
local StarterGui = game:GetService("StarterGui")

local Script = {"BonkHub","MaruHub","LemonHub","BlueXHub", "SpeedHubX", "NatHub","Chiyo","Bebas","JinkX","VectorHub","H4xScripts","Zeehub","RedzHub","Eps1llonHub",}
local Jintab = {"JinkX",}

do
    pcall(function()
    Tabs.Home:AddParagraph({
        Title = "Script ส่วนตัว",
        Content = "ทำไว้ใช้เองขำๆรวมสคริปต์ไว้ใช้เอง\nBy Nekojom"
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

    Tabs.Script:AddSection(" Key / มีคีย์ ")

    local Dropdown = Tabs.Script:AddDropdown("Dropdown", {
        Title = "Select Scripts",
        Values = Script,
        Multi = false,
        Default = "เลือกสคริปต์",
    })

    Dropdown:OnChanged(function(Value)
        Scripts = Value
    end)

    Tabs.Script:AddButton({
        Title = "Click To Execute",
        Description = "กดเพื่อรันสคริปต์",
        Callback = function()
            if Scripts == "BonkHub" then
                getgenv().Key = "BONKHUB-9623288E740C"
                getgenv().DiscordId = "855388945419993119"
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Toonza555/Project/refs/heads/main/PremiumLoader.lua", true))()
            elseif Scripts == "MaruHub" then
                getgenv().Key = "MARU-SC3UI-M6UG-8HMZ-OZ9AL-GGXMW"
                getgenv().id = "754329983861784588"
                loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MaruBitkub/main/Mobile.lua"))()
            elseif Scripts == "LemonHub" then
                loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/ffdfeadf0af798741806ea404682a938.lua"))();
            elseif Scripts == "BlueXHub" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/Main.lua"))();
            elseif Scripts == "SpeedHubX" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))();
            elseif Scripts == "NatHub" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/NatHub.lua"))();
            elseif Scripts == "Chiyo" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/kaisenlmao/loader/refs/heads/main/chiyo.lua"))();
            elseif Scripts == "Bebas" then
                loadstring(game:HttpGet("https://gist.githubusercontent.com/OmarBinLadek/25e75529e18b38e5d38beab9126fc004/raw/6d1c1c5e0e91373654d2f85ebb65e8221728e26d/freefishit.lua"))();
            elseif Scripts == "JinkX" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/stormskmonkey/JinkX/refs/heads/main/Loader.lua"))();
            elseif Scripts == "VectorHub" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/AAwful/Vector_Hub/0/v2"))();
            elseif Scripts == "H4xScripts" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/H4xScripts/Loader/refs/heads/main/loader.lua", true))()
            elseif Scripts == "Zeehub" then
                loadstring(game:HttpGet("https://zuwz.me/Ls-Zee-Hub-HZ"))();
            elseif Scripts == "RedzHub" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))()
            elseif Scripts == "Eps1llonHub" then
                loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/083f208b2d5d19c6b565190b0d2293c9.lua"))()
            end
        end
    })

    Tabs.Script:AddSection(" ไก่ตัน ")

        local Dropdown = Tabs.Script:AddDropdown("Dropdown", {
            Title = "Select Scripts",
            Values = Jintab,
            Multi = false,
            Default = "เลือกสคริปต์",
        })

        --Dropdown:SetValue("four")

        Dropdown:OnChanged(function(Value)
            Scripts = Value
        end)

        Tabs.Script:AddButton({
            Title = "Click To Execute",
            Description = "กดเพื่อรันสคริปต์",
            Callback = function()
                if Scripts == "JinkX" then
                    getgenv().jinkX = {
                        ['Fish It'] = {
                            ['Aura Farmer'] = true, -- ฟาม Aura (ถ้ามีเบ็ด Ghostfinn Rod แล้ว)

                            ['Enabled'] = true,
                            ['Webhook'] = '', -- ใส่ลิ้ง Webhook ถ้าไม่ใช้ไม่ต้องใส่
                            
                            ['Fpsboost'] = false,
                            ['Fps_Cap'] = true,
                            ['Fps_Value'] = 300,
                            ['WhiteScreen'] = false,

                            -- เบ็ดที่จะให้ซื้อ
                            ['Rods'] = {
                                'Luck Rod',
                                'Carbon Rod',
                                'Grass Rod',
                                'Demascus Rod',
                                'Ice Rod',
                                'Lucky Rod',
                                'Midnight Rod',
                                'Steampunk Rod',
                                'Chrome Rod',
                                'Astral Rod',
                            },

                            -- Bobber ที่จะให้ซื้อ
                            ['Baits'] = {
                                'Topwater Bait',
                                'Luck Bait',
                                'Midnight Bait',
                                'Nature Bait',
                                'Chroma Bait',
                                'Dark Matter Bait',
                                'Corrupt Bait',
                                'Aether Bait',
                            },
                        },
                    }
                    loadstring(game:HttpGet('https://raw.githubusercontent.com/stormskmonkey/JinkX/refs/heads/main/Loader.lua'))();
                end
            end
        })

    Tabs.Misc:AddSection(" External ")

    local FlyEnabled = false

    Tabs.Misc:AddToggle("FlyToggle", {
        Title = "Fly",
        Default = false,
        Description = "กดเพื่อรันสคริปต์",
        Callback = function(state)
            FlyEnabled = state
            if state then
            
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Nekojom/Script/refs/heads/main/Fly"))();
                print("Fly เปิดใช้งานแล้ว")
            else

                print("Fly ปิดการใช้งานแล้ว")
            end
        end
    })

    local AntiAFKEnabled = false

    Tabs.Misc:AddToggle("AntiAFKToggle", {
        Title = "AntiAFK",
        Default = false,
        Description = "กดเพื่อรันสคริปต์",
        Callback = function(state)
            AntiAFKEnabled = state
            if state then
            
                loadstring(game:HttpGet('https://raw.githubusercontent.com/Nekojom/Script/refs/heads/main/antiafk'))();
                print("AntiAFK เปิดใช้งานแล้ว")
            else

                print("AntiAFK ปิดการใช้งานแล้ว")
            end
        end
    })

    local infiniteyieldEnabled = false

    Tabs.Misc:AddToggle("infiniteyieldToggle", {
        Title = "infiniteyield",
        Default = false,
        Description = "กดเพื่อรันสคริปต์",
        Callback = function(state)
            infiniteyieldEnabled = state
            if state then
            
                loadstring(game:HttpGet('https://raw.githubusercontent.com/Nekojom/Script/refs/heads/main/infiniteyield'))();
                print("infiniteyield เปิดใช้งานแล้ว")
            else

                print("infiniteyield ปิดการใช้งานแล้ว")
            end
        end
    })

    Tabs.Misc:AddSection(" Graphics ")

    local GraphicsEnabled = false

    Tabs.Misc:AddToggle("GraphicsToggle", {
        Title = "RTX",
        Default = false,
        Description = "กดเพื่อรันสคริปต์",
        Callback = function(state)
            GraphicsEnabled = state
            if state then
            
                loadstring(game:HttpGet("https://rawscripts.net/raw/Just-a-baseplate.-Script-de-RTX-43523"))();
                print("Graphics เปิดใช้งานแล้ว")
            else

                print("Graphics ปิดการใช้งานแล้ว")
            end
        end
    })

    local GraphicsEnabled = false

    Tabs.Misc:AddToggle("GraphicsToggle", {
        Title = "PshadeUltimate",
        Default = false,
        Description = "กดเพื่อรันสคริปต์",
        Callback = function(state)
            GraphicsEnabled = state
            if state then
            
                loadstring(game:HttpGet('https://raw.githubusercontent.com/randomstring0/pshade-ultimate/refs/heads/main/src/cd.lua'))();
                print("PshadeUltimate เปิดใช้งานแล้ว")
            else

                print("PshadeUltimate ปิดการใช้งานแล้ว")
            end
        end
    })


    Tabs.Misc:AddSection(" FPS Boots ")

    local FPSBootsEnabled = false

    Tabs.Misc:AddToggle("FPSBootsToggle", {
        Title = "FPS Boots",
        Default = false,
        Description = "กดเพื่อลดแลค เพิ่มFPS",
        Callback = function(state)
            FPSBootsEnabled = state
            if state then

                loadstring(game:HttpGet("https://pastebin.com/raw/8YZ2cc6V"))();
                print("FPS Boots เปิดใช้งานแล้ว")
            else

                print("FPS Boots ปิดการใช้งานแล้ว")
            end
        end
    })

    Tabs.Player:AddSection(" Movement ")

    local Input = Tabs.Player:AddInput("Input", {
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
    
    Tabs.Player:AddButton({
        Title = "Set WalkSpeed",
        Description = "กดเพื่อเปลี่ยนความเร็ว",
        Callback = function()
            LocalPlr.Character.Humanoid.WalkSpeed = Speed
        end
    })

    local Input = Tabs.Player:AddInput("Input", {
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

    Tabs.Player:AddButton({
        Title = "Set JumpPower",
        Description = "กดเพื่อเปลี่ยนพลังกระโดด",
        Callback = function()
            LocalPlr.Character.Humanoid.JumpPower = Jump
        end
    })

    Tabs.Player:AddSection(" Modes ")

    Tabs.Player:AddToggle("InfiniteJumpToggle", {
    Title = "Infinite Jump",
    Default = false,
    Description = "เปิดเพื่อกระโดดไม่จำกัด",
    Callback = function(state)
        InfiniteJumpEnabled = state
        if InfiniteJumpEnabled then
            StarterGui:SetCore("SendNotification", {
                Title = "Infinite Jump",
                Text = state and "เปิดใช้งานแล้ว" or "ปิดการใช้งานแล้ว",
                Duration = 2
            })
        end
    end
})

    -- เชื่อมการกดกระโดดเข้ากับฟังก์ชัน
    game:GetService("UserInputService").JumpRequest:Connect(function()
        if InfiniteJumpEnabled and LocalPlr.Character and LocalPlr.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end)
end

    Tabs.Player:AddToggle("NoclipToggle", {
        Title = "Noclip",
        Default = false,
        Description = "เปิดเพื่อทะลุผ่านสิ่งของ",
        Callback = function(state)
            if not getgenv().ToggleNoclip then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Nekojom/Script/refs/heads/main/Noclip"))();
            end
            getgenv().ToggleNoclip(state)
            if state then
                print("Noclip เปิดใช้งานแล้ว")
            else
                print("Noclip ปิดการใช้งานแล้ว")
            end
        end
    })

    Tabs.Player:AddToggle("InvisibleToggle", {
        Title = "Invisible",
        Default = false,
        Description = "เปิดเพื่อล่องหน",
        Callback = function(state)
            getgenv().InvisibleEnabled = state
            if state then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Nekojom/Script/refs/heads/main/Invisible"))();
                print("Invisible เปิดใช้งานแล้ว")
            else
                print("Invisible ปิดการใช้งานแล้ว")
            end
        end
    })

    Tabs.Player:AddToggle("PlayerEspToggle", {
        Title = "PlayerEsp",
        Default = false,
        Description = "เปิดเพื่อมองเห็นผู้เล่น",
        Callback = function(state)
            getgenv().PlayerEspEnabled = state
            if state then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Nekojom/Script/refs/heads/main/PlayerEsp"))();
                print("PlayerEsp เปิดใช้งานแล้ว")
            else
                print("PlayerEsp ปิดการใช้งานแล้ว")
            end
        end
    })



    Tabs.TP:AddSection(" Teleport  ")

    Tabs.TP:AddButton({
        Title = "Teleport To Shop Seeds",
        Description = "วาปไปที่ขายเมล็ด",
        Callback = function()
            LocalPlr.Character.HumanoidRootPart.CFrame = CFrame.new(86.5790176, 2.99999976, -27.0039711, 0.00114052149, -4.75095341e-08, -0.999999344, -1.16310509e-12, 1, -4.75095661e-08, 0.999999344, 5.53487881e-11, 0.00114052149)
        end
    })


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

