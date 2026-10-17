
repeat
    wait()
until game:IsLoaded() and game.Players.LocalPlayer

local settings = {}
local HttpService = game:GetService("HttpService")
local str = game.Players.LocalPlayer.Name .. "-KaitunV4.json"

SaveSettings = function(arg, arg2)
    if arg ~= nil then
        settings[arg] = arg2
    end

    if not isfolder("Banana Cat Hub") then
        makefolder("Banana Cat Hub")
    end

    writefile("Banana Cat Hub/" .. str, HttpService:JSONEncode(settings))
end

if getgenv().Config then
    settings = getgenv().Config
    SaveSettings()
end

ReadSetting = function()
    local ok, result = pcall(function()
        if not isfolder("Banana Cat Hub") then
            makefolder("Banana Cat Hub")
        end

        return HttpService:JSONDecode(readfile("Banana Cat Hub/" .. str))
    end)

    if ok then
        return result
    end
    SaveSettings()
    return ReadSetting()
end

settings = ReadSetting()
getgenv().Settings = settings

repeat
    wait()
until game:FindFirstChild("CoreGui")

repeat
    wait()
until not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen")

repeat
    wait()
until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded")

if getgenv().LoadScript then
    return print("Double UI")
end

FireButton = function(selectedObject)
    selectedObject.Selectable = true
    game:GetService("GuiService").SelectedObject = selectedObject
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "Return", false, selectedObject)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, "Return", false, selectedObject)

    selectedObject.Activated:Connect(function()
        game:GetService("GuiService").SelectedObject = nil
    end)
end

repeat
    wait()
until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main (minimal)") or game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main")

local mainMinimal = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main (minimal)")
local main = mainMinimal or game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main")

repeat
    wait()
until main:FindFirstChild("ChooseTeam")

repeat
    wait()

    pcall(function()
        FireButton(game:GetService("Players").LocalPlayer.PlayerGui["Main (minimal)"].ChooseTeam.Container.Marines.Frame.TextButton)
        wait(1)
    end)
until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main (minimal)") and game:GetService("Players").LocalPlayer.PlayerGui["Main (minimal)"]:FindFirstChild("ChooseTeam") and not game:GetService("Players").LocalPlayer.PlayerGui["Main (minimal)"]:WaitForChild("ChooseTeam").Visible or game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main") and game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") and not game:GetService("Players").LocalPlayer.PlayerGui.Main:WaitForChild("ChooseTeam").Visible

game:GetService("GuiService").SelectedObject = nil

getgenv().LoadScript = true
local localPlayer = game.Players.LocalPlayer
getgenv().getupvalue = debug.getupvalue
getgenv().getupvalues = debug.getupvalues
local worldOrigin = game.workspace._WorldOrigin
worldOrigin = game.ReplicatedStorage.Remotes.CommF_
local VirtualUser = game:GetService("VirtualUser")

game:GetService("Players").LocalPlayer.Idled:connect(function()
    VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

local lib = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local str2 = " [ Premium ]"

getgenv().Window = lib:CreateWindow({
    Title = "Banana Cat Hub-Kaitun V4" .. str2,
    SubTitle = "by Obii",
    TabWidth = 125,
    Size = UDim2.fromOffset(500, 350),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl,
})

loadstring("    local MT = getrawmetatable(game)\n    local OldNameCall = MT.__namecall\n    setreadonly(MT, false)\n    MT.__namecall = newcclosure(function(self, ...)\n    local Method = getnamecallmethod()\n    local Args = {...}\n    if Method == 'FireServer' and self.Name == 'RemoteEvent' and AimPos \n    and tostring(AimPos.X) ~= \"nan\"  then\n        if  #Args == 1 and typeof(Args[1]) == \"Vector3\" then\n            Args[1] = AimPos.Position\n        end\n        if #Args == 1 and typeof(Args[1]) == \"CFrame\" then\n            Args[1] = AimPos\n        end\n    end\n    return OldNameCall(self, unpack(Args))\nend)\nsetreadonly(MT, true)")()

Translate = function(arg)
    return arg
end

tick()

local tbl = {
    ShopMain = Window:AddTab({Title = Translate("Tab Shop"), Icon = ""}),
    TabSetupV4 = Window:AddTab({Title = "Tab Setup V4", Icon = ""}),
    TabDevilFruit = Window:AddTab({Title = "Tab Devil Fruit", Icon = ""}),
    StatusSvMain = Window:AddTab({Title = Translate("Tab Status And Server"), Icon = ""}),
}

getgenv().Options = lib.Options
Window:SelectTab(1)

getgenv().IsPlayerDead = function()
    if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") and localPlayer.Character.Humanoid.Health ~= 0 then
        return
    end
    return true
end

local response = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("GetUnlockables")
local tbl2 = {}

if response.DefeatedIndraTrueForm and game.Workspace:GetAttribute("MAP") == "Sea3" then
    tbl2["Caslte On The Sea"] = Vector3.new(-4967.6826171875, 314.88238525390625, -3157.098388671875)
    tbl2.Hydra = Vector3.new(5661.5302734375, 1013.4113159179688, -334.9619140625)
    tbl2.Mansion = Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125)
end

if game.Workspace:GetAttribute("MAP") == "Sea3" then
    tbl2["Temple Clock"] = Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586)
end

if game.Workspace:GetAttribute("MAP") == "Sea2" then
    tbl2["122"] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)
    tbl2["3032"] = Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
end

if response.FlamingoAccess and game.Workspace:GetAttribute("MAP") == "Sea2" then
    tbl2.Mansion = Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312)
    tbl2.Flamingo = Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625)
end

if game.Workspace:GetAttribute("MAP") == "Sea1" then
    tbl2 = {
        ["1"] = Vector3.new(-7894.6201171875, 5545.49169921875, -380.2467346191406),
        ["2"] = Vector3.new(-4607.82275390625, 872.5422973632812, -1667.556884765625),
        ["3"] = Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
        ["4"] = Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875),
    }
end

toTarget = function(arg, arg2, cFrame, arg3, arg4)
    if not IsPlayerDead() then
        if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Sit then
            if getgenv().Tween then
                getgenv().Tween:Pause()
                getgenv().Tween:Cancel()
            end

            wait(1)
            getgenv().noclip = false
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, game)
            wait()
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, game)
            wait(1)

            if localPlayer.Character:FindFirstChild("Humanoid") and localPlayer.Character:FindFirstChild("HumanoidRootPart") and localPlayer.Character.HumanoidRootPart:FindFirstChild("EffectsSY") then
                localPlayer.Character.HumanoidRootPart.EffectsSY:Destroy()
            end

            wait(0.5)
            game.Players.LocalPlayer.Character.Humanoid.Jump = true
            wait(1)
            localPlayer.Character.HumanoidRootPart.CFrame = localPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
            return
        end

        if localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            for k, v2 in pairs(tbl2) do
                if (arg2 - v2).Magnitude <= 3000 and (arg2 - localPlayer.Character.HumanoidRootPart.Position).Magnitude >= 3000 then
                    getgenv().noclip = true

                    if getgenv().Tween then
                        getgenv().Tween:Pause()
                        getgenv().Tween:Cancel()
                    end

                    if k == "Temple Clock" and game.ReplicatedStorage.MapStash:FindFirstChild("Temple of Time") then
                        game.ReplicatedStorage.MapStash["Temple of Time"].Parent = workspace.Map

                        game.Players.LocalPlayer.CharacterAdded:Once(function()
                            if not workspace:GetAttribute("RestartingTemple") then
                                workspace:SetAttribute("RestartingTemple", true)

                                task.delay(0.1, function()
                                    workspace:SetAttribute("RestartingTemple", nil)
                                end)

                                if workspace.Map:FindFirstChild("Temple of Time") then
                                    workspace.Map["Temple of Time"].Parent = game.ReplicatedStorage.MapStash
                                end
                            end
                        end)
                    end

                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", v2)
                    wait(2)
                    return
                end
            end

            local TweenService = game:service("TweenService")
            local tweenInfo = TweenInfo.new((arg2 - arg).Magnitude / 350, Enum.EasingStyle.Linear)

            if game.Workspace:GetAttribute("MAP") == "Sea3" and (arg2 - Vector3.new(28609.392578125, 14896.533203125, 106.4216537475586)).Magnitude > 3000 and (Vector3.new(28609.392578125, 14896.533203125, 106.4216537475586) - localPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3000 then
                getgenv().Tween = TweenService:Create(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new((Vector3.new(28609.392578125, 14896.533203125, 106.4216537475586) - localPlayer.Character.HumanoidRootPart.Position).Magnitude / 350, Enum.EasingStyle.Linear), {
                    CFrame = CFrame.new(28609.392578125, 14896.533203125, 106.4216537475586),
                })

                getgenv().noclip = true
                getgenv().Tween:Play()

                if (Vector3.new(28609.392578125, 14896.533203125, 106.4216537475586) - localPlayer.Character.HumanoidRootPart.Position).Magnitude < 8 then
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "Check")
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "TeleportBack")

                    if getgenv().Tween then
                        getgenv().Tween:Pause()
                        getgenv().Tween:Cancel()
                    end
                end

                return
            end

            if (arg2 - arg).Magnitude <= 100 and not arg3 and not ReadyToDodge then
                getgenv().noclip = true

                if getgenv().Tween then
                    getgenv().Tween:Pause()
                    getgenv().Tween:Cancel()
                end

                localPlayer.Character.HumanoidRootPart.CFrame = cFrame
            elseif game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and localPlayer.Character.Humanoid.Health > 0 then
                local cframe = CFrame.new(0, 0, 0)

                if not arg4 and ReadyToDodge then
                    cframe = CFrame.new(0, 200, 0)
                end

                if (Vector3.new(0, localPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y, 0) - Vector3.new(0, -60, 0)).Magnitude <= 60 then
                    localPlayer.Character.HumanoidRootPart.CFrame = localPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)
                end

                getgenv().Tween = TweenService:Create(localPlayer.Character.HumanoidRootPart, tweenInfo, {CFrame = cFrame * cframe})
                getgenv().Tween:Play()
                getgenv().noclip = true
            end
        end

        return
    end

    if getgenv().Tween then
        getgenv().Tween:Pause()
        getgenv().Tween:Cancel()
    end

    repeat
        wait()

        if getgenv().Tween then
            getgenv().Tween:Pause()
            getgenv().Tween:Cancel()
        end
    until localPlayer.Character:FindFirstChild("Humanoid") and localPlayer.Character.Humanoid.Health > 0

    wait(3)
end

local v2 = tbl.TabSetupV4:AddParagraph({Title = "Acient One Status", Content = ""})
local animation = Instance.new("Animation")

getgenv().SendMessage = function(arg)
    wait(1)
    animation.AnimationId = "rbxassetid://507766666=bananauser=" .. tostring(arg)
    local character = game.Players.LocalPlayer.Character
    local result = character or game.Players.LocalPlayer.CharacterAdded:Wait()
    local humanoid = result:WaitForChild("Humanoid", 5)

    if humanoid then
        humanoid:LoadAnimation(animation):Play()
    end
end

getgenv().SendMessageActiveRace = function(arg)
    animation.AnimationId = "rbxassetid://507766666=bananauser=" .. tostring(arg)
    local character = game.Players.LocalPlayer.Character
    local result = character or game.Players.LocalPlayer.CharacterAdded:Wait()
    local humanoid = result:WaitForChild("Humanoid", 5)

    if humanoid then
        humanoid:LoadAnimation(animation):Play()
    end
end

local n = math.random(100000, 999999)

getgenv().SendAccMain = function()
    SendMessage("AccMain:" .. tostring(n))
end

getgenv().AcountHelp = {}
getgenv().AccountMain = {}
getgenv().AccountFarmTrain = {}

local function fn2(arg, arg2)
    arg.AnimationPlayed:Connect(function(arg3)
        local match = arg3.Animation.AnimationId:match("bananauser=(.+)")
        if not match then
            return
        end

        if (match == "AccHelp" or match == "Remove") and arg2.Name == game.Players.LocalPlayer.Name then
            return
        end

        if match == "AccHelp" then
            if not table.find(getgenv().AcountHelp, arg2.Name) then
                table.insert(getgenv().AcountHelp, arg2.Name)
            end
        elseif match == "Remove" then
            local v3 = table.find(getgenv().AcountHelp, arg2.Name)

            if v3 then
                table.remove(getgenv().AcountHelp, v3)
            end
        elseif match:match("^AccMain:%d+$") then
            local num = tonumber(match:match("^AccMain:(%d+)$"))

            if num and not getgenv().AccountMain[arg2.Name] then
                getgenv().AccountMain[arg2.Name] = num
                print("--", arg2.Name, num)
            end
        elseif match == "AccMainRemove" then
            getgenv().AccountMain[arg2.Name] = nil
        elseif match == "FarmTrain" and not table.find(getgenv().AccountFarmTrain, arg2.Name) then
            table.insert(getgenv().AccountFarmTrain, arg2.Name)
        elseif match == "ActiveRace" then
            getgenv().TurnonRacev3 = true
        end
    end)
end

CheckMainGoTrial = function()
    local huge = math.huge
    local v3 = nil

    for i_, v4 in ipairs(getgenv().ConfigV4["Account Up Gear"]) do
        if not table.find(getgenv().AccountFarmTrain, v4) and i_ < huge then
            huge = i_
            v3 = v4
        end
    end

    return v3
end

CountFarmTrain = function()
    local v3 = nil
    local n2 = 0
    local v4 = next
    local accountFarmTrain = getgenv().AccountFarmTrain

    while true do
        local v5, v6 = v4(accountFarmTrain, v3)
        if v5 == nil then
            break
        end
        v3 = v5

        if v6 then
            n2 = n2 + 1
        end
    end

    return n2
end

local function fn3(player)
    if player.Character then
        local humanoid = player.Character:FindFirstChild("Humanoid")

        if humanoid then
            fn2(humanoid, player)
        end
    end

    player.CharacterAdded:Connect(function(character)
        local humanoid = character:WaitForChild("Humanoid", 5)

        if humanoid then
            fn2(humanoid, player)
        end
    end)
end

for i_, player in ipairs(game.Players:GetPlayers()) do
    fn3(player)
end

game.Players.PlayerAdded:Connect(fn3)

DetectNamePlayer = function()
    local tbl3 = {}

    for k, child in pairs(game:GetService("Players"):GetChildren()) do
        if child.Name ~= localPlayer.Name and not table.find(tbl3, child.Name) then
            table.insert(tbl3, child.Name)
        end
    end

    return tbl3
end

local tabSetupV4 = tbl.TabSetupV4
local addToggle = tabSetupV4.AddToggle
local tbl3 = {Title = Translate("Account Main Up Gear")}
local accountMainUpGear = settings["Account Main Up Gear"]
local default = accountMainUpGear or false
tbl3.Default = default

tbl3.Callback = function(arg)
    if not arg and getgenv().AccountMain[localPlayer.Name] then
        getgenv().SendMessage("AccMainRemove")
    end

    SaveSettings("Account Main Up Gear", arg)
end

addToggle(tabSetupV4, "Account Main Up Gear", tbl3)
local tabSetupV42 = tbl.TabSetupV4
local addToggle2 = tabSetupV42.AddToggle
local tbl4 = {Title = Translate("Account Help")}
local accountHelp = settings["Account Help"]
local default2 = accountHelp or false
tbl4.Default = default2

tbl4.Callback = function(arg)
    SaveSettings("Account Help", arg)
end

addToggle2(tabSetupV42, "Account Help", tbl4)
local tabSetupV43 = tbl.TabSetupV4
local addToggle3 = tabSetupV43.AddToggle
local tbl5 = {Title = Translate("Auto Kick When End Full Moon [ BETA ]")}
local autoKickWhenEndFullMoon = settings["Auto Kick When End Full Moon"]
local default3 = autoKickWhenEndFullMoon or false
tbl5.Default = default3

tbl5.Callback = function(arg)
    SaveSettings("Auto Kick When End Full Moon", arg)
end

addToggle3(tabSetupV43, "Auto Kick When End Full Moon", tbl5)
local tabSetupV44 = tbl.TabSetupV4
local addToggle4 = tabSetupV44.AddToggle
local tbl6 = {Title = Translate("Start Kaitun")}
local startKaitun = settings["Start Kaitun"]
local default4 = startKaitun or false
tbl6.Default = default4

tbl6.Callback = function(arg)
    SaveSettings("Start Kaitun", arg)
end

addToggle4(tabSetupV44, "Start Kaitun", tbl6)

CheckRace = function()
    local response2 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
    local response3 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1")
    if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
        return " V4"
    end

    if response2 == -2 then
        return " V3"
    end

    if response3 == -2 then
        return " V2"
    end
    return " V1"
end

DetectItemPlr = function(arg)
    if not localPlayer.Character:FindFirstChild(arg) and not localPlayer.Backpack:FindFirstChild(arg) then
        return
    end
    return true
end

CreateTweenFloat = function()
    if not localPlayer.Character.HumanoidRootPart:FindFirstChild("EffectsSY") then
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Parent = localPlayer.Character.HumanoidRootPart
        bodyVelocity.Name = "EffectsSY"
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    end
end

game:GetService("RunService").Stepped:Connect(function()
    if getgenv().noclip and localPlayer.Character:FindFirstChild("HumanoidRootPart") and localPlayer.Character:FindFirstChild("Humanoid") then
        local v3 = next
        local descendants, v4 = localPlayer.Character:GetDescendants()

        for k, v5 in v3, descendants, v4 do
            if (v5:IsA("MeshPart") or v5:IsA("Part")) and v5.CanCollide then
                v5.CanCollide = false
            end
        end
    end
end)

game:GetService("RunService").Stepped:connect(function()
    pcall(function()
        if getgenv().noclip and localPlayer.Character:FindFirstChild("Humanoid") then
            CreateTweenFloat()
        end

        if not getgenv().noclip and localPlayer.Character:FindFirstChild("Humanoid") and localPlayer.Character:FindFirstChild("HumanoidRootPart") and localPlayer.Character.HumanoidRootPart:FindFirstChild("EffectsSY") then
            localPlayer.Character.HumanoidRootPart.EffectsSY:Destroy()
        end
    end)
end)

local v3 = nil

sizepart = function(arg)
    v3 = arg

    if not arg.HumanoidRootPart:FindFirstChild("vando") and localPlayer:DistanceFromCharacter(arg.HumanoidRootPart.Position) <= 50 then
        local v4 = next
        local descendants, v5 = arg:GetDescendants()

        for k, v6 in v4, descendants, v5 do
            if (v6:IsA("Part") or v6:IsA("MeshPart")) and v6.CanCollide then
                v6.CanCollide = false
            end
        end
    end
end

local v4 = nil
local cFrame = nil

DeleteIgnoredMob = function()
    for k, child in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if child:IsA("Model") and child:FindFirstChild("Ignored") then
            child.Ignored:Destroy()
        end
    end
end

IsMobAlive = function(arg)
    if arg and arg.Parent and arg:FindFirstChild("HumanoidRootPart") and arg:FindFirstChildWhichIsA("Humanoid") and arg.Humanoid.Health > 0 then
        return true
    end
end

DetectMob = function(arg)
    local huge = math.huge
    local v5 = nil

    for k, child in pairs(game.Workspace.Enemies:GetChildren()) do
        if (typeof(arg) == "table" and table.find(arg, child.Name) or child.Name == arg) and IsMobAlive(child) then
            local magnitude = (child.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude

            if magnitude < huge then
                huge = magnitude
                v5 = child
            end
        end
    end

    return v5
end

CheckNameBoss = function(arg)
    local v5 = next
    local children, v6 = game.ReplicatedStorage:GetChildren()

    for k, v7 in v5, children, v6 do
        if (typeof(arg) == "table" and table.find(arg, v7.Name) or v7.Name == arg) and IsMobAlive(v7) then
            return v7
        end
    end

    local v7 = next
    local children2, v8 = game.Workspace.Enemies:GetChildren()

    for k, v9 in v7, children2, v8 do
        if (typeof(arg) == "table" and table.find(arg, v9.Name) or v9.Name == arg) and IsMobAlive(v9) then
            return v9
        end
    end
end

local tbl7 = {}

getcenter = function(arg)
    local n2 = 0
    local position = nil

    if string.find(arg, "Lv.") then
        local str3 = arg:gsub(" %pLv. %d+%p", "")
        name1 = str3
    end

    for k, v5 in pairs(tbl7) do
        local str3 = nil

        if string.find(v5.Name, "Lv.") then
            str3 = v5.Name:gsub(" %pLv. %d+%p", "")
        end

        if v5:IsA("Part") and (str3 and str3 == arg or arg == v5.Name or name1 and v5.Name == name1) then
            if position == nil then
                position = v5.Position
                n2 = n2 + 1
            else
                position = position + v5.Position
                n2 = n2 + 1
            end
        end
    end

    return CFrame.new(position / n2)
end

DetectPartMobBring = function(arg, arg2, arg3, arg4)
    local tbl8 = {}
    local str3 = nil

    if string.find(arg, "Lv.") then
        str3 = arg:gsub(" %pLv. %d+%p", "")
    end

    for k, v5 in pairs(tbl7) do
        local str4 = nil

        if string.find(v5.Name, "Lv.") then
            str4 = v5.Name:gsub(" %pLv. %d+%p", "")
        end

        if v5:IsA("Part") and (str4 and str4 == arg or arg == v5.Name or str3 and v5.Name == str3) then
            table.insert(tbl8, v5)
        end
    end

    local v5 = nil

    if not arg3 then
        local tbl9 = {}
        local v6 = next

        while true do
            local v7, v8 = v6(tbl8, v5)
            if v7 == nil then
                break
            end
            v5 = v7

            if (arg4.Position - v8.Position).Magnitude <= 200 then
                table.insert(tbl9, v8)
            end
        end

        if #tbl9 < #tbl8 then
            return true
        end
        return
    end

    local huge = math.huge
    local v6 = nil
    local v7 = next

    while true do
        local v8, v9 = v7(tbl8, v5)
        if v8 == nil then
            break
        end
        v5 = v8
        local magnitude = (arg2.HumanoidRootPart.Position - v9.Position).Magnitude

        if magnitude < huge then
            huge = magnitude
            v6 = v9
        end
    end

    return v6
end

isnetworkowner2 = function(arg)
    local v5 = next
    local children, v6 = game.Workspace.Characters:GetChildren()

    for k, v7 in v5, children, v6 do
        if v7.Name ~= localPlayer.Name and v7:FindFirstChild("HumanoidRootPart") and (v7.HumanoidRootPart.Position - arg.Position).Magnitude <= 300 then
            return false
        end
    end

    return true
end

BringMob = function(arg)
    if arg and v4 ~= arg then
        v4 = arg
        cFrame = DetectPartMobBring(arg.Name, arg, true).CFrame

        if game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" and localPlayer.Character:FindFirstChild("RaceTransformed") and localPlayer.Character.RaceTransformed.Value then
            cFrame = getcenter(arg.Name)
        end

        DeleteIgnoredMob()
    end

    if not DaBringMob then
        local tbl8 = {}

        if not arg:FindFirstChild("Ignored") then
            table.insert(tbl8, arg)
        end

        if game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" and localPlayer.Character:FindFirstChild("RaceTransformed") and localPlayer.Character.RaceTransformed.Value then
            for k, child in pairs(workspace.Enemies:GetChildren()) do
                if child ~= arg and child.Name == arg.Name and not child:FindFirstChild("Ignored") and IsMobAlive(child) and isnetworkowner2(child.HumanoidRootPart) and (child.HumanoidRootPart.Position - cFrame.Position).Magnitude <= 300 and #tbl8 < 6 then
                    table.insert(tbl8, child)
                end
            end

            if cFrame and (localPlayer.Character.HumanoidRootPart.Position - arg.HumanoidRootPart.Position).Magnitude <= 50 and isnetworkowner2(localPlayer.Character.HumanoidRootPart) and #tbl8 >= 2 then
                for k, v5 in pairs(tbl8) do
                    sizepart(v5)

                    if isnetworkowner2(v5.HumanoidRootPart) then
                        v5.HumanoidRootPart.CFrame = cFrame * CFrame.new(0, math.random(0, 2), math.random(0, 2))

                        task.spawn(function()
                            local health = v5.Humanoid.Health
                            task.wait(2.2)

                            if v5.Humanoid.Health == health and not v5:FindFirstChild("Ignored") then
                                v5.HumanoidRootPart.CFrame = v5.WorldPivot
                                Instance.new("IntValue", v5).Name = "Ignored"
                                task.wait(0.3)
                            end
                        end)
                    else
                        v5.HumanoidRootPart.CFrame = v5.WorldPivot
                        Instance.new("IntValue", v5).Name = "Ignored"
                        task.wait(0.3)
                    end

                    getgenv().DaBringMob = true
                end
            end

            return
        end

        for k, child in pairs(workspace.Enemies:GetChildren()) do
            if child ~= arg and child.Name == arg.Name and not child:FindFirstChild("Ignored") and IsMobAlive(child) and isnetworkowner2(child.HumanoidRootPart) and (child.HumanoidRootPart.Position - cFrame.Position).Magnitude <= 200 and #tbl8 < 2 then
                table.insert(tbl8, child)
            end
        end

        if cFrame and (localPlayer.Character.HumanoidRootPart.Position - arg.HumanoidRootPart.Position).Magnitude <= 50 and isnetworkowner2(localPlayer.Character.HumanoidRootPart) and #tbl8 >= 2 then
            for k, v5 in pairs(tbl8) do
                sizepart(v5)

                if isnetworkowner2(v5.HumanoidRootPart) then
                    v5.HumanoidRootPart.CFrame = cFrame * CFrame.new(0, math.random(0, 2), math.random(0, 2))

                    task.spawn(function()
                        local health = v5.Humanoid.Health
                        task.wait(2.2)

                        if v5.Humanoid.Health == health and not v5:FindFirstChild("Ignored") then
                            v5.HumanoidRootPart.CFrame = v5.WorldPivot
                            Instance.new("IntValue", v5).Name = "Ignored"
                            task.wait(0.3)
                        end
                    end)
                else
                    v5.HumanoidRootPart.CFrame = v5.WorldPivot
                    Instance.new("IntValue", v5).Name = "Ignored"
                    task.wait(0.3)
                end

                getgenv().DaBringMob = true
            end
        end

        return
    end

    delay(0.1, function()
        getgenv().DaBringMob = false
    end)
end

for k, v5 in pairs(getnilinstances()) do
    local str3 = nil

    if v5:GetAttribute("DisplayName") and string.find(v5:GetAttribute("DisplayName"), "Lv.") then
        str3 = v5:GetAttribute("DisplayName"):gsub(" %pLv. %d+%p", "")
    end

    if str3 then
        table.insert(tbl7, v5)
    end
end

for k, child in pairs(game:GetService("Workspace")._WorldOrigin.EnemySpawns:GetChildren()) do
    local str3 = nil

    if child:GetAttribute("DisplayName") and string.find(child:GetAttribute("DisplayName"), "Lv.") then
        str3 = child:GetAttribute("DisplayName"):gsub(" %pLv. %d+%p", "")
    end

    if str3 then
        table.insert(tbl7, child)
    end
end

local v5 = nil

DetectPartSpawnMob = function(arg, arg2)
    local str3, v6, v7, v8, v9, v13, v14, str4, v15, v16, v17, v18, v19, v20, str5, v21, v22, v23, v24, v25
    local v26, str6, n2
    n2 = 1

    while true do
        if n2 == 1 then
            str3 = nil

            if string.find(arg, "Lv.") then
                n2 = 2
            else
                n2 = 3
            end
        elseif n2 == 2 then
            str3 = arg:gsub(" %pLv. %d+%p", "")
            n2 = 3
        elseif n2 == 3 then
            v6, v7, v8 = pairs(tbl7)
            v9 = v8
            n2 = 4
        elseif n2 == 4 then
            v13, v14 = v6(v7, v9)

            if v13 == nil then
                n2 = 11
            else
                n2 = 5
            end
        elseif n2 == 5 then
            v9 = v13
            str4 = nil

            if string.find(v14.Name, "Lv.") then
                n2 = 6
            else
                n2 = 7
            end
        elseif n2 == 6 then
            str4 = v14.Name:gsub(" %pLv. %d+%p", "")
            n2 = 7
        elseif n2 == 7 then
            if v14:IsA("Part") and (str4 and str4 == arg or arg == v14.Name or str3 and v14.Name == str3) and (arg2 and not v14:FindFirstChild("Ignored") or not arg2) then
                n2 = 8
            else
                n2 = 4
            end
        elseif n2 == 8 then
            if table.find(tbl7, v14) then
                n2 = 10
            else
                n2 = 9
            end
        elseif n2 == 9 then
            table.insert(tbl7, v14)
            n2 = 10
        elseif n2 == 10 then
            return v14
        elseif n2 == 11 then
            v15, v16, v17 = pairs(game:GetService("Workspace")._WorldOrigin.EnemySpawns:GetChildren())
            v18 = v17
            n2 = 12
        elseif n2 == 12 then
            v19, v20 = v15(v16, v18)

            if v19 == nil then
                n2 = 19
            else
                n2 = 13
            end
        elseif n2 == 13 then
            v18 = v19
            str5 = nil

            if string.find(v20.Name, "Lv.") then
                n2 = 14
            else
                n2 = 15
            end
        elseif n2 == 14 then
            str5 = v20.Name:gsub(" %pLv. %d+%p", "")
            n2 = 15
        elseif n2 == 15 then
            if v20:IsA("Part") and (str5 and str5 == arg or arg == v20.Name or str3 and v20.Name == str3) and (arg2 and not v20:FindFirstChild("Ignored") or not arg2) then
                n2 = 16
            else
                n2 = 12
            end
        elseif n2 == 16 then
            if table.find(tbl7, v20) then
                n2 = 18
            else
                n2 = 17
            end
        elseif n2 == 17 then
            table.insert(tbl7, v20)
            n2 = 18
        elseif n2 == 18 then
            return v20
        elseif n2 == 19 then
            v21, v22, v23 = pairs(getnilinstances())
            v24 = v23
            n2 = 20
        elseif n2 == 20 then
            v25, v26 = v21(v22, v24)

            if v25 == nil then
                n2 = 29
            else
                n2 = 21
            end
        elseif n2 == 21 then
            v24 = v25
            str6 = nil

            if string.find(v26.Name, "Lv.") then
                n2 = 22
            else
                n2 = 23
            end
        elseif n2 == 22 then
            str6 = v26.Name:gsub(" %pLv. %d+%p", "")
            n2 = 23
        elseif n2 == 23 then
            if v26:IsA("Part") and (str6 and str6 == arg or arg == v26.Name or str3 and v26.Name == str3) and (arg2 and not v26:FindFirstChild("Ignored") or not arg2) then
                n2 = 24
            else
                n2 = 20
            end
        elseif n2 == 24 then
            if arg2 then
                n2 = 25
            else
                n2 = 26
            end
        elseif n2 == 25 then
            if arg2 then
                n2 = 26
            else
                n2 = 20
            end
        elseif n2 == 26 then
            if table.find(tbl7, v26) then
                n2 = 28
            else
                n2 = 27
            end
        elseif n2 == 27 then
            table.insert(tbl7, v26)
            n2 = 28
        elseif n2 == 28 then
            return v26
        elseif n2 == 29 then
            return nil
        end
    end
end

local function fn4(arg, arg2, arg3)
    local tbl8 = {}

    for k, child in pairs(arg:GetChildren()) do
        if child:IsA("BasePart") and (child.Position - arg2).magnitude <= arg3 then
            tbl8[#tbl8 + 1] = child
        end
    end

    return tbl8
end

GetAllChildAttack = function(arg)
    local children = workspace:WaitForChild("Enemies"):GetChildren()
    local children2 = workspace:WaitForChild("Characters"):GetChildren()
    local tbl8 = {}

    for k, child in pairs(children) do
        table.insert(tbl8, child)
    end

    if arg then
        for k, v6 in pairs(children2) do
            table.insert(tbl8, v6)
        end
    end

    return tbl8
end

getgenv().getBladeHits = function(arg, arg2, arg3, arg4)
    game:GetService("CollectionService")
    local tbl8 = {}
    local v6 = GetAllChildAttack(arg4)
    local v7, v8, v9 = pairs(arg2)
    local v13 = v9
    local v14 = v7
    local v15 = v8

    while true do
        local v16, v17 = v14(v15, v13)
        if v16 == nil then
            break
        end
        local v18, v19, v20 = pairs(v6)
        local v21 = v20
        local v22 = v18
        local v23 = v19
        local v24 = v16
        local v25 = v14
        local v26 = v15

        while true do
            local v27, v28 = v22(v23, v21)
            if v27 == nil then
                break
            end
            v21 = v27

            if v28:IsDescendantOf(game.Workspace) then
                local n2 = arg3

                if game.Players:GetPlayerFromCharacter(v28) then
                    n2 = arg3 / 1.5
                end

                if v28 ~= arg and v28:FindFirstChild("HumanoidRootPart") then
                    local tbl9 = {v28.HumanoidRootPart.Position}

                    if v28.HumanoidRootPart.Size.Y > 5 then
                        table.insert(tbl9, (v28.HumanoidRootPart.CFrame * CFrame.new(0, -v28.HumanoidRootPart.Size.Y * 1.5 + 3, 0)).p)
                    end

                    local flag2 = false
                    local v29, v30, v31 = pairs(tbl9)
                    local v32 = v22
                    local v34 = v23
                    local v35 = v24
                    local v36 = v25
                    local v37 = v26

                    for k, v38 in v29, v30, v31 do
                        if (v38 - v17.Position).magnitude < 10 + n2 + v28.HumanoidRootPart.Size.X / 2 then
                            flag2 = true
                            break
                        end
                    end

                    v24 = v35
                    v25 = v36
                    v26 = v37
                    v21 = v27
                    v22 = v32
                    v23 = v34

                    if flag2 then
                        local v38 = fn4(v28, v17.Position, n2 + v28.HumanoidRootPart.Size.X / 2)

                        for k, v39 in pairs(v38) do
                            tbl8[#tbl8 + 1] = v39
                        end

                        v24 = v35
                        v25 = v36
                        v26 = v37
                        v21 = v27
                        v22 = v32
                        v23 = v34
                    end
                end
            end
        end

        v13 = v24
        v14 = v25
        v15 = v26
    end

    return tbl8
end

local reRegisterAttack = game:GetService("ReplicatedStorage").Modules.Net:WaitForChild("RE/RegisterAttack")
local RegisterHit = require(game.ReplicatedStorage.Modules.Net):RemoteEvent("RegisterHit", true)

local tbl8 = {
    "RightUpperArm",
    "RightLowerArm",
    "RightHand",
    "RightUpperLeg",
    "RightLowerLeg",
    "RightFoot",
    "LeftUpperArm",
    "LeftLowerArm",
    "LeftHand",
    "LeftUpperLeg",
    "LeftLowerLeg",
    "LeftFoot",
    "UpperTorso",
    "LowerTorso",
    "Head",
}

local tbl9 = {}

while true do
    local v6, v7 = tbl8(nil, v5)
    if v6 == nil then
        break
    end
    v5 = v6
    tbl9[v7] = true
end

local CombatUtil = require(game:GetService("ReplicatedStorage").Modules.CombatUtil)

AttackAOE = function(arg, arg2)
    local tbl10 = {}
    local tbl11 = {}
    local v6 = nil
    local v7 = nil
    local getBladeHits = getgenv().getBladeHits
    local character = localPlayer.Character
    local tbl12 = {localPlayer.Character.HumanoidRootPart}
    local n2 = arg or 80

    for k, v8 in getBladeHits(character, tbl12, n2, arg2) do
        local rigOfHitPart = CombatUtil:GetRigOfHitPart(v8)

        if rigOfHitPart then
            if tbl9[v8.Name] then
                local summoner = rigOfHitPart:FindFirstChild("Summoner")
                local summoner2 = localPlayer.Character:FindFirstChild("Summoner")

                if (not summoner2 or rigOfHitPart ~= summoner2.Value.Character) and (not game.Players:GetPlayerFromCharacter(localPlayer.Character) or not summoner or summoner.Value ~= game.Players:GetPlayerFromCharacter(localPlayer.Character)) and (not v159 or not rigOfHitPart:IsDescendantOf(workspace.Enemies) or summoner2 or summoner) and rigOfHitPart ~= l_Parent_0 and CombatUtil:IsVulnerable(rigOfHitPart) then
                    v6 = rigOfHitPart
                    v7 = v8
                    table.insert(tbl10, {rigOfHitPart, v8})
                    table.insert(tbl11, rigOfHitPart)
                end
            end
        else
            warn("No rig found for hit part:", v8)
        end
    end

    local tbl13 = {}

    for k, v8 in pairs(tbl10) do
        table.insert(tbl13, v8)
    end

    table.insert(tbl13, {v6, v7})
    if #tbl13 > 0 then
        return tbl13
    end
end

AttackFunction = function(arg)
    if game.Players.LocalPlayer.Character.Stun.Value == 0 then
        local v6 = AttackAOE(arg)
        bladehit = v6

        if bladehit then
            reRegisterAttack:FireServer(0)
            RegisterHit:FireServer(table.remove(bladehit, 1)[2], bladehit)
            table.clear(bladehit)
        end
    end
end

getgenv().ClickM1 = function(arg, arg2)
    if localPlayer.Character:FindFirstChild("HumanoidRootPart") and (localPlayer.Character.HumanoidRootPart.Position - arg.HumanoidRootPart.Position).Magnitude < 70 and arg.Humanoid.Health > 0 then
        if arg2 then
            AttackFunction(80)
        else
            AttackFunction(30)
        end
    end
end

NameWeapon = function(arg, arg2)
    local v6 = next
    local children, v7 = localPlayer.Backpack:GetChildren()

    for k, v8 in v6, children, v7 do
        if v8:IsA("Tool") and v8.ToolTip == arg then
            if not arg2 then
                return v8.Name
            end
            return v8
        end
    end

    local v8 = next
    local children2, v9 = localPlayer.Character:GetChildren()

    for k, v13 in v8, children2, v9 do
        if v13:IsA("Tool") and v13.ToolTip == arg then
            if not arg2 then
                return v13.Name
            end
            return v13
        end
    end
end

equiptool = function(arg)
    if arg and localPlayer:FindFirstChild("Backpack") and localPlayer.Backpack:FindFirstChild(arg) and not localPlayer.Character.Humanoid.Sit then
        localPlayer.Character.Humanoid:EquipTool(localPlayer.Backpack:FindFirstChild(arg))
    end
end

UsedualFlock = function()
    equiptool(NameWeapon("Melee"))
end

checkplatebarito = function()
    local str3 = nil

    if game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate1.BrickColor == BrickColor.new("Sand yellow") then
        str3 = "Plate1"
    elseif game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate2.BrickColor == BrickColor.new("Sand yellow") then
        str3 = "Plate2"
    elseif game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate3.BrickColor == BrickColor.new("Sand yellow") then
        str3 = "Plate3"
    elseif game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate4.BrickColor == BrickColor.new("Sand yellow") then
        str3 = "Plate4"
    elseif game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate5.BrickColor == BrickColor.new("Sand yellow") then
        str3 = "Plate5"
    elseif game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate6.BrickColor == BrickColor.new("Sand yellow") then
        str3 = "Plate6"
    elseif game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate7.BrickColor == BrickColor.new("Sand yellow") then
        str3 = "Plate7"
    elseif game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate8.BrickColor == BrickColor.new("Sand yellow") then
        str3 = "Plate8"
    end

    return str3
end

local tbl10 = {}

DetectNameTablePart = function(arg)
    local v6 = nil
    local v7 = next

    while true do
        local v8, v9 = v7(arg, v6)
        if v8 == nil then
            break
        end
        v6 = v8
        if not table.find(tbl10, v9) then
            return v9
        end
    end
end

AutoQuestBarito = function()
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 0 then
        if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible then
            local v6 = DetectMob("Swan Pirate")

            if v6 then
                repeat
                    task.wait()
                    sizepart(v6)
                    BringMob(v6)
                    UsedualFlock()
                    ClickM1(v6)
                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, v6.HumanoidRootPart.Position, v6.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                until not IsMobAlive(v6)
            elseif typeof("Swan Pirate") == "table" then
                if #tbl10 >= 11 then
                    tbl10 = {}
                    return
                end
                local v7 = DetectPartSpawnMob(DetectNameTablePart("Swan Pirate"))

                if v7 then
                    table.insert(tbl10, DetectNameTablePart("Swan Pirate"))

                    repeat
                        wait()
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, v7.Position, v7.CFrame * CFrame.new(0, 60, 0))
                    until (v7.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 or DetectMob("Swan Pirate")

                    wait(1)
                end
            else
                local v7 = DetectPartSpawnMob("Swan Pirate", true)

                if v7 then
                    Instance.new("IntValue", v7).Name = "Ignored"

                    repeat
                        wait()
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, v7.Position, v7.CFrame * CFrame.new(0, 60, 0))
                    until (v7.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 or DetectMob("Swan Pirate")

                    wait(1)
                else
                    DeleteIgnoredMobSpawn()
                end
            end
        elseif (localPlayer.Character.HumanoidRootPart.Position - CFrame.new(-456.28952, 73.0200958, 299.895966).Position).Magnitude > 8 then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, CFrame.new(-456.28952, 73.0200958, 299.895966).Position, CFrame.new(-456.28952, 73.0200958, 299.895966))
        else
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({"StartQuest", "BartiloQuest", 1}))
        end
    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 1 then
        local Jeremy = CheckNameBoss("Jeremy")

        if Jeremy then
            repeat
                task.wait()
                sizepart(Jeremy)
                UsedualFlock()
                ClickM1(Jeremy)
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, Jeremy.HumanoidRootPart.Position, Jeremy.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
            until not IsMobAlive(Jeremy)
        end
    elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 2 then
        repeat
            task.wait()

            if (localPlayer.Character.HumanoidRootPart.Position - Vector3.new(-1835.65, 10.4325, 1679.75)).Magnitude > 100 then
                toTarget(localPlayer.Character.HumanoidRootPart.Position, Vector3.new(-1835.65, 10.4325, 1679.75), CFrame.new(-1835.65, 10.4325, 1679.75))
            else
                localPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates[checkplatebarito()].CFrame
                task.wait()
                firetouchinterest(game:GetService("Workspace").Map.Dressrosa.BartiloPlates[checkplatebarito()], game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                firetouchinterest(game:GetService("Workspace").Map.Dressrosa.BartiloPlates[checkplatebarito()], game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
            end
        until game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 3
    end
end

getgenv().Chests = {}
getgenv().BlBossHuman = {}
loadstring("    getgenv().GetChests = function()\n        local Dist = math.huge\n        local Chest\n        local Counter\n        for _, v in next, game:GetService(\"CollectionService\"):GetTagged(\"_ChestTagged\") do\n            if #getgenv().Chests < 10 then\n                local Mag = game.Players.LocalPlayer:DistanceFromCharacter(v.Position)\n                if Mag < Dist then\n                    Counter = i\n                    Dist = Mag\n                    Chest = v\n                    table.insert(getgenv().Chests, Chest)\n                end\n            end\n        end\n    end\n")()

PathFindChest = function()
    local v6 = next
    local children, v7 = game:GetService("Workspace")._WorldOrigin.PlayerSpawns.Pirates:GetChildren()

    for k, v8 in v6, children, v7 do
        if v8:IsA("Model") and v8:FindFirstChild("Part") and not v8:FindFirstChild("Ignored") then
            return v8
        end
    end
end

TweenFindChest = function()
    local v6 = PathFindChest()

    if v6 then
        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, v6.Part.Position, v6.Part.CFrame)

        if (v6.Part.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 or GetNearestChest() then
            Instance.new("IntValue", v6).Name = "Ignored"
        end
    else
        for k, child in pairs(game:GetService("Workspace")._WorldOrigin.PlayerSpawns.Pirates:GetChildren()) do
            if child:FindFirstChild("Ignored") then
                child:FindFirstChild("Ignored"):Destroy()
            end
        end
    end
end

GetNearestChest = function()
    local huge = math.huge
    local v6 = nil
    local v7 = next
    local tagged, v8 = game:GetService("CollectionService"):GetTagged("_ChestTagged")

    for k, v9 in v7, tagged, v8 do
        if not v9:GetAttribute("IsDisabled") and not v9:FindFirstChild("Ignored") then
            local v13 = localPlayer:DistanceFromCharacter(v9.Position)

            if v13 < huge then
                local v14 = i
                huge = v13
                v6 = v9
            end
        end
    end

    return v6
end

AutoMinkV2 = function()
    local v6 = GetNearestChest()

    if v6 then
        local now = nil

        repeat
            task.wait()

            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v6.Position).Magnitude <= 5 then
                if now then
                    if tick() - now >= 5 then
                        Instance.new("IntValue", v6).Name = "Ignored"
                        wait(0.5)
                    end
                else
                    now = tick()
                end

                getgenv().noclip = false
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, game)
                wait()
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, game)
                firetouchinterest(v6, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                firetouchinterest(v6, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
            else
                toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, v6.Position, v6.CFrame * CFrame.new(0, 1, 0), true)
            end
        until not v6 or not v6.Parent or not settings["Auto Upgrade Race V2-V3"] or v6:GetAttribute("IsDisabled") or v6:FindFirstChild("Ignored")

        wait(1)
    else
        local v7 = PathFindChest()

        if v7 then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, v7.Part.Position, v7.Part.CFrame)

            if (v7.Part.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 or GetNearestChest() then
                Instance.new("IntValue", v7).Name = "Ignored"
            end
        else
            for k, child in pairs(game:GetService("Workspace")._WorldOrigin.PlayerSpawns.Pirates:GetChildren()) do
                if child:FindFirstChild("Ignored") then
                    child:FindFirstChild("Ignored"):Destroy()
                end
            end
        end
    end
end

Remote = function(arg, arg2, arg3)
    if not arg and arg3 then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer(arg2, true)
    else
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer(arg, arg2, arg3)
    end
end

getgenv().tablefruitausea3 = {}
local tbl11 = {}
local tbl12 = {}
local v6 = next
local response2, v7 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits", false)

for k, v8 in v6, response2, v7 do
    if v8.Price >= 1000000 then
        table.insert(tbl11, string.split(v8.Name, "-")[1] .. " Fruit")
        getgenv().tablefruitausea3[v8.Name] = v8.Price
    end

    table.insert(tbl12, v8.Name)
end

getgenv().tablefruitausea3["Dragon (East)-Dragon (East)"] = 15000000
getgenv().tablefruitausea3["Dragon (West)-Dragon (West)"] = 15000000

getbackpack = function()
    mybackpack = {}
    local v8 = next
    local children, v9 = game.Players.LocalPlayer.Backpack:GetChildren()

    for k, v13 in v8, children, v9 do
        if v13:IsA("Tool") and table.find(tbl11, v13.Name) then
            table.insert(mybackpack, v13.Name)
        end
    end

    local v13 = next
    local children2, v14 = game.Players.LocalPlayer.Character:GetChildren()

    for k, v15 in v13, children2, v14 do
        if v15:IsA("Tool") and table.find(tbl11, v15.Name) then
            table.insert(mybackpack, v15.Name)
        end
    end

    return mybackpack
end

CheckFruitplr = function()
    local name = nil

    for k, child in pairs(localPlayer.Backpack:GetChildren()) do
        if string.find(child.Name, "Fruit") then
            name = child.Name
        end
    end

    for k, child in pairs(localPlayer.Character:GetChildren()) do
        if string.find(child.Name, "Fruit") then
            name = child.Name
        end
    end

    return name
end

TakeFruitInventory = function(arg)
    local huge = math.huge
    local v8 = nil
    local response3, v9 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory")
    local v13 = v9
    local v14 = next
    local v15 = response3

    while true do
        local v16, v17 = v14(v15, v13)
        if v16 == nil then
            break
        end
        v13 = v16

        if v17.Type == "Blox Fruit" then
            if not arg then
                for k, v18 in pairs(getgenv().tablefruitausea3) do
                    if v17.Name == k and tonumber(v18) < tonumber(huge) then
                        huge = v18
                        v8 = k
                    end
                end

                v13 = v16
                continue
            end

            if not getgenv().tablefruitausea3[v17.Name] then
                return v17.Name
            end
        end
    end

    return v8
end

CheckCDSkillTransformation2 = function(arg, arg2)
    local v8 = next
    local children, v9 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[arg]:GetChildren()

    for k, v13 in v8, children, v9 do
        if v13:IsA("Frame") and (v13.Name ~= "Template" and not string.find(v13.Title.Text, "Transformation") and arg2[v13.Name] and v13.Title.TextColor3 == Color3.new(1, 1, 1) and v13.Cooldown.Size == UDim2.new(0, 0, 1, -1) or v13.Cooldown.Size == UDim2.new(1, 0, 1, -1)) then
            return v13
        end
    end
end

CheckCDSkillTransformation = function(arg, arg2)
    local v8 = next
    local children, v9 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[arg]:GetChildren()

    for k, v13 in v8, children, v9 do
        if v13:IsA("Frame") and (v13.Name ~= "Template" and not string.find(v13.Title.Text, "Transformation") and arg2[v13.Name] and v13.Title.TextColor3 == Color3.new(1, 1, 1) and v13.Cooldown.Size == UDim2.new(0, 0, 1, -1) or v13.Cooldown.Size == UDim2.new(1, 0, 1, -1)) then
            return v13
        end
    end
end

AutoAllSkill = function(arg)
    local tbl13 = {Z = true, X = true, C = true, V = true, F = true}
    local Melee = NameWeapon("Melee")
    local Sword = NameWeapon("Sword")
    local v8 = NameWeapon("Blox Fruit")
    local Gun = NameWeapon("Gun")
    local skills = game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills

    if (not Melee or skills:FindFirstChild(Melee)) and (not Sword or skills:FindFirstChild(Sword)) and (not v8 or skills:FindFirstChild(v8)) and (not Gun or skills:FindFirstChild(Gun)) then
        local v9 = Melee and CheckCDSkillTransformation(Melee, tbl13) or Sword and CheckCDSkillTransformation(Sword, tbl13) or v8 and CheckCDSkillTransformation(v8, tbl13) or Gun and CheckCDSkillTransformation(Gun, tbl13)

        if v9 then
            equiptool(v9.Parent.Name)
            game:GetService("VirtualInputManager"):SendKeyEvent(true, v9.Name, false, game)
            task.wait(0.5)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, v9.Name, false, game)
        end

        return
    end

    if Melee then
        equiptool(Melee)
    end

    wait(0.2)

    if Sword then
        equiptool(Sword)
    end

    wait(0.2)

    if v8 then
        equiptool(v8)
    end

    wait(0.2)

    if Gun then
        equiptool(Gun)
    end
end

DetectSeabeast = function()
    local v8 = next
    local children, v9 = game:GetService("Workspace").SeaBeasts:GetChildren()

    for k, v13 in v8, children, v9 do
        if v13.Name == "SeaBeast1" then
            local str3 = v13.HealthBBG.Frame.TextLabel.Text:gsub("/%d+,%d+", "")
            local text = v13.HealthBBG.Frame.TextLabel.Text
            local str4

            if string.find(str3, ",") then
                str4 = text:gsub("%d+,%d+/", "")
            else
                str4 = text:gsub("%d+/", "")
            end

            local str5 = str4:gsub(",", "")
            if tonumber(str5) >= 90000 then
                return v13
            end
        end
    end

    return false
end

TeleportSeaEvents = function(arg)
    if not arg:FindFirstChild("Engine") then
        if arg.Name == "SeaBeast1" then
            if (Vector3.new(0, arg:FindFirstChild("HumanoidRootPart").Position.Y, 0) - Vector3.new(0, game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y, 0)).Magnitude <= 175 then
                toTarget(localPlayer.Character.HumanoidRootPart.Position, arg.HumanoidRootPart.Position, arg.HumanoidRootPart.CFrame * CFrame.new(0, 200, 50))
            else
                toTarget(localPlayer.Character.HumanoidRootPart.Position, Vector3.new(arg.HumanoidRootPart.Position.X, game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y, arg.HumanoidRootPart.Position.Z), CFrame.new(arg.HumanoidRootPart.Position.X, game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y + 200, arg.HumanoidRootPart.Position.Z))
            end
        else
            local n2 = 20

            if arg.Name == "Terrorshark" then
                n2 = 60
            end

            toTarget(localPlayer.Character.HumanoidRootPart.Position, arg.HumanoidRootPart.Position, arg.HumanoidRootPart.CFrame * CFrame.new(0, n2, 0))
        end

        return
    end

    toTarget(localPlayer.Character.HumanoidRootPart.Position, arg.Engine.Position, arg.Engine.CFrame * CFrame.new(0, -30, 0))
end

AutoFishV2 = function()
    local v8 = DetectSeabeast()
    local v9 = checkboat()

    if v8 then
        local humanoidRootPart

        repeat
            task.wait()
            TeleportSeaEvents(v8)
            humanoidRootPart = v8:FindFirstChild("HumanoidRootPart")
            getgenv().AimPos = CFrame.new(humanoidRootPart.Position.X, 40, humanoidRootPart.Position.Z)

            if localPlayer:DistanceFromCharacter(humanoidRootPart.Position) < 400 then
                AutoAllSkill()
            end
        until not v8 or not v8.Parent or v8.Health.Value <= 0 or not settings["Auto Upgrade Race V2-V3"]
    elseif v9 then
        local cframe = CFrame.new(753.0653686523438, v9.WorldPivot.Y, 6994.5146484375)

        if (v9.VehicleSeat.Position - cframe.Position).Magnitude > 50 then
            v9.VehicleSeat.CFrame = cframe
        elseif not localPlayer.Character.Humanoid.Sit then
            toTarget(localPlayer.Character.HumanoidRootPart.Position, v9.VehicleSeat.Position, v9.VehicleSeat.CFrame)
        end
    else
        local cframe = CFrame.new(-11.94833755493164, 10.293913841247559, 2957.010498046875)

        if (cframe.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude > 8 then
            toTarget(localPlayer.Character.HumanoidRootPart.Position, cframe.Position, cframe)
        else
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", "PirateBrigade")
        end
    end
end

local tbl13 = {}
local tbl14 = {}

DetectPlayerAngel = function()
    for k, child in pairs(game:GetService("Players"):GetChildren()) do
        if child.Name ~= localPlayer.Name and game:GetService("Workspace").Characters:FindFirstChild(child.Name) and child.Data.Race.Value == "Skypiea" and not table.find(tbl13, child.Name) and child.Character:FindFirstChild("Humanoid") and child.Character.Humanoid.Health > 0 then
            return child
        end
    end
end

DetectPlayerGhoul = function()
    for k, child in pairs(game:GetService("Players"):GetChildren()) do
        if child.Name ~= localPlayer.Name and game:GetService("Workspace").Characters:FindFirstChild(child.Name) and not table.find(tbl14, child.Name) and child.Character:FindFirstChild("Humanoid") and child.Character.Humanoid.Health > 0 then
            return child
        end
    end
end

CheckSafezone = function(arg)
    for k, child in pairs(game:GetService("Workspace")._WorldOrigin.SafeZones:GetChildren()) do
        if child:IsA("Part") and (child.Position - arg.HumanoidRootPart.Position).magnitude <= 400 and arg.Humanoid.Health / arg.Humanoid.MaxHealth >= 0.9 then
            return true
        end
    end

    return false
end

CheckPlayercantAttack = function(arg)
    for k, descendant in pairs(game.Players.LocalPlayer.PlayerGui.Notifications:GetDescendants()) do
        if descendant:IsA("TextLabel") and string.find(descendant.Text, "attack") and not descendant:FindFirstChild(arg.Name) then
            local textBox = Instance.new("TextBox")
            textBox.Parent = descendant.Parent
            textBox.Name = arg.Name
            descendant:Destroy()
            return true
        end
    end
end

CheckAcientOneStatus = function()
    if not game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
        return "You have yet to achieve greatness"
    end
    local response3, v8, v9 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("UpgradeRace", "Check")
    if response3 == 1 then
        return "Required Train More"
    end

    if response3 == 2 or response3 == 4 or response3 == 7 then
        return "Can Buy Gear With " .. v9 .. " Fragments"
    end

    if response3 == 3 then
        return "Required Train More"
    end

    if response3 == 5 then
        return "You Are Done Your Race."
    end

    if response3 == 6 then
        return "Upgrades completed: " .. v8 - 2 .. "/3, Need Trains More"
    end

    if response3 == 8 then
        return "Remaining " .. 10 - v8 .. " training sessions."
    end

    if response3 == 0 then
        return "Ready For Trial"
    end
    return "You have yet to achieve greatness"
end

CheckGoTrain = function()
    local v8 = CheckAcientOneStatus()
    if not string.find(v8, "Upgrades completed") and v8 ~= "Required Train More" and not string.find(v8, "training sessions.") and not string.find(v8, "Can Buy Gear") then
        return
    end
    return true
end

local tbl15 = {
    {
        "Baking Staff",
        "Head Baker",
        "Cake Guard",
        "Cookie Crafter",
    },
    {
        "Peanut Scout",
        "Peanut President",
        "Ice Cream Chef",
        "Ice Cream Commander",
    },
    {
        "Reborn Skeleton",
        "Demonic Soul",
        "Living Zombie",
        "Posessed Mummy",
    },
    {
        "Cocoa Warrior",
        "Chocolate Bar Battler",
        "Candy Rebel",
        "Sweet Thief",
    },
    {
        "Isle Champion",
        "Serpent Hunter",
        "Skull Slayer",
        "Sun-kissed Warrior",
    },
    {"Fishman Raider", "Fishman Captain"},
    {"Forest Pirate", "Mythological Pirate"},
    {"Jungle Pirate", "Musketeer Pirate"},
    {
        "Dragon Crew Warrior",
        "Dragon Crew Archer",
        "Hydra Enforcer",
        "Venomous Assailant",
    },
    {"Pirate Millionaire", "Pistol Billionaire"},
}

BuyGearV4 = function()
    if string.find(CheckAcientOneStatus(), "Can Buy Gear") then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("UpgradeRace", "Buy")
    end
end

VerifyNearbyTrial = function()
    local tbl16 = {
        "Trial of the Machine",
        "Trial of Speed",
        "Trial of Strength",
        "Trial of Water",
        "Trial of the King",
        "Trial of Carnage",
    }

    local v8 = next
    local children, v9 = workspace._WorldOrigin.Locations:GetChildren()

    for k, v13 in v8, children, v9 do
        if table.find(tbl16, v13.Name) and localPlayer:DistanceFromCharacter(v13.Position) < 1500 then
            return true
        end
    end
end

TeleportSeabeast2 = function(arg)
    if (Vector3.new(0, arg:FindFirstChild("HumanoidRootPart").Position.Y, 0) - Vector3.new(0, -60, 0)).Magnitude <= 175 then
        toTarget(localPlayer.Character.HumanoidRootPart.Position, arg.HumanoidRootPart.Position, arg.HumanoidRootPart.CFrame * CFrame.new(0, 200, 50))
    else
        toTarget(localPlayer.Character.HumanoidRootPart.Position, Vector3.new(arg.HumanoidRootPart.Position.X, -60, arg.HumanoidRootPart.Position.Z), CFrame.new(arg.HumanoidRootPart.Position.X, 140, arg.HumanoidRootPart.Position.Z))
    end
end

TrialHuman = function()
    if game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Trial of Strength") then
        local trialOfStrength = game:GetService("Workspace")._WorldOrigin.Locations["Trial of Strength"]
        StrengthPart = trialOfStrength

        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - StrengthPart.Position).Magnitude <= 1000 then
            for k, child in pairs(game.Workspace.Enemies:GetChildren()) do
                if (child.HumanoidRootPart.Position - StrengthPart.Position).Magnitude <= 1000 and IsMobAlive(child) then
                    return child
                end
            end
        end
    end
end

TrialGhoul = function()
    if game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Trial of Carnage") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game:GetService("Workspace")._WorldOrigin.Locations["Trial of Carnage"].Position).Magnitude <= 1000 then
        for k, child in pairs(game.Workspace.Enemies:GetChildren()) do
            if (child.HumanoidRootPart.Position - game:GetService("Workspace")._WorldOrigin.Locations["Trial of Carnage"].Position).Magnitude <= 1000 and IsMobAlive(child) then
                return child
            end
        end
    end
end

GetSeaBeastTrial = function()
    if not game.Workspace.Map:FindFirstChild("FishmanTrial") then
        return
    end
    local trialOfWater = nil

    if game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Trial of Water") then
        trialOfWater = game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Trial of Water")
    end

    if trialOfWater then
        local v8 = next
        local children, v9 = game:GetService("Workspace").SeaBeasts:GetChildren()

        for k, v13 in v8, children, v9 do
            if string.find(v13.Name, "SeaBeast") and v13:FindFirstChild("HumanoidRootPart") and (v13.HumanoidRootPart.Position - trialOfWater.Position).Magnitude <= 1500 and v13.Health.Value > 0 then
                return v13
            end
        end
    end
end

DetectGearUp = function()
    local v8 = nil
    local Buttons = require(game:GetService("Players").LocalPlayer.PlayerGui.TempleGui.LocalScriptTemple.Buttons)
    Buttons.Gear1.GearType = "Default"
    Buttons.Gear4.GearType = "Default"
    Buttons.Gear5.GearType = "Default"
    Buttons.Gear2.GearType = "Alpha"
    Buttons.Gear2.CanSelect = false
    Buttons.Gear3.CanSelect = false
    local response3 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TempleClock", "Check")
    l_Data_1 = response3
    v33 = l_Data_1.Race
    local flag2 = l_Data_1.HadPoint == true
    v11 = flag2
    local flag3 = l_Data_1.RaceLevel >= 2
    v10 = flag3
    v12 = l_Data_1.RaceDetails
    local gear2 = Buttons.Gear2
    local gearType = l_Data_1.RaceDetails.Gears[1] == "A" and "Alpha" or l_Data_1.RaceDetails.Gears[1] == "B" and "Omega" or "Blank"
    gear2.GearType = gearType
    local gear3 = Buttons.Gear3
    local gearType2 = l_Data_1.RaceDetails.Gears[2] == "A" and "Alpha" or l_Data_1.RaceDetails.Gears[2] == "B" and "Omega" or "Blank"
    gear3.GearType = gearType2
    local gear4 = Buttons.Gear4
    local gearType3 = l_Data_1.RaceDetails.Gears[3] == "A" and "Alpha" or l_Data_1.RaceDetails.Gears[3] == "B" and "Omega" or "Blank"
    gear4.GearType = gearType3
    local gear22 = Buttons.Gear2
    local unlocked = false

    if l_Data_1.RaceDetails.A + l_Data_1.RaceDetails.B >= 0 then
        unlocked = v10
    end

    gear22.Unlocked = unlocked
    local gear32 = Buttons.Gear3
    local unlocked2 = false

    if l_Data_1.RaceDetails.A + l_Data_1.RaceDetails.B >= 1 then
        unlocked2 = v10
    end

    gear32.Unlocked = unlocked2
    local gear42 = Buttons.Gear4
    local unlocked3 = false

    if l_Data_1.RaceDetails.A + l_Data_1.RaceDetails.B >= 2 then
        unlocked3 = v10
    end

    gear42.Unlocked = unlocked3
    Buttons.Gear5.CanSelect = false
    Buttons.Gear5.Unlocked = false

    if l_Data_1.RaceDetails.C >= 1 then
        Buttons.Gear5.Unlocked = true
    end

    Buttons.Gear1.Unlocked = true

    if v10 then
        Buttons.Gear1.CanSelect = false
        Buttons.Gear1.GearType = "Default"
    else
        Buttons.Gear1.CanSelect = true
        Buttons.Gear1.GearType = "Blank"
        v11 = true
    end

    if v11 then
        local gear23 = Buttons.Gear2
        local canSelect = false

        if l_Data_1.RaceDetails.A + l_Data_1.RaceDetails.B == 0 then
            canSelect = v10
        end

        gear23.CanSelect = canSelect
        local gear33 = Buttons.Gear3
        local canSelect2 = false

        if l_Data_1.RaceDetails.A + l_Data_1.RaceDetails.B == 1 then
            canSelect2 = v10
        end

        gear33.CanSelect = canSelect2
        local gear43 = Buttons.Gear4
        local canSelect3 = false

        if l_Data_1.RaceDetails.A + l_Data_1.RaceDetails.B >= 2 then
            canSelect3 = v10
        end

        gear43.CanSelect = canSelect3

        if l_Data_1.RaceDetails.A + l_Data_1.RaceDetails.B >= 3 then
            Buttons.Gear2.CanSelect = true
            Buttons.Gear3.CanSelect = true
            Buttons.Gear4.CanSelect = true

            if Buttons.Gear2.GearType == "Alpha" and Buttons.Gear3.GearType == "Alpha" and Buttons.Gear4.GearType == "Omega" then
                Buttons.Gear4.CanSelect = false
            elseif Buttons.Gear2.GearType == "Omega" and Buttons.Gear3.GearType == "Omega" and Buttons.Gear4.GearType == "Alpha" then
                Buttons.Gear4.CanSelect = false
            elseif Buttons.Gear2.GearType == "Alpha" and Buttons.Gear3.GearType == "Omega" and Buttons.Gear4.GearType == "Omega" then
                Buttons.Gear4.CanSelect = false
                Buttons.Gear2.CanSelect = false
            elseif Buttons.Gear2.GearType == "Omega" and Buttons.Gear3.GearType == "Alpha" and Buttons.Gear4.GearType == "Omega" then
                Buttons.Gear4.CanSelect = false
                Buttons.Gear3.CanSelect = false
            elseif Buttons.Gear2.GearType == "Omega" and Buttons.Gear3.GearType == "Alpha" and Buttons.Gear4.GearType == "Alpha" then
                Buttons.Gear4.CanSelect = false
                Buttons.Gear2.CanSelect = false
            elseif Buttons.Gear2.GearType == "Alpha" and Buttons.Gear3.GearType == "Omega" and Buttons.Gear4.GearType == "Alpha" then
                Buttons.Gear4.CanSelect = false
                Buttons.Gear3.CanSelect = false
            end
        end
    else
        Buttons.Gear2.CanSelect = false
        Buttons.Gear3.CanSelect = false
        Buttons.Gear4.CanSelect = false
    end

    local v9 = next

    while true do
        local v13, v14 = v9(Buttons, v8)
        if v13 == nil then
            break
        end
        v8 = v13
        if v14.CanSelect then
            return v13
        end
    end
end

ChooseGearV4 = function()
    local response3 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TempleClock", "Check")

    if response3 and response3.HadPoint and DetectGearUp() then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TempleClock", "SpendPoint", DetectGearUp(), "Omega")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TempleClock", "SpendPoint", DetectGearUp(), "Alpha")
    end
end

CheckMultiAccount = function()
    local tbl16 = {}

    for k, child in pairs(game:GetService("Players"):GetChildren()) do
        if table.find(getgenv().AcountHelp, child.Name) then
            tbl16[child.Name] = child.Data.Race.Value
        end
    end

    return tbl16
end

CheckMultiTeleDoor = function()
    local n2 = 0
    local v8 = next
    local children, v9 = game.Workspace.Characters:GetChildren()

    for k, v13 in v8, children, v9 do
        local v14 = CheckMultiAccount()[v13.Name]

        if v14 and (v13.HumanoidRootPart.Position - game:GetService("Workspace").Map["Temple of Time"][v14 .. "Corridor"].Door.Door.RightDoor.Union.Position).Magnitude < 100 then
            n2 = n2 + 1
        end
    end

    if n2 >= 2 then
        return true
    end
end

local MobileUIController = require(game:GetService("ReplicatedStorage").Controllers.UI.MobileUIController)

local tbl16 = {
    "Last Resort",
    "Agility",
    "Water Body",
    "Heavenly Blood",
    "Energy Core",
    "Heightened Senses",
}

DetectNameAbility = function(arg)
    local v8 = next
    local children, v9 = arg:GetChildren()

    for k, v13 in v8, children, v9 do
        if table.find(tbl16, v13.Name) then
            return true
        end
    end
end

DetectMain = function(arg)
    local v8 = nil
    local n2 = -math.huge

    for k, v9 in pairs(getgenv().AccountMain) do
        if n2 < v9 then
            v8 = k
            n2 = v9
        end
    end

    if arg and v8 then
        return true, v8
    end

    if v8 == game.Players.LocalPlayer.Name then
        return true, v8
    end
    return false
end

GetOtherPlayerRaces = function(arg)
    local tbl17 = {}

    for k, child in pairs(game:GetService("Players"):GetChildren()) do
        if child.Name == arg then
            tbl17[child.Name] = child.Data.Race.Value
        end
    end

    return tbl17
end

CheckMultiPlayerNearDoor = function()
    local n2 = 0
    local v8, v9 = DetectMain(true)

    if v8 then
        local v13 = next
        local children, v14 = game.Workspace.Characters:GetChildren()

        for k, v15 in v13, children, v14 do
            if v15.Name == v9 then
                local v16 = GetOtherPlayerRaces(v15.Name)[v15.Name]

                if v16 and DetectNameAbility(v15.HumanoidRootPart) and (v15.HumanoidRootPart.Position - game:GetService("Workspace").Map["Temple of Time"][v16 .. "Corridor"].Door.Door.RightDoor.Union.Position).Magnitude < 100 then
                    n2 = n2 + 1
                end
            end
        end
    end

    if n2 >= 1 then
        return true
    end
end

local tbl17 = {}

getfm = function()
    if game:GetService("Lighting"):GetAttribute("MoonPhase") == 5 and (math.floor(game.Lighting.ClockTime) >= 12 or math.floor(game.Lighting.ClockTime) < 5) then
        return " | Full Moon"
    end

    if game:GetService("Lighting"):GetAttribute("MoonPhase") == 4 then
        return " | Next Night"
    end
    return " | Bad Moon"
end

local n2 = nil

spawn(function()
    while task.wait() do
        local ok, result = pcall(function()
            if not settings["Start Kaitun"] then
                return
            end
            local v8 = CheckRace()

            if v8 == " V1" then
                if game.Workspace:GetAttribute("MAP") ~= "Sea2" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({"TravelDressrosa"}))
                    return
                end

                if localPlayer.Data.Beli.Value < 500000 then
                    lib:Notify({
                        Title = "Banana Cat Hub",
                        Content = "Beli >= 500k",
                        SubContent = "...",
                        Duration = 5,
                    })

                    wait(5)
                    return
                end

                if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "2")
                elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1") == 1 then
                    if DetectItemPlr("Flower 1") then
                        if DetectItemPlr("Flower 2") then
                            if not DetectItemPlr("Flower 3") then
                                local v9 = DetectMob("Swan Pirate")

                                if v9 then
                                    repeat
                                        task.wait()
                                        sizepart(v9)
                                        BringMob(v9)
                                        UsedualFlock()
                                        ClickM1(v9)
                                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, v9.HumanoidRootPart.Position, v9.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                                    until not IsMobAlive(v9)
                                elseif typeof("Swan Pirate") == "table" then
                                    if #tbl17 >= 11 then
                                        tbl17 = {}
                                        return
                                    end
                                    local v13 = DetectPartSpawnMob(DetectNameTablePart("Swan Pirate"))

                                    if v13 then
                                        table.insert(tbl17, DetectNameTablePart("Swan Pirate"))

                                        repeat
                                            wait()
                                            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, v13.Position, v13.CFrame * CFrame.new(0, 60, 0))
                                        until (v13.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 or DetectMob("Swan Pirate")

                                        wait(1)
                                    end
                                else
                                    local v13 = DetectPartSpawnMob("Swan Pirate", true)

                                    if v13 then
                                        Instance.new("IntValue", v13).Name = "Ignored"

                                        repeat
                                            wait()
                                            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, v13.Position, v13.CFrame * CFrame.new(0, 60, 0))
                                        until (v13.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 or DetectMob("Swan Pirate")

                                        wait(1)
                                    else
                                        DeleteIgnoredMobSpawn()
                                    end
                                end
                            end
                        else
                            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, game:GetService("Workspace").Flower2.Position, game:GetService("Workspace").Flower2.CFrame)
                        end
                    else
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, game:GetService("Workspace").Flower1.Position, game:GetService("Workspace").Flower1.CFrame)
                    end
                elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
                    if (CFrame.new(-2777.6001, 72.9661407, -3571.42285).Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude < 8 then
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, CFrame.new(-2777.6001, 72.9661407, -3571.42285).Position, CFrame.new(-2777.6001, 72.9661407, -3571.42285))
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "3")
                    end
                else
                    AutoQuestBarito()
                end
            elseif v8 == " V2" then
                if game.Workspace:GetAttribute("MAP") ~= "Sea2" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({"TravelDressrosa"}))
                    return
                end
                local response3 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
                if response3 == 0 then
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
                    return
                end

                if response3 == 2 then
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
                    return
                end

                if response3 == -1 then
                    lib:Notify({
                        Title = "Banana Cat Hub",
                        Content = "Beli >= 2m",
                        SubContent = "...",
                        Duration = 5,
                    })

                    wait(5)
                    return
                end

                local str3 = game:GetService("Players").LocalPlayer.Data.Race.Value .. v8

                if str3 == "Human V2" then
                    local flag2

                    if table.find(BlBossHuman, "Jeremy") then
                        flag2 = false
                    else
                        flag2 = true
                    end

                    if flag2 then
                        flag2 = CheckNameBoss("Jeremy")
                    end

                    if not flag2 then
                        if table.find(BlBossHuman, "Orbitus") then
                            flag2 = false
                        else
                            flag2 = true
                        end

                        if flag2 then
                            flag2 = CheckNameBoss("Orbitus")
                        end
                    end

                    if not flag2 then
                        if table.find(BlBossHuman, "Diamond") then
                            flag2 = false
                        else
                            flag2 = true
                        end

                        if flag2 then
                            flag2 = CheckNameBoss("Diamond")
                        end
                    end

                    if flag2 then
                        local v9 = CheckNameBoss(flag2.Name)

                        if v9 then
                            repeat
                                task.wait()
                                sizepart(v9)
                                UsedualFlock()
                                ClickM1(v9)
                                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, v9.HumanoidRootPart.Position, v9.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                            until not IsMobAlive(v9)

                            if not table.find(BlBossHuman, flag2.Name) then
                                table.insert(BlBossHuman, flag2.Name)
                            end
                        end
                    else
                        lib:Notify({
                            Title = "Banana Cat Hub",
                            Content = "Waiting Boss Spawn",
                            SubContent = "...",
                            Duration = 5,
                        })

                        wait(5)
                    end
                elseif str3 == "Mink V2" then
                    AutoMinkV2()
                elseif str3 == "Cyborg V2" then
                    if not CheckFruitplr() and TakeFruitInventory(true) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit", TakeFruitInventory(true))
                    end
                elseif str3 == "Fishman V2" then
                    AutoFishV2()
                elseif str3 == "Skypiea V2" then
                    local v9 = DetectPlayerAngel()

                    if v9 then
                        table.insert(tbl13, v9.Name)
                        local now = tick()

                        repeat
                            wait()

                            spawn(function()
                                if game:GetService("Players").LocalPlayer.PlayerGui.Main.BottomHUDList.PvpDisabled.Visible then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                                end
                            end)

                            spawn(function()
                                getgenv().AimPos = CFrame.new(v9.Character.HumanoidRootPart.CFrame.p, v9.Character.HumanoidRootPart.Position + v9.Character.HumanoidRootPart.Velocity / 1.2)

                                if localPlayer:DistanceFromCharacter(v9.Character.HumanoidRootPart.Position) < 50 then
                                    localPlayer.Character.HumanoidRootPart.CFrame = v9.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                                else
                                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, v9.Character.HumanoidRootPart.Position, v9.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3))
                                end
                            end)

                            spawn(function()
                                if localPlayer:DistanceFromCharacter(v9.Character.HumanoidRootPart.Position) < 50 then
                                    AutoAllSkill(true)
                                end
                            end)
                        until tick() - now >= 70 or not v9.Character or not v9.Character.Parent or v9.Character.Humanoid.Health == 0 or CheckSafezone(v9.Character) or CheckPlayercantAttack(v9.Character) or not settings["Auto Upgrade Race V2-V3"]
                    else
                        HopServer()
                        wait(5)
                    end
                elseif str3 == "Ghoul V2" then
                    local v9 = DetectPlayerGhoul()

                    if v9 then
                        table.insert(tbl14, v9.Name)
                        local now = tick()

                        repeat
                            wait()

                            spawn(function()
                                if game:GetService("Players").LocalPlayer.PlayerGui.Main.BottomHUDList.PvpDisabled.Visible then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                                end
                            end)

                            spawn(function()
                                getgenv().AimPos = CFrame.new(v9.Character.HumanoidRootPart.CFrame.p, v9.Character.HumanoidRootPart.Position + v9.Character.HumanoidRootPart.Velocity / 1.2)

                                if localPlayer:DistanceFromCharacter(v9.Character.HumanoidRootPart.Position) < 50 then
                                    localPlayer.Character.HumanoidRootPart.CFrame = v9.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                                else
                                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, v9.Character.HumanoidRootPart.Position, v9.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3))
                                end
                            end)

                            spawn(function()
                                if localPlayer:DistanceFromCharacter(v9.Character.HumanoidRootPart.Position) < 50 then
                                    AutoAllSkill(true)
                                end
                            end)
                        until tick() - now >= 70 or not v9.Character or not v9.Character.Parent or v9.Character.Humanoid.Health == 0 or CheckSafezone(v9.Character) or CheckPlayercantAttack(v9.Character) or not settings["Auto Upgrade Race V2-V3"]
                    else
                        HopServer()
                        wait(5)
                    end
                end
            else
                if game.Workspace:GetAttribute("MAP") ~= "Sea3" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                    return
                end

                if CheckGoTrain() and settings["Account Main Up Gear"] then
                    if not n2 then
                        n2 = CountFarmTrain() + 1
                        task.wait(0.01)
                    end

                    if getgenv().AccountMain[localPlayer.Name] then
                        getgenv().SendMessage("AccMainRemove")
                    end

                    getgenv().SendMessageActiveRace("FarmTrain")
                    local v9 = CheckAcientOneStatus()

                    if string.find(v9, "Can Buy Gear") then
                        local num = tonumber(v9:match("%d+"))
                        local v13 = tbl15[1]

                        if game.Players.LocalPlayer.Data.Fragments.Value < num then
                            local v14 = DetectMob(v13)

                            if v14 then
                                repeat
                                    task.wait()
                                    sizepart(v14)
                                    BringMob(v14)
                                    UsedualFlock()
                                    ClickM1(v14)
                                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, v14.HumanoidRootPart.Position, v14.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                                until not IsMobAlive(v14)
                            elseif typeof(v13) == "table" then
                                if #v13 <= #tbl17 then
                                    tbl17 = {}
                                    return
                                end
                                local v15 = DetectPartSpawnMob(DetectNameTablePart(v13))

                                if v15 then
                                    table.insert(tbl17, DetectNameTablePart(v13))

                                    repeat
                                        wait()
                                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, v15.Position, v15.CFrame * CFrame.new(0, 60, 0))
                                    until (v15.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 or DetectMob(v13)

                                    wait(1)
                                end
                            else
                                local v15 = DetectPartSpawnMob(v13, true)

                                if v15 then
                                    Instance.new("IntValue", v15).Name = "Ignored"

                                    repeat
                                        wait()
                                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, v15.Position, v15.CFrame * CFrame.new(0, 60, 0))
                                    until (v15.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 or DetectMob(v13)

                                    wait(1)
                                else
                                    DeleteIgnoredMobSpawn()
                                end
                            end

                            return
                        end
                    end

                    if localPlayer.Character:FindFirstChild("RaceEnergy") and localPlayer.Character.RaceEnergy.Value >= 1 and localPlayer.Character:FindFirstChild("RaceTransformed") and not localPlayer.Character.RaceTransformed.Value then
                        localPlayer.Backpack.Awakening.RemoteFunction:InvokeServer(unpack({true}))
                    end

                    BuyGearV4()
                    local v13 = tbl15[n2]
                    local v14 = DetectMob(v13)

                    if v14 then
                        repeat
                            task.wait()
                            sizepart(v14)
                            BringMob(v14)
                            UsedualFlock()
                            ClickM1(v14)
                            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, v14.HumanoidRootPart.Position, v14.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                        until not IsMobAlive(v14) or not CheckGoTrain()
                    elseif typeof(v13) == "table" then
                        if #v13 <= #tbl17 then
                            tbl17 = {}
                            return
                        end
                        local v15 = DetectPartSpawnMob(DetectNameTablePart(v13))

                        if v15 then
                            table.insert(tbl17, DetectNameTablePart(v13))

                            repeat
                                wait()
                                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, v15.Position, v15.CFrame * CFrame.new(0, 60, 0))
                            until (v15.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 or DetectMob(v13) or not CheckGoTrain()

                            wait(1)
                        end
                    else
                        local v15 = DetectPartSpawnMob(v13, true)

                        if v15 then
                            Instance.new("IntValue", v15).Name = "Ignored"

                            repeat
                                wait()
                                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, v15.Position, v15.CFrame * CFrame.new(0, 60, 0))
                            until (v15.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 or DetectMob(v13) or not CheckGoTrain()

                            wait(1)
                        else
                            DeleteIgnoredMobSpawn()
                        end
                    end
                else
                    if settings["Account Main Up Gear"] then
                        getgenv().SendAccMain()
                        if not DetectMain() then
                            toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, CFrame.new(-12463.8740234375, 374.9144592285156, -7523.77392578125).Position, CFrame.new(-12463.8740234375, 374.9144592285156, -7523.77392578125))
                            return
                        end
                    end

                    if settings["Auto Kick When End Full Moon"] then
                        if getfm() == " | Full Moon" then
                            getgenv().AutoKick = true
                        elseif getgenv().AutoKick then
                            game.Players.LocalPlayer:Kick("Auto Kick Reset Server")
                        end
                    end

                    local clockTime = game.Lighting.ClockTime
                    if not workspace.Map:FindFirstChild("Temple of Time") and not VerifyNearbyTrial() then
                        toTarget(localPlayer.Character.HumanoidRootPart.Position, Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586), CFrame.new(28282.5703125, 14896.8505859375, 105.1042709350586))
                        return
                    end

                    if (not workspace.Map:FindFirstChild("Temple of Time") or not workspace.Map["Temple of Time"].FFABorder:FindFirstChild("Forcefield") or workspace.Map["Temple of Time"].FFABorder.Forcefield.Transparency ~= 1) and not VerifyNearbyTrial() then
                        if getgenv().VerifyTrial then
                            getgenv().VerifyTrial = false
                        end

                        if workspace.Map:FindFirstChild("Temple of Time") and workspace.Map["Temple of Time"].FFABorder.Forcefield.Transparency ~= 1 and not settings["Account Main Up Gear"] then
                            localPlayer.Character.Humanoid.Health = 0
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
                        if VerifyNearbyTrial() and not getgenv().VerifyTrial then
                            getgenv().VerifyTrial = true
                        end

                        if not VerifyNearbyTrial() then
                            return
                        end
                        local value = game.Players.LocalPlayer.Data.Race.Value

                        if value == "Human" then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game:GetService("Workspace")._WorldOrigin.Locations["Trial of Strength"].Position).Magnitude <= 1000 then
                                local v9

                                repeat
                                    task.wait()
                                    v9 = TrialHuman()

                                    if v9 then
                                        repeat
                                            wait()
                                            sizepart(v9)
                                            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, v9.HumanoidRootPart.Position, v9.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                                            ClickM1(v9)
                                            UsedualFlock()
                                        until not IsMobAlive(v9) or not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game:GetService("Workspace")._WorldOrigin.Locations["Trial of Strength"].Position).Magnitude > 1000
                                    end
                                until not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game:GetService("Workspace")._WorldOrigin.Locations["Trial of Strength"].Position).Magnitude > 1000
                            end
                        elseif value == "Skypiea" then
                            local finishPart

                            repeat
                                wait()

                                if game:GetService("Workspace")._WorldOrigin.Locations["Trial of the King"] and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game:GetService("Workspace")._WorldOrigin.Locations["Trial of the King"].CFrame.Position).Magnitude <= 1000 then
                                    finishPart = game:GetService("Workspace").Map.SkyTrial.Model.FinishPart
                                    toTarget(localPlayer.Character.HumanoidRootPart.Position, finishPart.Position, finishPart.CFrame)
                                    task.wait(3)
                                end
                            until not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible or workspace.Map:FindFirstChild("Temple of Time") and workspace.Map["Temple of Time"].FFABorder.Forcefield.Transparency == 0 or localPlayer:DistanceFromCharacter(game:GetService("Workspace").Map.SkyTrial.Model.FinishPart.Position) > 1000
                        elseif value == "Fishman" then
                            local trialOfWater = nil

                            if game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Trial of Water") then
                                trialOfWater = game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Trial of Water")
                            end

                            if trialOfWater and (trialOfWater.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude < 1500 then
                                local v9 = GetSeaBeastTrial()
                                local humanoidRootPart

                                repeat
                                    task.wait()

                                    if v9 then
                                        humanoidRootPart = v9:FindFirstChild("HumanoidRootPart")
                                        getgenv().AimPos = CFrame.new(humanoidRootPart.Position.X, 40, humanoidRootPart.Position.Z)
                                        TeleportSeabeast2(v9)

                                        if localPlayer:DistanceFromCharacter(humanoidRootPart.Position) < 400 then
                                            AutoAllSkill()
                                        end
                                    end
                                until not v9 or not v9.Parent or v9.Health.Value == 0 or not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible or workspace.Map:FindFirstChild("Temple of Time") and workspace.Map["Temple of Time"].FFABorder.Forcefield.Transparency == 0 or localPlayer:DistanceFromCharacter(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Trial of Water").Position) > 1000
                            end
                        elseif value == "Mink" then
                            repeat
                                wait()

                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game:GetService("Workspace")._WorldOrigin.Locations["Trial of Speed"].Position).Magnitude <= 1000 then
                                    toTarget(localPlayer.Character.HumanoidRootPart.Position, game:GetService("Workspace").StartPoint.Position, game:GetService("Workspace").StartPoint.CFrame * CFrame.new(0, 2, 0))
                                end
                            until not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible or localPlayer:DistanceFromCharacter(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Trial of Speed").Position) > 1000
                        elseif value == "Ghoul" then
                            if localPlayer:DistanceFromCharacter(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Trial of Carnage").Position) < 1000 then
                                local v9

                                repeat
                                    wait()
                                    v9 = TrialGhoul()

                                    if v9 then
                                        repeat
                                            wait()
                                            sizepart(v9)
                                            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, v9.HumanoidRootPart.Position, v9.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
                                            ClickM1(v9)
                                            UsedualFlock()
                                        until not IsMobAlive(v9) or not settings["Auto Trial"] or not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible or localPlayer:DistanceFromCharacter(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Trial of Carnage").Position) > 1000
                                    end
                                until not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible or localPlayer:DistanceFromCharacter(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Trial of Carnage").Position) > 1000
                            end
                        elseif value == "Cyborg" then
                            local cframe

                            repeat
                                wait()
                                cframe = CFrame.new(-20021.8691, 10090.4893, -16.37994, -0.976144373, 6.71342875e-08, -0.217122361, 8.46145412e-08, 1, -7.1212007e-08, 0.217122361, -8.78849065e-08, -0.976144373)
                                CyborgBypassCFrame = cframe

                                if (CyborgBypassCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
                                    toTarget(localPlayer.Character.HumanoidRootPart.Position, CyborgBypassCFrame.Position, CyborgBypassCFrame)
                                    task.wait(3)
                                end
                            until not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible or localPlayer:DistanceFromCharacter(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Trial of the Machine").Position) > 1000
                        end
                    else
                        local union = game:GetService("Workspace").Map["Temple of Time"][game.Players.LocalPlayer.Data.Race.Value .. "Corridor"].Door.Door.RightDoor.Union

                        if localPlayer:DistanceFromCharacter(union.Position) <= 8 then
                            getgenv().SendMessage("AccHelp")

                            if #AcountHelp >= 2 and CheckMultiTeleDoor() then
                                if settings["Account Main Up Gear"] then
                                    local contextButton = MobileUIController:GetContextButton("BoundActionRaceAbility")

                                    if contextButton:FindFirstChild("HotkeyIcon") then
                                        if not contextButton.Cooldown or not contextButton.Cooldown:GetAttribute("Percentage") or contextButton.Cooldown:GetAttribute("Percentage") < 0 then
                                            game:service("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
                                            task.wait()
                                            game:service("VirtualInputManager"):SendKeyEvent(false, "T", false, game)
                                            getgenv().SendMessageActiveRace("ActiveRace")
                                        end
                                    elseif not contextButton.Button.Cooldown or not contextButton.Button.Cooldown:GetAttribute("Percentage") or contextButton.Button.Cooldown:GetAttribute("Percentage") < 0 then
                                        game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
                                        getgenv().SendMessageActiveRace("ActiveRace")
                                    end
                                elseif CheckMultiPlayerNearDoor() and #AcountHelp >= 2 and CheckMultiTeleDoor() and getfm() == " | Full Moon" then
                                    if MobileUIController:GetContextButton("BoundActionRaceAbility"):FindFirstChild("HotkeyIcon") then
                                        game:service("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
                                        task.wait()
                                        game:service("VirtualInputManager"):SendKeyEvent(false, "T", false, game)
                                    else
                                        game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
                                    end

                                    getgenv().TurnonRacev3 = false
                                end
                            end

                            return
                        end

                        getgenv().SendMessage("Remove")
                        toTarget(localPlayer.Character.HumanoidRootPart.Position, union.Position, union.CFrame)
                    end
                end
            end
        end)

        if result then
            print(result)
        end
    end
end)

FFCMatch = function(arg, arg2)
    for k, child in pairs(arg:GetChildren()) do
        if string.match(child.Name, arg2) then
            return child
        end
    end

    return nil
end

local function fn5(arg)
    local v8 = arg
    if type(arg) ~= "table" then
        return arg
    end
    local tbl18 = {}
    local tbl19 = {}
    local tbl20 = {}
    local n3 = 1
    local str3 = "{\n"

    while true do
        local n4 = 0

        for k in pairs(v8) do
            n4 = n4 + 1
        end

        local n5 = 1

        for k, v9 in pairs(v8) do
            if tbl18[v8] ~= nil and tbl18[v8] > n5 then
                if n5 == n4 then
                    str3 = str3 .. "\n" .. string.rep("\t", n3 - 1) .. "}"
                end
            else
                if string.find(str3, "}", str3:len()) then
                    str3 = str3 .. ",\n"
                elseif not string.find(str3, "\n", str3:len()) then
                    str3 = str3 .. "\n"
                end

                table.insert(tbl20, str3)
                local str4

                if type(k) ~= "number" and type(k) ~= "boolean" then
                    str4 = "[\"" .. tostring(k) .. "\"]"
                else
                    str4 = "[" .. tostring(k) .. "]"
                end

                local str5

                if type(v9) ~= "number" and type(v9) ~= "boolean" then
                    if type(v9) == "table" then
                        str3 = "" .. string.rep("\t", n3) .. str4 .. " = {\n"
                        table.insert(tbl19, v8)
                        table.insert(tbl19, v9)
                        tbl18[v8] = n5 + 1
                        break
                    end

                    str5 = "" .. string.rep("\t", n3) .. str4 .. " = \"" .. tostring(v9) .. "\""
                else
                    str5 = "" .. string.rep("\t", n3) .. str4 .. " = " .. tostring(v9)
                end

                if n5 == n4 then
                    str3 = str5 .. "\n" .. string.rep("\t", n3 - 1) .. "}"
                else
                    str3 = str5 .. ","
                end
            end

            n5 = n5 + 1
        end

        if n4 == 0 then
            str3 = str3 .. "\n" .. string.rep("\t", n3 - 1) .. "}"
        end

        if #tbl19 <= 0 then
            break
        end
        local v9 = tbl19[#tbl19]
        v8 = v9
        tbl19[#tbl19] = nil
        local n6 = tbl18[v9] == nil and n3 + 1 or n3 - 1
        n3 = n6
    end

    table.insert(tbl20, str3)
    return "getgenv().Config = " .. table.concat(tbl20)
end

tbl.TabSetupV4:AddButton({
    Title = "Copy Config",
    Description = "",
    Callback = function()
        local data = HttpService:JSONDecode(readfile("Banana Cat Hub/" .. str))
        setclipboard(fn5(data))

        lib:Notify({
            Title = "Banana Cat Hub",
            Content = "Successfully Copy Config",
            SubContent = "...",
            Duration = 5,
        })
    end,
})

local v8 = tbl.StatusSvMain:AddParagraph({Title = Translate("Moon"), Content = ""})

tbl.StatusSvMain:AddInput("Input JobId", {
    Title = "Input JobId Normal\nAnd JobId BananaCat",
    Default = "",
    Numeric = false,
    Finished = false,
    Callback = function(arg) end,
})

tbl.StatusSvMain:AddButton({
    Title = "Clear JobId",
    Description = "",
    Callback = function()
        Options["Input JobId"]:SetValue("")
    end,
})

local statusSvMain = tbl.StatusSvMain
local addToggle5 = statusSvMain.AddToggle
local tbl18 = {Title = "Spam Join"}
local spamJoin = settings["Spam Join"]
local default5 = spamJoin or false
tbl18.Default = default5

tbl18.Callback = function(arg)
    SaveSettings("Spam Join", arg)
end

addToggle5(statusSvMain, "Spam Join", tbl18)
local v9 = bit32
local v13 = v9 or bit

if not v13 then
    local tbl19 = {}
    v13 = tbl19

    tbl19.bxor = function(arg, arg2)
        local n3 = arg
        local n4 = arg2
        local n5 = 0
        local n6 = 1

        while n3 > 0 or n4 > 0 do
            local n7 = n3 % 2
            local n8 = n4 % 2

            if n7 ~= n8 then
                n5 = n5 + n6
            end

            n3 = (n3 - n7) / 2
            n4 = (n4 - n8) / 2
            n6 = n6 * 2
        end

        return n5
    end
end

local function fn6(arg, arg2)
    local v14 = nil
    local v15 = nil

    if not pcall(function()
        v14 = arg
        v15 = arg2
    end) or v14 == nil or v15 == nil then
        return false
    end

    if type(v14) ~= type(v15) then
        return false
    end
    local tbl19 = {v15, v14, v15, v14}
    if tbl19[1] ~= tbl19[1] then
        return false
    end

    if tbl19[1] ~= tbl19[2] then
        return false
    end

    if tbl19[2] ~= tbl19[1] then
        return false
    end

    if type(v14) == "number" and type(v15) == "number" then
        local flag2 = v14 == v15
        return flag2
    end

    if type(v14) == "string" and type(v15) == "string" then
        local flag2 = v14 == v15
        return flag2
    end
    local flag2 = v14 == v15
    return flag2
end

local function fn7()
    local time = os.time
    local now = time and os.time() or 12345

    if tostring(print):find("function") == nil then
        while true do
        end
    end

    if tostring(type):find("function") == nil then
        while true do
        end
    end

    if (now * now + now) % 2 ~= 0 then
        while true do
        end
    end

    if not fn6(now, now) then
        while true do
        end
    end
end

local v14, v15 = (function()
    fn7()
    local n3 = 17
    local tbl19 = {}
    local tbl20 = {}
    local tbl21 = {}
    local tbl22 = {[17] = 23, [23] = 41, [41] = 999}

    while true do
        if n3 == 17 then
            for i_ = 0, 255 do
                local str3 = string.format("%c", i_)
                tbl19[i_] = str3
                tbl20[str3] = i_
            end

            n3 = tbl22[17]
            continue
        end

        if n3 ~= 23 then
            break
        end

        for i_ = 0, 255 do
            tbl21[i_] = tbl19[i_]
        end

        n3 = tbl22[23]
    end

    if n3 ~= 41 then
        while true do
        end
    end

    if not fn6(n3, 41) then
        while true do
        end
    end

    return tbl21, tbl20
end)()

local v16 = (function()
    local tbl19 = {
        90,
        60,
        126,
        145,
        66,
        184,
        109,
        47,
    }

    local tbl20 = {
        {37, 227, 88, 25, 81, 142},
        {
            225,
            25,
            23,
            39,
            39,
            54,
            59,
        },
        {80, 105, 211, 103, 227, 12},
        {28, 174, 170, 230},
        {
            251,
            162,
            95,
            225,
            4,
            193,
            155,
            106,
        },
        {
            187,
            44,
            112,
            104,
            12,
            122,
            10,
            104,
        },
        {
            68,
            36,
            55,
            125,
            210,
            73,
            24,
        },
        {
            5,
            98,
            251,
            178,
            190,
            93,
            195,
            229,
            24,
        },
    }

    local function fn8(arg, arg2)
        local str3 = ""
        local n3 = arg2 or 123

        for i_ = 1, #arg do
            local v16 = tbl19[(i_ - 1) % #tbl19 + 1]
            local n4 = (v13.bxor(arg[i_], v16) - n3 + 256) % 256
            n3 = (n3 + i_ + v16) % 256
            str3 = str3 .. v14[v13.bxor(n4, i_ * 17 % 256)]
        end

        return str3
    end

    local tbl21 = {}

    for i_ = 1, #tbl20 do
        tbl21[i_] = fn8(tbl20[i_], i_ * 61 % 256)
    end

    return tbl21
end)()

local function fn8(arg, arg2)
    fn7()
    local n3 = 0
    local n4 = 5
    local tbl19 = {[5] = 7, [7] = 11, [11] = 999}

    while true do
        if n4 == 5 then
            for match in arg:gmatch(".") do
                local n5 = n3 + 1
                n3 = n5
                if n5 == arg2 then
                    n4 = tbl19[5]
                    break
                end
            end

            if n4 ~= 7 then
                n4 = tbl19[11]
            end

            continue
        end

        if n4 == 7 then
            local str3 = ""
            local n5 = 0

            for match in arg:gmatch(".") do
                local n6 = n5 + 1
                n5 = n6
                if n6 == arg2 then
                    str3 = match
                    break
                end
            end

            local v17 = v15[str3]
            local n6 = v17 or 0
            local v18 = v15[str3]
            local n7 = v18 or 0
            if not fn6(n6, n7) then
                continue
            end
            local v19 = v15[str3]
            local n8 = v19 or 0
            return n8
        end

        if n4 == 11 then
            break
        end
    end

    return 0
end

local function fn9(arg)
    if not fn6(arg, arg) then
        while true do
        end
    end

    return v14[arg % 256]
end

local function fn10(arg)
    local str3 = ""
    local n3 = 3
    local tbl19 = {[3] = 8, [8] = 999}

    while true do
        if n3 == 3 then
            for i_ = 1, #arg do
                str3 = str3 .. arg[i_]
            end

            n3 = tbl19[3]
            continue
        end

        if n3 == 8 and fn6(str3, str3) then
            break
        end
    end

    return str3
end

local function fn11(arg)
    fn7()
    local n3 = 0

    for match in arg:gmatch(".") do
        n3 = n3 + 1
    end

    if not fn6(n3, n3) then
        return 0
    end
    return n3
end

local function fn12(arg, arg2, arg3)
    fn7()
    local v17 = fn11(arg2)
    local flag2 = true

    for i_ = 1, v17 do
        if fn8(arg, i_) ~= fn8(arg2, i_) then
            flag2 = false
            break
        end
        continue
    end

    if not flag2 or not fn6(flag2, true) then
        return arg
    end
    local str3 = arg3

    for i_ = v17 + 1, fn11(arg) do
        local str4 = ""
        local n3 = 0

        for match in arg:gmatch(".") do
            local n4 = n3 + 1
            n3 = n4
            if n4 == i_ then
                str4 = match
                break
            end
        end

        str3 = str3 .. str4
    end

    return str3
end

local function fn13(...)
    local tbl19 = {...}
    local str3 = ""

    for i_ = 1, #tbl19 do
        str3 = str3 .. tbl19[i_]
    end

    if not fn6(str3, str3) then
        return ""
    end
    return str3
end

local function fn14(arg, arg2)
    fn7()
    local tbl19 = {}
    local v17 = fn11(arg)
    local n3 = 0

    for i_ = 1, arg2 do
        local v18 = fn8(arg, (i_ - 1) % v17 + 1)
        local n4 = (n3 + v18 + i_) % 256
        n3 = n4
        tbl19[i_] = (v18 + n4 + i_ * 7) % 256
    end

    if not fn6(#tbl19, arg2) then
        return {}
    end
    return tbl19
end

local function fn15(arg, arg2)
    fn7()
    local v17 = fn11(arg2)
    local v18 = fn14(arg, fn11(arg2))
    local tbl19 = {}
    local n3 = 0

    for i_ = 1, v17 do
        local v19 = fn8(arg2, i_)
        local n4 = (n3 + v18[i_]) % 256
        n3 = n4
        local n5 = (v13.bxor(v19, v18[i_]) % 256 + n4) % 256
        tbl19[i_] = fn9(v13.bxor(n5, i_ * 13 % 256) % 256)
    end

    return fn10(tbl19)
end

local function fn16(arg, arg2, arg3)
    local n3, v17, v18, n4, n5, n6, v19, n7
    n7 = 1

    while true do
        if n7 == 1 then
            fn7()
            n3 = arg3

            if arg3 then
                n7 = 3
            else
                n7 = 2
            end
        elseif n7 == 2 then
            n3 = 3
            n7 = 3
        elseif n7 == 3 then
            v17 = n3
            v18 = arg2
            n4 = v17 + 0
            n5 = 0
            n7 = 4
        elseif n7 == 4 then
            n6 = n5 + 1

            if n6 <= n4 then
                n7 = 6
            else
                n7 = 5
            end
        elseif n7 == 5 then
            return v18
        elseif n7 == 6 then
            n5 = n6
            v19 = fn15(fn13(arg, fn9(48 + n6)), v18)
            v18 = v19

            if fn6(v19, v19) then
                n7 = 4
            else
                n7 = 7
            end
        elseif n7 == 7 then
            n7 = 7
        end
    end
end

local function fn17(arg, arg2, arg3)
    local n3, v17, v18, n4, n5, v19, v20, v21, tbl19, n6, n7, n8, n9, v22, n10, v23, n11, n12
    n12 = 1

    while true do
        if n12 == 1 then
            fn7()
            n3 = arg3

            if arg3 then
                n12 = 3
            else
                n12 = 2
            end
        elseif n12 == 2 then
            n3 = 3
            n12 = 3
        elseif n12 == 3 then
            v17 = n3
            v18 = arg2
            n4 = v17 - -1
            n12 = 4
        elseif n12 == 4 then
            n5 = n4 + -1

            if n5 >= 1 then
                n12 = 6
            else
                n12 = 5
            end
        elseif n12 == 5 then
            return v18
        elseif n12 == 6 then
            v19 = fn13(arg, fn9(48 + n5))
            v20 = fn11(v18)
            v21 = fn14(v19, v20)
            tbl19 = {}
            n6 = 0
            n7 = v20 + 0
            n8 = 0
            n12 = 7
        elseif n12 == 7 then
            n9 = n8 + 1

            if n9 <= n7 then
                n12 = 10
            else
                n12 = 8
            end
        elseif n12 == 8 then
            n4 = n5
            v22 = fn10(tbl19)
            v18 = v22

            if fn6(v22, v22) then
                n12 = 4
            else
                n12 = 9
            end
        elseif n12 == 9 then
            n12 = 9
        elseif n12 == 10 then
            n8 = n9
            n10 = (n6 + v21[n9]) % 256
            n6 = n10
            v23 = fn8(v18, n9)
            n11 = (v13.bxor(v23, n9 * 13 % 256) % 256 - n10 + 256) % 256
            tbl19[n9] = fn9(v13.bxor(n11, v21[n9]) % 256)
            n12 = 7
        end
    end
end

local v17 = (function()
    local v17 = string.char(65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 43, 47)

    return {
        encode = function(arg)
            local tbl19, v18, n3, tbl20, v19, v20, v21, v22, flag2, flag3, n4, n5, n6, n7, n8, n9, v23, n10, n11, n12
            local n13, n14, n15, v24, flag4, n16, n17, n18, n19, n20, n21, v25, n22, n23, n24, n25, n26, n27, v26, n28
            local flag5, n29, n30, flag6, n31, n32, tbl21, v27, v28, v29, v30, flag7, flag8, n33, n34, flag9, n35, n36, flag10, n37
            local n38, n39, flag11, n40, n41, flag12, n42, n43, n44, n45, flag13, n46, n47, flag14, n48, n49, flag15, n50, n51, n52
            local n53, n54, n55, n56, n57, n58, n59
            n59 = 1

            while true do
                if n59 == 1 then
                    fn7()
                    tbl19 = {}
                    v18 = fn11(arg)
                    n3 = 1
                    n59 = 2
                elseif n59 == 2 then
                    if n3 <= v18 then
                        n59 = 4
                    else
                        n59 = 3
                    end
                elseif n59 == 3 then
                    tbl20 = {}
                    n59 = 127
                elseif n59 == 4 then
                    v19 = fn8
                    v20 = arg
                    n59 = 5
                elseif n59 == 5 then
                    v21 = n3
                    n59 = 6
                elseif n59 == 6 then
                    v22 = v19(v20, v21)

                    if n3 + 1 <= v18 then
                        n59 = 8
                    else
                        n59 = 7
                    end
                elseif n59 == 7 then
                    flag2 = false
                    n59 = 9
                elseif n59 == 8 then
                    flag2 = true
                    n59 = 9
                elseif n59 == 9 then
                    if flag2 then
                        n59 = 10
                    else
                        n59 = 11
                    end
                elseif n59 == 10 then
                    flag2 = fn8(arg, n3 + 1)
                    n59 = 11
                elseif n59 == 11 then
                    if flag2 then
                        n59 = 12
                    else
                        n59 = 20
                    end
                elseif n59 == 12 then
                    if n3 + 2 <= v18 then
                        n59 = 14
                    else
                        n59 = 13
                    end
                elseif n59 == 13 then
                    flag3 = false
                    n59 = 15
                elseif n59 == 14 then
                    flag3 = true
                    n59 = 15
                elseif n59 == 15 then
                    if flag3 then
                        n59 = 16
                    else
                        n59 = 17
                    end
                elseif n59 == 16 then
                    flag3 = fn8(arg, n3 + 2)
                    n59 = 17
                elseif n59 == 17 then
                    if flag3 then
                        n59 = 18
                    else
                        n59 = 19
                    end
                elseif n59 == 18 then
                    n4 = v22 * 65536 + flag2 * 256 + flag3
                    n5 = n4 // 262144 % 64 + 1
                    n6 = n4 // 4096 % 64 + 1
                    n7 = n4 // 64 % 64 + 1
                    n8 = n4 % 64 + 1
                    n9 = #tbl19 + 1
                    v23 = fn8
                    n59 = 62
                elseif n59 == 19 then
                    n10 = v22 * 65536 + flag2 * 256 + 0
                    n11 = n10 // 262144 % 64 + 1
                    n12 = n10 // 4096 % 64 + 1
                    n13 = n10 // 64 % 64 + 1
                    n14 = n10 % 64 + 1
                    n15 = #tbl19 + 1
                    v24 = fn8
                    n59 = 81
                elseif n59 == 20 then
                    if n3 + 2 <= v18 then
                        n59 = 22
                    else
                        n59 = 21
                    end
                elseif n59 == 21 then
                    flag4 = false
                    n59 = 23
                elseif n59 == 22 then
                    flag4 = true
                    n59 = 23
                elseif n59 == 23 then
                    if flag4 then
                        n59 = 24
                    else
                        n59 = 25
                    end
                elseif n59 == 24 then
                    flag4 = fn8(arg, n3 + 2)
                    n59 = 25
                elseif n59 == 25 then
                    if flag4 then
                        n59 = 26
                    else
                        n59 = 27
                    end
                elseif n59 == 26 then
                    n16 = v22 * 65536 + 0 + flag4
                    n17 = n16 // 262144 % 64 + 1
                    n18 = n16 // 4096 % 64 + 1
                    n19 = n16 // 64 % 64 + 1
                    n20 = n16 % 64 + 1
                    n21 = #tbl19 + 1
                    v25 = fn8
                    n59 = 111
                elseif n59 == 27 then
                    n22 = v22 * 65536 + 0 + 0
                    n23 = n22 // 262144 % 64 + 1
                    n24 = n22 // 4096 % 64 + 1
                    n25 = n22 // 64 % 64 + 1
                    n26 = n22 % 64 + 1
                    n27 = #tbl19 + 1
                    v26 = fn8
                    n59 = 28
                elseif n59 == 28 then
                    tbl19[n27] = v26(v17, n23)
                    tbl19[#tbl19 + 1] = fn8(v17, n24)
                    n28 = #tbl19 + 1

                    if n3 + 1 <= v18 then
                        n59 = 30
                    else
                        n59 = 29
                    end
                elseif n59 == 29 then
                    flag5 = false
                    n59 = 31
                elseif n59 == 30 then
                    flag5 = true
                    n59 = 31
                elseif n59 == 31 then
                    if flag5 then
                        n59 = 32
                    else
                        n59 = 33
                    end
                elseif n59 == 32 then
                    flag5 = fn8(v17, n25)
                    n59 = 33
                elseif n59 == 33 then
                    if flag5 then
                        n59 = 34
                    else
                        n59 = 35
                    end
                elseif n59 == 34 then
                    tbl19[n28] = flag5
                    n29 = #tbl19 + 1
                    n30 = n3 + 2
                    n59 = 36
                elseif n59 == 35 then
                    tbl19[n28] = 61
                    n29 = #tbl19 + 1
                    n30 = n3 + 2
                    n59 = 36
                elseif n59 == 36 then
                    if n30 <= v18 then
                        n59 = 38
                    else
                        n59 = 37
                    end
                elseif n59 == 37 then
                    flag6 = false
                    n59 = 39
                elseif n59 == 38 then
                    flag6 = true
                    n59 = 39
                elseif n59 == 39 then
                    if flag6 then
                        n59 = 40
                    else
                        n59 = 41
                    end
                elseif n59 == 40 then
                    flag6 = fn8(v17, n26)
                    n59 = 41
                elseif n59 == 41 then
                    if flag6 then
                        n59 = 42
                    else
                        n59 = 45
                    end
                elseif n59 == 42 then
                    tbl19[n29] = flag6
                    n31 = n3 + 3
                    n3 = n31

                    if n31 <= v18 then
                        n59 = 44
                    else
                        n59 = 43
                    end
                elseif n59 == 43 then
                    tbl20 = {}
                    n59 = 97
                elseif n59 == 44 then
                    v19 = fn8
                    v20 = arg
                    n59 = 99
                elseif n59 == 45 then
                    tbl19[n29] = 61
                    n32 = n3 + 3
                    n3 = n32

                    if n32 <= v18 then
                        n59 = 47
                    else
                        n59 = 46
                    end
                elseif n59 == 46 then
                    tbl21 = {}
                    n59 = 102
                elseif n59 == 47 then
                    v27 = fn8
                    v28 = arg
                    n59 = 48
                elseif n59 == 48 then
                    v29 = n3
                    n59 = 49
                elseif n59 == 49 then
                    v30 = v27(v28, v29)

                    if n3 + 1 <= v18 then
                        n59 = 51
                    else
                        n59 = 50
                    end
                elseif n59 == 50 then
                    flag7 = false
                    n59 = 52
                elseif n59 == 51 then
                    flag7 = true
                    n59 = 52
                elseif n59 == 52 then
                    if flag7 then
                        n59 = 53
                    else
                        n59 = 54
                    end
                elseif n59 == 53 then
                    flag7 = fn8(arg, n3 + 1)
                    n59 = 54
                elseif n59 == 54 then
                    if flag7 then
                        n59 = 55
                    else
                        n59 = 104
                    end
                elseif n59 == 55 then
                    if n3 + 2 <= v18 then
                        n59 = 57
                    else
                        n59 = 56
                    end
                elseif n59 == 56 then
                    flag8 = false
                    n59 = 58
                elseif n59 == 57 then
                    flag8 = true
                    n59 = 58
                elseif n59 == 58 then
                    if flag8 then
                        n59 = 59
                    else
                        n59 = 60
                    end
                elseif n59 == 59 then
                    flag8 = fn8(arg, n3 + 2)
                    n59 = 60
                elseif n59 == 60 then
                    if flag8 then
                        n59 = 61
                    else
                        n59 = 80
                    end
                elseif n59 == 61 then
                    n33 = v30 * 65536 + flag7 * 256 + flag8
                    n5 = n33 // 262144 % 64 + 1
                    n6 = n33 // 4096 % 64 + 1
                    n7 = n33 // 64 % 64 + 1
                    n8 = n33 % 64 + 1
                    n9 = #tbl19 + 1
                    v23 = fn8
                    n59 = 62
                elseif n59 == 62 then
                    tbl19[n9] = v23(v17, n5)
                    tbl19[#tbl19 + 1] = fn8(v17, n6)
                    n34 = #tbl19 + 1

                    if n3 + 1 <= v18 then
                        n59 = 64
                    else
                        n59 = 63
                    end
                elseif n59 == 63 then
                    flag9 = false
                    n59 = 65
                elseif n59 == 64 then
                    flag9 = true
                    n59 = 65
                elseif n59 == 65 then
                    if flag9 then
                        n59 = 66
                    else
                        n59 = 67
                    end
                elseif n59 == 66 then
                    flag9 = fn8(v17, n7)
                    n59 = 67
                elseif n59 == 67 then
                    if flag9 then
                        n59 = 68
                    else
                        n59 = 69
                    end
                elseif n59 == 68 then
                    tbl19[n34] = flag9
                    n35 = #tbl19 + 1
                    n36 = n3 + 2
                    n59 = 70
                elseif n59 == 69 then
                    tbl19[n34] = 61
                    n35 = #tbl19 + 1
                    n36 = n3 + 2
                    n59 = 70
                elseif n59 == 70 then
                    if n36 <= v18 then
                        n59 = 72
                    else
                        n59 = 71
                    end
                elseif n59 == 71 then
                    flag10 = false
                    n59 = 73
                elseif n59 == 72 then
                    flag10 = true
                    n59 = 73
                elseif n59 == 73 then
                    if flag10 then
                        n59 = 74
                    else
                        n59 = 75
                    end
                elseif n59 == 74 then
                    flag10 = fn8(v17, n8)
                    n59 = 75
                elseif n59 == 75 then
                    if flag10 then
                        n59 = 76
                    else
                        n59 = 77
                    end
                elseif n59 == 76 then
                    tbl19[n35] = flag10
                    n3 = n3 + 3
                    n59 = 2
                elseif n59 == 77 then
                    tbl19[n35] = 61
                    n37 = n3 + 3
                    n3 = n37

                    if n37 <= v18 then
                        n59 = 79
                    else
                        n59 = 78
                    end
                elseif n59 == 78 then
                    tbl21 = {}
                    n59 = 137
                elseif n59 == 79 then
                    v27 = fn8
                    v28 = arg
                    n59 = 145
                elseif n59 == 80 then
                    n38 = v30 * 65536 + flag7 * 256 + 0
                    n11 = n38 // 262144 % 64 + 1
                    n12 = n38 // 4096 % 64 + 1
                    n13 = n38 // 64 % 64 + 1
                    n14 = n38 % 64 + 1
                    n15 = #tbl19 + 1
                    v24 = fn8
                    n59 = 81
                elseif n59 == 81 then
                    tbl19[n15] = v24(v17, n11)
                    tbl19[#tbl19 + 1] = fn8(v17, n12)
                    n39 = #tbl19 + 1

                    if n3 + 1 <= v18 then
                        n59 = 83
                    else
                        n59 = 82
                    end
                elseif n59 == 82 then
                    flag11 = false
                    n59 = 84
                elseif n59 == 83 then
                    flag11 = true
                    n59 = 84
                elseif n59 == 84 then
                    if flag11 then
                        n59 = 85
                    else
                        n59 = 86
                    end
                elseif n59 == 85 then
                    flag11 = fn8(v17, n13)
                    n59 = 86
                elseif n59 == 86 then
                    if flag11 then
                        n59 = 87
                    else
                        n59 = 88
                    end
                elseif n59 == 87 then
                    tbl19[n39] = flag11
                    n40 = #tbl19 + 1
                    n41 = n3 + 2
                    n59 = 89
                elseif n59 == 88 then
                    tbl19[n39] = 61
                    n40 = #tbl19 + 1
                    n41 = n3 + 2
                    n59 = 89
                elseif n59 == 89 then
                    if n41 <= v18 then
                        n59 = 91
                    else
                        n59 = 90
                    end
                elseif n59 == 90 then
                    flag12 = false
                    n59 = 92
                elseif n59 == 91 then
                    flag12 = true
                    n59 = 92
                elseif n59 == 92 then
                    if flag12 then
                        n59 = 93
                    else
                        n59 = 94
                    end
                elseif n59 == 93 then
                    flag12 = fn8(v17, n14)
                    n59 = 94
                elseif n59 == 94 then
                    if flag12 then
                        n59 = 95
                    else
                        n59 = 100
                    end
                elseif n59 == 95 then
                    tbl19[n40] = flag12
                    n42 = n3 + 3
                    n3 = n42

                    if n42 <= v18 then
                        n59 = 98
                    else
                        n59 = 96
                    end
                elseif n59 == 96 then
                    tbl20 = {}
                    n59 = 97
                elseif n59 == 97 then
                    n43 = #tbl19
                    n59 = 128
                elseif n59 == 98 then
                    v19 = fn8
                    v20 = arg
                    n59 = 99
                elseif n59 == 99 then
                    v21 = n3
                    n59 = 6
                elseif n59 == 100 then
                    tbl19[n40] = 61
                    n44 = n3 + 3
                    n3 = n44

                    if n44 <= v18 then
                        n59 = 103
                    else
                        n59 = 101
                    end
                elseif n59 == 101 then
                    tbl21 = {}
                    n59 = 102
                elseif n59 == 102 then
                    n45 = #tbl19
                    n59 = 138
                elseif n59 == 103 then
                    v27 = fn8
                    v28 = arg
                    n59 = 48
                elseif n59 == 104 then
                    if n3 + 2 <= v18 then
                        n59 = 106
                    else
                        n59 = 105
                    end
                elseif n59 == 105 then
                    flag13 = false
                    n59 = 107
                elseif n59 == 106 then
                    flag13 = true
                    n59 = 107
                elseif n59 == 107 then
                    if flag13 then
                        n59 = 108
                    else
                        n59 = 109
                    end
                elseif n59 == 108 then
                    flag13 = fn8(arg, n3 + 2)
                    n59 = 109
                elseif n59 == 109 then
                    if flag13 then
                        n59 = 110
                    else
                        n59 = 146
                    end
                elseif n59 == 110 then
                    n46 = v30 * 65536 + 0 + flag13
                    n17 = n46 // 262144 % 64 + 1
                    n18 = n46 // 4096 % 64 + 1
                    n19 = n46 // 64 % 64 + 1
                    n20 = n46 % 64 + 1
                    n21 = #tbl19 + 1
                    v25 = fn8
                    n59 = 111
                elseif n59 == 111 then
                    tbl19[n21] = v25(v17, n17)
                    tbl19[#tbl19 + 1] = fn8(v17, n18)
                    n47 = #tbl19 + 1

                    if n3 + 1 <= v18 then
                        n59 = 113
                    else
                        n59 = 112
                    end
                elseif n59 == 112 then
                    flag14 = false
                    n59 = 114
                elseif n59 == 113 then
                    flag14 = true
                    n59 = 114
                elseif n59 == 114 then
                    if flag14 then
                        n59 = 115
                    else
                        n59 = 116
                    end
                elseif n59 == 115 then
                    flag14 = fn8(v17, n19)
                    n59 = 116
                elseif n59 == 116 then
                    if flag14 then
                        n59 = 117
                    else
                        n59 = 118
                    end
                elseif n59 == 117 then
                    tbl19[n47] = flag14
                    n48 = #tbl19 + 1
                    n49 = n3 + 2
                    n59 = 119
                elseif n59 == 118 then
                    tbl19[n47] = 61
                    n48 = #tbl19 + 1
                    n49 = n3 + 2
                    n59 = 119
                elseif n59 == 119 then
                    if n49 <= v18 then
                        n59 = 121
                    else
                        n59 = 120
                    end
                elseif n59 == 120 then
                    flag15 = false
                    n59 = 122
                elseif n59 == 121 then
                    flag15 = true
                    n59 = 122
                elseif n59 == 122 then
                    if flag15 then
                        n59 = 123
                    else
                        n59 = 124
                    end
                elseif n59 == 123 then
                    flag15 = fn8(v17, n20)
                    n59 = 124
                elseif n59 == 124 then
                    if flag15 then
                        n59 = 125
                    else
                        n59 = 135
                    end
                elseif n59 == 125 then
                    tbl19[n48] = flag15
                    n50 = n3 + 3
                    n3 = n50

                    if n50 <= v18 then
                        n59 = 134
                    else
                        n59 = 126
                    end
                elseif n59 == 126 then
                    tbl20 = {}
                    n59 = 127
                elseif n59 == 127 then
                    n43 = #tbl19
                    n59 = 128
                elseif n59 == 128 then
                    n51 = n43 + 0
                    n52 = 0
                    n59 = 129
                elseif n59 == 129 then
                    n53 = n52 + 1

                    if n53 <= n51 then
                        n59 = 133
                    else
                        n59 = 130
                    end
                elseif n59 == 130 then
                    if fn6(fn10(tbl20), fn10(tbl20)) then
                        n59 = 131
                    else
                        n59 = 132
                    end
                elseif n59 == 131 then
                    return fn10(tbl20)
                elseif n59 == 132 then
                    return ""
                elseif n59 == 133 then
                    n52 = n53
                    tbl20[n53] = fn9(tbl19[n53])
                    n59 = 129
                elseif n59 == 134 then
                    v19 = fn8
                    v20 = arg
                    n59 = 5
                elseif n59 == 135 then
                    tbl19[n48] = 61
                    n54 = n3 + 3
                    n3 = n54

                    if n54 <= v18 then
                        n59 = 144
                    else
                        n59 = 136
                    end
                elseif n59 == 136 then
                    tbl21 = {}
                    n59 = 137
                elseif n59 == 137 then
                    n45 = #tbl19
                    n59 = 138
                elseif n59 == 138 then
                    n55 = n45 + 0
                    n56 = 0
                    n59 = 139
                elseif n59 == 139 then
                    n57 = n56 + 1

                    if n57 <= n55 then
                        n59 = 143
                    else
                        n59 = 140
                    end
                elseif n59 == 140 then
                    if fn6(fn10(tbl21), fn10(tbl21)) then
                        n59 = 141
                    else
                        n59 = 142
                    end
                elseif n59 == 141 then
                    return fn10(tbl21)
                elseif n59 == 142 then
                    return ""
                elseif n59 == 143 then
                    n56 = n57
                    tbl21[n57] = fn9(tbl19[n57])
                    n59 = 139
                elseif n59 == 144 then
                    v27 = fn8
                    v28 = arg
                    n59 = 145
                elseif n59 == 145 then
                    v29 = n3
                    n59 = 49
                elseif n59 == 146 then
                    n58 = v30 * 65536 + 0 + 0
                    n23 = n58 // 262144 % 64 + 1
                    n24 = n58 // 4096 % 64 + 1
                    n25 = n58 // 64 % 64 + 1
                    n26 = n58 % 64 + 1
                    n27 = #tbl19 + 1
                    v26 = fn8
                    n59 = 28
                end
            end
        end,
        decode = function(arg)
            fn7()
            local tbl19 = {}
            local v18 = fn11(arg)
            local n3 = 1

            while n3 <= v18 do
                local v19 = fn8(arg, n3)
                local v20 = fn8(arg, n3 + 1)
                local v21 = fn8(arg, n3 + 2)
                local v22 = fn8(arg, n3 + 3)

                local function fn18(arg2)
                    if arg2 == 61 then
                        return 0
                    end

                    for i_ = 1, 64 do
                        if fn8(v17, i_) == arg2 then
                            return i_ - 1
                        end
                    end

                    return 0
                end

                local v23 = fn18(v19)
                local v24 = fn18(v20)
                local v25 = fn18(v21)
                local n4 = v23 * 262144 + v24 * 4096 + v25 * 64 + fn18(v22)
                tbl19[#tbl19 + 1] = fn9(n4 // 65536 % 256)

                if v21 ~= 61 then
                    tbl19[#tbl19 + 1] = fn9(n4 // 256 % 256)
                end

                if v22 ~= 61 then
                    tbl19[#tbl19 + 1] = fn9(n4 % 256)
                end

                n3 = n3 + 4
            end

            if not fn6(fn10(tbl19), fn10(tbl19)) then
                return ""
            end
            return fn10(tbl19)
        end,
    }
end)()

ebgzqifrwa = function(arg)
    fn7()
    local v18 = fn13(v16[5], v16[6], v16[7], v16[8])

    if not fn6(v18, v18) then
        while true do
        end
    end

    local v19 = fn16(v18, arg, 3)
    local v20 = fn13(v16[1], v16[2], v19)
    local v21 = v17.encode(v20)
    if not fn6(v21, v21) then
        return ""
    end
    return fn13(v16[3], v16[4], v21)
end

lebidlyjyf = function(arg)
    fn7()
    local v18 = fn13(v16[5], v16[6], v16[7], v16[8])

    if not fn6(v18, v18) then
        while true do
        end
    end

    local v19 = fn12(arg, fn13(v16[3], v16[4]), "")
    local v20 = fn12(v17.decode(v19), fn13(v16[1], v16[2]), "")
    if not fn6(v20, v20) then
        return ""
    end
    return fn17(v18, v20, 3)
end

tbl.StatusSvMain:AddButton({
    Title = "Join Server",
    Description = "",
    Callback = function()
        if Options["Spam Join"].Value then
            while task.wait() do
                local value = Options["Input JobId"].Value

                if string.find(Options["Input JobId"].Value, "BananaCat") then
                    value = lebidlyjyf(Options["Input JobId"].Value)
                end

                game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", value)
            end
        else
            local value = Options["Input JobId"].Value

            if string.find(Options["Input JobId"].Value, "BananaCat") then
                value = lebidlyjyf(Options["Input JobId"].Value)
            end

            game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", value)
        end
    end,
});

(function()
    return {
        encode = function(arg)
            return (arg:gsub(".", function(arg2)
                local str3 = ""
                local v18 = arg2:byte()

                for i_ = 8, 1, -1 do
                    local str4 = v18 % 2 ^ i_ - v18 % 2 ^ (i_ - 1) > 0 and "1" or "0"
                    str3 = str3 .. str4
                end

                return str3
            end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(arg2)
                if #arg2 < 6 then
                    return ""
                end
                local n3 = 0

                for i_ = 1, 6 do
                    local n4 = arg2:sub(i_, i_) == "1" and 2 ^ (6 - i_) or 0
                    n3 = n3 + n4
                end

                return string.sub("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", n3 + 1, n3 + 1)
            end) .. ({"", "==", "="})[#arg % 3 + 1]
        end,
        decode = function(arg)
            return string.gsub(arg, "[^ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=]", ""):gsub(".", function(arg2)
                if arg2 == "=" then
                    return ""
                end
                local str3 = ""
                local n3 = string.find("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", arg2) - 1

                for i_ = 6, 1, -1 do
                    local str4 = n3 % 2 ^ i_ - n3 % 2 ^ (i_ - 1) > 0 and "1" or "0"
                    str3 = str3 .. str4
                end

                return str3
            end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(arg2)
                if #arg2 ~= 8 then
                    return ""
                end
                local n3 = 0

                for i_ = 1, 8 do
                    local n4 = arg2:sub(i_, i_) == "1" and 2 ^ (8 - i_) or 0
                    n3 = n3 + n4
                end

                return string.char(n3)
            end)
        end,
    }
end)()

local now = nil

tbl.StatusSvMain:AddButton({
    Title = "Hop Server FullMoon",
    Callback = function()
        SpecialHop("FullMoon")
    end,
})

tbl.StatusSvMain:AddButton({
    Title = "Hop Server Less People",
    Description = "",
    Callback = function()
        require(game:GetService("ReplicatedStorage").Notification).new("<Color=Red>Banana Hub : Hop Server<Color=/>"):Display()
        local placeId = game.PlaceId
        local tbl19 = {}
        local str3 = ""
        local hour = os.date("!*t").hour

        if not pcall(function()
            tbl19 = game:GetService("HttpService"):JSONDecode(readfile("Banana Cat Hub/NotSameServers.json"))
        end) then
            table.insert(tbl19, hour)
            writefile("Banana Cat Hub/NotSameServers.json", game:GetService("HttpService"):JSONEncode(tbl19))
        end

        HopServerLess = function()
            local data

            if str3 == "" then
                data = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100"))
            else
                data = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. str3))
            end

            local str4 = ""

            if data.nextPageCursor and data.nextPageCursor ~= "null" and data.nextPageCursor ~= nil then
                str3 = data.nextPageCursor
            end

            local n3 = 0
            local v18, v19, v20 = pairs(data.data)
            local v21 = v20
            local v22 = v18
            local v23 = v19

            while true do
                local v24, v25 = v22(v23, v21)
                if v24 == nil then
                    break
                end
                v21 = v24
                local flag2 = true
                str4 = tostring(v25.id)
                local num = tonumber(v25.maxPlayers)

                if tonumber(v25.playing) < num and tonumber(v25.playing) <= 3 then
                    for k, v26 in pairs(tbl19) do
                        if n3 == 0 then
                            if tonumber(hour) ~= tonumber(v26) then
                                pcall(function()
                                    delfile("Banana Cat Hub/NotSameServers.json")
                                    tbl19 = {}
                                    table.insert(tbl19, hour)
                                end)
                            end
                        elseif str4 == tostring(v26) then
                            flag2 = false
                        end

                        n3 = n3 + 1
                    end

                    v21 = v24

                    if flag2 == true then
                        table.insert(tbl19, str4)
                        wait()

                        pcall(function()
                            writefile("Banana Cat Hub/NotSameServers.json", game:GetService("HttpService"):JSONEncode(tbl19))
                            wait()
                            game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", str4)
                            getgenv().limit_type("clearAll")
                        end)

                        wait(4)
                    end
                end
            end
        end

        while wait() do
            HopServerLess()
        end
    end,
})

tbl.StatusSvMain:AddButton({
    Title = "Copy JobId",
    Description = "",
    Callback = function()
        setclipboard(tostring(game.JobId))
    end,
})

local tabDevilFruit = tbl.TabDevilFruit
local addToggle6 = tabDevilFruit.AddToggle
local tbl19 = {Title = Translate("Random Devil Fruit")}
local randomDevilFruit = settings["Random Devil Fruit"]
local default6 = randomDevilFruit or false
tbl19.Default = default6

tbl19.Callback = function(arg)
    SaveSettings("Random Devil Fruit", arg)
end

addToggle6(tabDevilFruit, "Random Devil Fruit", tbl19)
local tabDevilFruit2 = tbl.TabDevilFruit
local addToggle7 = tabDevilFruit2.AddToggle
local tbl20 = {Title = Translate("Auto Store Fruit")}
local autoStoreFruit = settings["Auto Store Fruit"]
local default7 = autoStoreFruit or false
tbl20.Default = default7

tbl20.Callback = function(arg)
    SaveSettings("Auto Store Fruit", arg)
end

addToggle7(tabDevilFruit2, "Auto Store Fruit", tbl20)
require(game:GetService("ReplicatedStorage").FruitInfo)

StoreFruit = function(arg)
    for k, child in pairs(arg:GetChildren()) do
        if string.find(child.Name, "Fruit") and not child:FindFirstChild("Ignored") then
            local v18 = string.gsub(child.Name, " Fruit", "")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", string.gsub(child.Name, " Fruit", "-" .. v18), arg:FindFirstChild(child.Name))
            Instance.new("IntValue", child).Name = "Ignored"
            wait(2)
        end
    end
end

spawn(function()
    while task.wait() do
        pcall(function()
            v2:SetDesc(CheckAcientOneStatus())
            v8:SetDesc(getfm())

            if not FFCMatch(localPlayer.Character, "_BusoLayer1") and not localPlayer.Character:FindFirstChild("HasBuso") then
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Buso")
                task.wait(2)
            end

            ChooseGearV4()

            if settings["Random Devil Fruit"] then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
            end

            if settings["Auto Store Fruit"] then
                StoreFruit(localPlayer.Backpack)
                StoreFruit(localPlayer.Character)
            end
        end)
    end
end)

spawn(function()
    wait(5)

    if not getgenv().SetSimulationRadiusRun then
        getgenv().SetSimulationRadiusRun = true

        game:GetService("RunService").Stepped:connect(function()
            sethiddenproperty(localPlayer, "SimulationRadius", math.huge)
        end)
    end
end)

tbl.ShopMain:AddButton({
    Title = "Reroll Race",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({"BlackbeardReward", "Reroll", "2"}))
    end,
})

tbl.ShopMain:AddButton({
    Title = "Buy Race Cyborg",
    Description = "",
    Callback = function()
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CyborgTrainer", "Buy")
    end,
})

tbl.ShopMain:AddButton({
    Title = "Buy Race Ghoul",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({"Ectoplasm", "BuyCheck", 4}))
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({"Ectoplasm", "Change", 4}))
    end,
})

spawn(function()
    getgenv().UIToggled = true
    local screenGui = Instance.new("ScreenGui")
    HideGui = screenGui
    HideGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    HideGui.Name = "Banana Cat Hub Btn"
    HideGui.Enabled = true
    HideGui.Parent = game:GetService("CoreGui")
    local frame = Instance.new("Frame", HideGui)
    frame.AnchorPoint = Vector2.new(0, 1)
    frame.Size = UDim2.new(0, 50, 0, 50)
    frame.Position = UDim2.new(0, 15, 0.2, 5)
    frame.Name = "dut dit"
    frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    local uiToggled = getgenv().UIToggled
    local backgroundTransparency = uiToggled and 0 or 0.25
    frame.BackgroundTransparency = backgroundTransparency
    local textButton = Instance.new("TextButton", frame)
    textButton.BackgroundTransparency = 1
    textButton.Text = ""
    textButton.Size = UDim2.new(1, 0, 1, 0)
    local imageLabel = Instance.new("ImageLabel", frame)
    imageLabel.AnchorPoint = Vector2.new(0, 0)
    imageLabel.Image = "rbxassetid://5009915795"
    imageLabel.BackgroundTransparency = 1
    local udim2 = UDim2.new
    local uiToggled2 = getgenv().UIToggled
    local n3 = uiToggled2 and 40 or 30
    local uiToggled3 = getgenv().UIToggled
    local n4 = uiToggled3 and 40 or 30
    imageLabel.Size = udim2(0, n3, 0, n4)
    imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    imageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
    local uiCorner = Instance.new("UICorner")
    uiCorner.Parent = frame
    uiCorner.CornerRadius = UDim.new(1, 0)

    textButton.MouseButton1Click:Connect(function()
        local genv2 = getgenv()
        local uiToggled4

        if getgenv().UIToggled then
            uiToggled4 = false
        else
            uiToggled4 = true
        end

        genv2.UIToggled = uiToggled4
        local uiToggled5 = getgenv().UIToggled
        local n5 = uiToggled5 and 40 or 30
        game:GetService("TweenService"):Create(imageLabel, TweenInfo.new(0.25), {Size = UDim2.new(0, n5, 0, n5)}):Play()
        local TweenService = game:GetService("TweenService")
        local create = TweenService.Create
        local tweenInfo = TweenInfo.new(0.25)
        local tbl21 = {}
        local uiToggled6 = getgenv().UIToggled
        local backgroundTransparency2 = uiToggled6 and 0 or 0.25
        tbl21.BackgroundTransparency = backgroundTransparency2
        create(TweenService, frame, tweenInfo, tbl21):Play()
        game:service("VirtualInputManager"):SendKeyEvent(true, "LeftControl", false, game)
        task.wait()
        game:service("VirtualInputManager"):SendKeyEvent(false, "LeftControl", false, game)
    end)
end)
