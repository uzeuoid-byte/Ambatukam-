
-- AMBATUKAM HUB
-- SUKUNA EDITION
-- Mobile GUI

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "AmbatukamHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(290, 430)
main.Position = UDim2.new(0.5, -145, 0.5, -215)
main.BackgroundColor3 = Color3.fromRGB(18, 10, 28)
main.Active = true
main.Draggable = true
main.Parent = gui

Instance.new("UICorner", main).CornerRadius =
    UDim.new(0, 15)

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(160, 0, 255)
stroke.Thickness = 2
stroke.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 48)
title.BackgroundColor3 = Color3.fromRGB(90, 0, 150)
title.Text = "AMBATUKAM HUB"
title.TextColor3 = Color3.new(1,1,1)
title.TextSize = 21
title.Font = Enum.Font.GothamBold
title.Parent = main

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(35, 35)
close.Position = UDim2.new(1, -40, 0, 6)
close.Text = "X"
close.TextColor3 = Color3.new(1,1,1)
close.BackgroundColor3 = Color3.fromRGB(180, 0, 40)
close.Parent = main

close.Activated:Connect(function()
    gui.Enabled = false
end)

local open = Instance.new("TextButton")
open.Size = UDim2.fromOffset(100, 40)
open.Position = UDim2.new(0, 15, 0.5, 0)
open.Text = "OPEN HUB"
open.TextColor3 = Color3.new(1,1,1)
open.BackgroundColor3 = Color3.fromRGB(90, 0, 150)
open.Parent = gui

Instance.new("UICorner", open)

open.Activated:Connect(function()
    gui.Enabled = true
    main.Visible = true
end)

local container = Instance.new("ScrollingFrame")
container.Size = UDim2.new(1, -20, 1, -65)
container.Position = UDim2.fromOffset(10, 55)
container.BackgroundTransparency = 1
container.BorderSizePixel = 0
container.ScrollBarThickness = 4
container.CanvasSize = UDim2.new(0,0,0,450)
container.Parent = main

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 8)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.Parent = container

local function button(name, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.95, 0, 0, 38)
    b.BackgroundColor3 = Color3.fromRGB(65, 20, 100)
    b.TextColor3 = Color3.new(1,1,1)
    b.TextSize = 14
    b.Font = Enum.Font.GothamBold
    b.Text = name .. " : OFF"
    b.Parent = container

    Instance.new("UICorner", b)

    local enabled = false

    b.Activated:Connect(function()
        enabled = not enabled
        b.Text = name .. (enabled and " : ON" or " : OFF")
        callback(enabled)
    end)
end

-- SUKUNA AURA
button("Sukuna Aura", function(enabled)
    local char = player.Character
    if not char then return end

    local old = char:FindFirstChild("SukunaAura")
    if old then old:Destroy() end

    if enabled then
        local h = Instance.new("Highlight")
        h.Name = "SukunaAura"
        h.FillColor = Color3.fromRGB(180, 0, 0)
        h.OutlineColor = Color3.fromRGB(255, 0, 0)
        h.FillTransparency = 0.55
        h.OutlineTransparency = 0
        h.Parent = char
    end
end)

-- SPEED CONTROL
button("Speed Boost", function(enabled)
    local char = player.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.WalkSpeed = enabled and 32 or 16
    end
end)

-- VISUAL OPTIONS
button("Red Screen Effect", function(enabled)
    local effect = game:GetService("Lighting")
    local old = effect:FindFirstChild("SukunaColor")

    if old then old:Destroy() end

    if enabled then
        local color = Instance.new("ColorCorrectionEffect")
        color.Name = "SukunaColor"
        color.TintColor = Color3.fromRGB(255, 180, 180)
        color.Parent = effect
    end
end)

print("AMBATUKAM HUB LOADED")
