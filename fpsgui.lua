local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FPSGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Name = "FPSFrame"
frame.Parent = screenGui
frame.Size = UDim2.new(0, 120, 0, 40)
frame.Position = UDim2.new(0, 20, 0, 20)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BackgroundTransparency = 0.2
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local uiStroke = Instance.new("UIStroke")
uiStroke.Parent = frame
uiStroke.Color = Color3.fromRGB(255, 255, 255)
uiStroke.Thickness = 2
uiStroke.Transparency = 0
uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local fpsLabel = Instance.new("TextLabel")
fpsLabel.Name = "FPSLabel"
fpsLabel.Parent = frame
fpsLabel.Size = UDim2.new(1, 0, 1, 0)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Font = Enum.Font.SourceSansBold
fpsLabel.TextSize = 20
fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsLabel.TextStrokeTransparency = 0.6
fpsLabel.Text = "FPS: 0"

local RunService = game:GetService("RunService")

local lastUpdate = 0
local frames = 0

RunService.RenderStepped:Connect(function(deltaTime)
    frames += 1
    lastUpdate += deltaTime

    if lastUpdate >= 1 then
        fpsLabel.Text = "FPS: "..frames
        frames = 0
        lastUpdate = 0
    end
end)
