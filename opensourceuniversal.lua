local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local targethud = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stratxgy/Lua-TargetHud/refs/heads/main/targethud.lua"))()
local Aimbot = loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V3/main/src/Aimbot.lua"))()
local triggerbot = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stratxgy/Roblox-Lua-Triggerbot/refs/heads/main/Triggerbot.lua"))()
local chams = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stratxgy/Roblox-Chams-Highlight/refs/heads/main/Highlight.lua"))()
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/linemaster2/esp-library/main/library.lua"))();
--Aimbot.Load()
local Window = Library:CreateWindow({
    Title = 'Nerion | Universal',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})
--Tabs
local Tabs = {
    Main = Window:AddTab('Aimbot'),
    Visual = Window:AddTab('Visuals'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local LeftGroupBox = Tabs.Main:AddLeftGroupbox('Aimbot')
local MyButton = LeftGroupBox:AddButton({
    Text = 'Load Aimbot',
    Func = function()
        Aimbot.Load()
    end,
    DoubleClick = false,
    Tooltip = 'Load The Aimbot Module.'
})

LeftGroupBox:AddToggle('AimbotToggle', {
    Text = 'Aimbot',
    Default = false, -- Default value (true / false)
    Tooltip = 'Lock at nearest player head.', -- Information shown when you hover over the toggle
    Callback = function(Value)
        getgenv().ExunysDeveloperAimbot.Settings.Enabled = Value
    end
})

LeftGroupBox:AddLabel('Lock Button'):AddKeyPicker('KeyPicker', {
    Default = 'MB2',
    SyncToggleState = true,
    Mode = 'Hold',

    Text = 'Lock Button',
    NoUI = true,

    Callback = function(Value)
        getgenv().ExunysDeveloperAimbot.Settings.TriggerKey = Value
    end,
    ChangedCallback = function(New)
        getgenv().ExunysDeveloperAimbot.Settings.TriggerKey = New
    end
})

LeftGroupBox:AddSlider('FovSlider', {
    Text = 'FOV Circle',
    Default = 90,
    Min = 90,
    Max = 500,
    Rounding = 5,
    Compact = false,

    Callback = function(Value)
        getgenv().ExunysDeveloperAimbot.FOVSettings.Radius = Value
    end
})

LeftGroupBox:AddToggle('AimbotToggle', {
    Text = 'Rainbow FOV',
    Default = false, -- Default value (true / false)
    Tooltip = 'im to lazy to add tooltip...', -- Information shown when you hover over the toggle
    Callback = function(Value)
        getgenv().ExunysDeveloperAimbot.FOVSettings.RainbowColor = Value
    end
})

LeftGroupBox:AddToggle('AimbotToggle', {
    Text = 'Rainbow Outline',
    Default = false, -- Default value (true / false)
    Tooltip = 'Make fov outline rainbow.', -- Information shown when you hover over the toggle
    Callback = function(Value)
        getgenv().ExunysDeveloperAimbot.FOVSettings.RainbowOutlineColor = Value
    end
})

LeftGroupBox:AddLabel('FOV Color'):AddColorPicker('ColorPicker', {
    Default = Color3.new(255, 255, 255), -- Bright green
    Title = 'FOV Color', -- Optional. Allows you to have a custom color picker title (when you open it)
    Transparency = 0, -- Optional. Enables transparency changing for this color picker (leave as nil to disable)

    Callback = function(Value)
        getgenv().ExunysDeveloperAimbot.FOVSettings.Color = Value
    end
})

LeftGroupBox:AddLabel('FOV Color When Locked'):AddColorPicker('ColorPicker', {
    Default = Color3.new(255, 255, 255), -- Bright green
    Title = 'FOV Color When Locked', -- Optional. Allows you to have a custom color picker title (when you open it)
    Transparency = 0, -- Optional. Enables transparency changing for this color picker (leave as nil to disable)

    Callback = function(Value)
        getgenv().ExunysDeveloperAimbot.FOVSettings.Color = Value
    end
})

LeftGroupBox:AddSlider('SmoothSlider', {
    Text = 'FOV Transparency',
    Default = 1,
    Min = 0,
    Max = 1,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().ExunysDeveloperAimbot.FOVSettings.Transparency = Value
    end
})

LeftGroupBox:AddSlider('SmoothSlider', {
    Text = 'Smoothness (lower = faster)',
    Default = 0,
    Min = 0,
    Max = 5,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().ExunysDeveloperAimbot.Settings.Sensitivity = Value
    end
})

local LeftGroupBox2 = Tabs.Main:AddLeftGroupbox('TriggerBot')
local MyButton = LeftGroupBox2:AddButton({
    Text = 'TriggerBot',
    Func = function()
        getgenv().triggerbot.load()
    end,
    DoubleClick = false,
    Tooltip = 'TriggerBot!!!!!'
})

LeftGroupBox2:AddLabel('TriggerBot Toggle Key'):AddKeyPicker('KeyPicker', {
    Default = 'T',
    SyncToggleState = true,
    Mode = 'Hold',

    Text = 'TriggerBot Toggle Key',
    NoUI = true,

    Callback = function(Value)
        getgenv().triggerbot.Settings.toggleKey = Value
    end,
    ChangedCallback = function(New)
        getgenv().triggerbot.Settings.toggleKey = New
    end
})

LeftGroupBox2:AddSlider('SmoothSlider', {
    Text = 'Click Delay (Seconds)',
    Default = 0,
    Min = 0,
    Max = 2,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().triggerbot.Settings.clickDelay = Value
    end
})

local CheckBox = Tabs.Main:AddRightGroupbox('Checks')
CheckBox:AddToggle('TeamAimbotToggle', {
    Text = 'Team Check',
    Default = false, -- Default value (true / false)
    Tooltip = 'Not Aim to your team.', -- Information shown when you hover over the toggle
    Callback = function(Value)
        getgenv().ExunysDeveloperAimbot.Settings.TeamCheck = Value
    end
})

CheckBox:AddToggle('TeamAimbotToggle', {
    Text = 'Wall Check',
    Default = false, -- Default value (true / false)
    Tooltip = 'OMG WALL CHECK!!!!!!!!!!!', -- Information shown when you hover over the toggle
    Callback = function(Value)
        getgenv().ExunysDeveloperAimbot.Settings.WallCheck = Value
    end
})

CheckBox:AddToggle('TeamAimbotToggle', {
    Text = 'Alive Check',
    Default = false, -- Default value (true / false)
    Tooltip = 'OMG ALIVE CHECK!!!!!!!!!!!', -- Information shown when you hover over the toggle
    Callback = function(Value)
        getgenv().ExunysDeveloperAimbot.Settings.AliveCheck = Value
    end
})

CheckBox:AddToggle('TeamAimbotToggle', {
    Text = 'Aimbot Toggle (hold / toggle)',
    Default = false, -- Default value (true / false)
    Tooltip = 'OMG AIMBOT TOGGLE!!!!!!!!!!!', -- Information shown when you hover over the toggle
    Callback = function(Value)
        getgenv().ExunysDeveloperAimbot.Settings.Toggle = Value
    end
})

local healBox = Tabs.Visual:AddLeftGroupbox('Health Bar')
healBox:AddToggle('TeamAimbotToggle', {
    Text = 'Enable ESP',
    Default = false, -- Default value (true / false)
    Tooltip = 'idk', -- Information shown when you hover over the toggle
    Callback = function(Value)
        ESP.Enabled = Value
    end
})

healBox:AddToggle('TeamAimbotToggle', {
    Text = 'Health Bar',
    Default = false, -- Default value (true / false)
    Tooltip = 'idk', -- Information shown when you hover over the toggle
    Callback = function(Value)
        ESP.ShowHealth = Value
    end
})

local thBox = Tabs.Visual:AddLeftGroupbox('Target Hud')
thBox:AddToggle('TeamAimbotToggle', {
    Text = 'Target Hud',
    Default = false, -- Default value (true / false)
    Tooltip = 'idk', -- Information shown when you hover over the toggle
    Callback = function(Value)
        getgenv().targethud.enabled = Value
    end
})

local Box = Tabs.Visual:AddLeftGroupbox('Menu Settings')
local MyButton = Box:AddButton({
    Text = 'Nerion Watermark',
    Func = function()
        Library:SetWatermarkVisibility(true)

-- Example of dynamically-updating watermark with common traits (fps and ping)
local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 60;

local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1;

    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter;
        FrameTimer = tick();
        FrameCounter = 0;
    end;

    Library:SetWatermark(('Nerion | Universal | %s fps | %s ms'):format(
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ));
end);
    end,
    DoubleClick = false,
    Tooltip = 'TriggerBot!!!!!'
})


local chamsBox = Tabs.Visual:AddRightGroupbox('Chams')

chamsBox:AddToggle('TeamAimbotToggle', {
    Text = 'Chams',
    Default = false, -- Default value (true / false)
    Tooltip = 'Very Good Chams!', -- Information shown when you hover over the toggle
    Callback = function(Value)
        getgenv().chams.enabled = Value
    end
})

chamsBox:AddToggle('TeamAimbotToggle', {
    Text = 'Chams Team Check',
    Default = false, -- Default value (true / false)
    Tooltip = 'Very Good Chams!', -- Information shown when you hover over the toggle
    Callback = function(Value)
        getgenv().chams.teamcheck = Value
    end
})
