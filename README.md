-- Roblox FPS Booster & 60 FPS Cap with GUI Menu
-- Compatible with Delta Executor

local Lighting = game:GetService("Lighting")
local Terrain = workspace:FindFirstChildOfClass("Terrain")
local CoreGui = game:GetService("CoreGui")

local isBoostActive = false
local originalShadows = Lighting.GlobalShadows
local originalFog = Lighting.FogEnd

local function SetFPS(cap)
    if setfpscap then setfpscap(cap)
    elseif set_fps_cap then set_fps_cap(cap) end
end

local function EnableBoost()
    SetFPS(60)
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    
    if settings and settings().Rendering then
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    end

    if Terrain then
        Terrain.WaterWaveSize = 0
        Terrain.WaterWaveSpeed = 0
        Terrain.WaterReflectance = 0
    end

    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.SmoothPlastic
            v.CastShadow = false
        elseif v:IsA("Decal") or v:IsA("Texture") then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") then
            v.Enabled = false
        end
    end
end

local function DisableBoost()
    SetFPS(0)
    Lighting.GlobalShadows = originalShadows
    Lighting.FogEnd = originalFog

    if settings and settings().Rendering then
        settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
    end

    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Decal") or v:IsA("Texture") then
            v.Transparency = 0
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") then
            v.Enabled = true
        end
    end
end

-- GUI Setup
if CoreGui:FindFirstChild("FPSBoostMenu") then
    CoreGui.FPSBoostMenu:Destroy()
end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "FPSBoostMenu"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 180, 0, 110)
MainFrame.Position = UDim2.new(0.05, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Active = true
MainFrame.Draggable = true

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundTransparency = 1
Title.Text = "⚡ FPS Booster"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.Font = Enum.Font.SourceSansBold

local ToggleBtn = Instance.new("TextButton", MainFrame)
ToggleBtn.Size = UDim2.new(0.85, 0, 0, 45)
ToggleBtn.Position = UDim2.new(0.075, 0, 0.45, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(195, 50, 50)
ToggleBtn.Text = "Tối Ưu: TẮT"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextSize = 15
ToggleBtn.Font = Enum.Font.SourceSansBold

Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 6)

ToggleBtn.MouseButton1Click:Connect(function()
    isBoostActive = not isBoostActive
    if isBoostActive then
        EnableBoost()
        ToggleBtn.Text = "Tối Ưu: BẬT (60 FPS)"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(45, 180, 80)
    else
        DisableBoost()
        ToggleBtn.Text = "Tối Ưu: TẮT"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(195, 50, 50)
    end
end)


