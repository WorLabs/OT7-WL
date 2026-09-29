--[=[
    ========================================================================================
    SPINOSEA PROJECT // UNIVERSAL SECURE EXECUTABLE SUITE (v4.3 LEAGUE BYPASS)
    DEVELOPED BY: SPINOSEA // ADVANCED REVERSE-ENGINEERING & SCRIPTING DIVISION
    ========================================================================================
]=]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer

-- ======================================================================================
-- 1. AUTHORIZED USER ID SECURITY WHITELIST ENGINE
-- ======================================================================================
local AUTHORIZED_USER_IDS = {
    3530501646,
    11736526540, -- Added new user ID here
    11218551992,
    10141590116,
    10032326162,
    10839496968
}

local function verifyUserAuthorization()
    local localUserId = player.UserId
    local isAuthorized = false
    
    for _, authorizedId in ipairs(AUTHORIZED_USER_IDS) do
        if localUserId == authorizedId then
            isAuthorized = true
            break
        end
    end
    
    if not isAuthorized then
        player:Kick("\n[Spinosea Project Security] Access Denied.\nThis executable is restricted to authorized personnel only.")
        while true do
            task.wait(1)
            pcall(function()
                player:Kick("\n[Spinosea Project Security] Unauthorized execution attempt detected.")
            end)
        end
    end
end

verifyUserAuthorization()

-- ======================================================================================
-- 2. STATE CONFIGURATION & RUNTIME DEFAULTS
-- ======================================================================================
local character = player.Character or player.CharacterAdded:Wait()
player.CharacterAdded:Connect(function(char)
    character = char
end)

local ApexConfig = {
    MaxRadius = 35,
    CurrentRadius = 18,
    VisualEnabled = false,
    CustomWalkSpeed = 16,
    CustomJumpPower = 50,
    GravityValue = 196.2,
    SpeedBoostEnabled = false,
    AutoCatchEnabled = true,
    ReachAssistEnabled = true,
    BigHeadEnabled = false,
    EnlargedArmsEnabled = false,
    StreamerModeEnabled = false,
    SpoofedNameTarget = "StreamerUser",
    CurrentThemeName = "Cyan Cyber",
    AccentColor = Color3.fromRGB(0, 162, 255),
    SavedConfigs = {}
}

-- ======================================================================================
-- 3. PROFESSIONAL UI ARCHITECTURE // CORE FRAMEWORK INITIALIZATION
-- ======================================================================================
local parentGui = (pcall(function() return CoreGui end) and CoreGui) or player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SpinoseaProject_UltimateSuite_v43"
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 999999
screenGui.Parent = parentGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainContainer"
mainFrame.Size = UDim2.new(0, 520, 0, 380)
mainFrame.Position = UDim2.new(0, 40, 0.25, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(8, 10, 16)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Active = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 10)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Name = "ThemeStroke"
mainStroke.Color = ApexConfig.AccentColor
mainStroke.Thickness = 1.5
mainStroke.Parent = mainFrame

-- ======================================================================================
-- 4. PROCEDURAL STARFIELD BACKGROUND ENGINE
-- ======================================================================================
local starContainer = Instance.new("Folder")
starContainer.Name = "StarfieldEngine"
starContainer.Parent = mainFrame

local activeStars = {}
math.randomseed(tick())
for i = 1, 40 do
    local star = Instance.new("Frame")
    star.Size = UDim2.new(0, math.random(2, 3), 0, math.random(2, 3))
    star.Position = UDim2.new(math.random(), 0, math.random(), 0)
    star.BackgroundColor3 = Color3.fromRGB(200, 230, 255)
    star.BackgroundTransparency = math.random(15, 65) / 100
    star.BorderSizePixel = 0
    star.Parent = starContainer
    
    table.insert(activeStars, {
        Object = star,
        DriftSpeed = math.random(4, 14) / 10000
    })
end

RunService.RenderStepped:Connect(function()
    for _, starData in ipairs(activeStars) do
        local currentPos = starData.Object.Position
        local nextY = currentPos.Y.Scale + starData.DriftSpeed
        if nextY > 1 then nextY = 0 end
        starData.Object.Position = UDim2.new(currentPos.X.Scale, 0, nextY, 0)
    end
end)

-- ======================================================================================
-- 5. PROFESSIONAL TOP HEADER & COMMAND DECK
-- ======================================================================================
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 42)
titleBar.BackgroundColor3 = Color3.fromRGB(12, 16, 26)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 10)
titleCorner.Parent = titleBar

local titleCover = Instance.new("Frame")
titleCover.Size = UDim2.new(1, 0, 0, 6)
titleCover.Position = UDim2.new(0, 0, 1, -6)
titleCover.BackgroundColor3 = Color3.fromRGB(12, 16, 26)
titleCover.BorderSizePixel = 0
titleCover.Parent = titleBar

local brandLabel = Instance.new("TextLabel")
brandLabel.Size = UDim2.new(0, 250, 1, 0)
brandLabel.Position = UDim2.new(0, 14, 0, 0)
brandLabel.BackgroundTransparency = 1
brandLabel.Text = "SPINOSEA PROJECT // LEAGUE BYPASS"
brandLabel.TextColor3 = Color3.fromRGB(0, 220, 255)
brandLabel.TextSize = 12
brandLabel.Font = Enum.Font.GothamBlack
brandLabel.TextXAlignment = Enum.TextXAlignment.Left
brandLabel.Parent = titleBar

local subBrandLabel = Instance.new("TextLabel")
subBrandLabel.Size = UDim2.new(0, 250, 0, 12)
subBrandLabel.Position = UDim2.new(0, 14, 0, 25)
subBrandLabel.BackgroundTransparency = 1
subBrandLabel.Text = "Authorized ID Build v4.3"
subBrandLabel.TextColor3 = Color3.fromRGB(110, 140, 175)
subBrandLabel.TextSize = 9
subBrandLabel.Font = Enum.Font.GothamMedium
subBrandLabel.TextXAlignment = Enum.TextXAlignment.Left
subBrandLabel.Parent = titleBar

local minButton = Instance.new("TextButton")
minButton.Size = UDim2.new(0, 26, 0, 26)
minButton.Position = UDim2.new(1, -62, 0.5, -13)
minButton.BackgroundColor3 = Color3.fromRGB(22, 30, 50)
minButton.Text = "-"
minButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minButton.Font = Enum.Font.GothamBold
minButton.TextSize = 14
minButton.Parent = titleBar
Instance.new("UICorner", minButton).CornerRadius = UDim.new(0, 6)

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 26, 0, 26)
closeButton.Position = UDim2.new(1, -30, 0.5, -13)
closeButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
closeButton.Text = "×"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 14
closeButton.Parent = titleBar
Instance.new("UICorner", closeButton).CornerRadius = UDim.new(0, 6)

-- ======================================================================================
-- 6. SIDEBAR NAVIGATION & TAB CONTAINER SYSTEM
-- ======================================================================================
local sidebar = Instance.new("ScrollingFrame")
sidebar.Name = "SidebarNavigation"
sidebar.Size = UDim2.new(0, 120, 1, -52)
sidebar.Position = UDim2.new(0, 8, 0, 46)
sidebar.BackgroundTransparency = 1
sidebar.CanvasSize = UDim2.new(0, 0, 0, 300)
sidebar.ScrollBarThickness = 2
sidebar.Parent = mainFrame

local sideListLayout = Instance.new("UIListLayout")
sideListLayout.Padding = UDim.new(0, 6)
sideListLayout.Parent = sidebar

local contentPanel = Instance.new("Frame")
contentPanel.Name = "ContentPanel"
contentPanel.Size = UDim2.new(1, -140, 1, -52)
contentPanel.Position = UDim2.new(0, 134, 0, 46)
contentPanel.BackgroundTransparency = 1
contentPanel.Parent = mainFrame

local registeredTabs = {}
local registeredButtons = {}
local activeTabReference = nil

local function createNavigationTab(tabName)
    local tabScroll = Instance.new("ScrollingFrame")
    tabScroll.Name = tabName .. "_TabContainer"
    tabScroll.Size = UDim2.new(1, 0, 1, 0)
    tabScroll.BackgroundTransparency = 1
    tabScroll.Visible = false
    tabScroll.CanvasSize = UDim2.new(0, 0, 0, 650)
    tabScroll.ScrollBarThickness = 3
    tabScroll.Parent = contentPanel

    local tabLayout = Instance.new("UIListLayout")
    tabLayout.Padding = UDim.new(0, 8)
    tabLayout.Parent = tabScroll

    registeredTabs[tabName] = tabScroll

    local tabBtn = Instance.new("TextButton")
    tabBtn.Name = tabName .. "_Button"
    tabBtn.Size = UDim2.new(1, 0, 0, 34)
    tabBtn.BackgroundColor3 = Color3.fromRGB(15, 20, 35)
    tabBtn.Text = tabName
    tabBtn.TextColor3 = Color3.fromRGB(170, 185, 210)
    tabBtn.Font = Enum.Font.GothamBold
    tabBtn.TextSize = 11
    tabBtn.Parent = sidebar
    Instance.new("UICorner", tabBtn).CornerRadius = UDim.new(0, 6)

    tabBtn.MouseButton1Click:Connect(function()
        for _, tObj in pairs(registeredTabs) do tObj.Visible = false end
        for _, bObj in pairs(registeredButtons) do 
            bObj.BackgroundColor3 = Color3.fromRGB(15, 20, 35) 
            bObj.TextColor3 = Color3.fromRGB(170, 185, 210) 
        end
        tabScroll.Visible = true
        tabBtn.BackgroundColor3 = ApexConfig.AccentColor
        tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        activeTabReference = tabName
    end)

    registeredButtons[tabName] = tabBtn
    if not activeTabReference then
        tabScroll.Visible = true
        tabBtn.BackgroundColor3 = ApexConfig.AccentColor
        tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        activeTabReference = tabName
    end

    return tabScroll
end

-- ======================================================================================
-- 7. UI COMPONENT FACTORIES (SLIDERS, TOGGLES, LABELS, INPUTS)
-- ======================================================================================
local function addSectionHeader(tab, text)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 0, 22)
    lbl.BackgroundTransparency = 1
    lbl.Text = "— " .. string.upper(text) .. " —"
    lbl.TextColor3 = Color3.fromRGB(100, 130, 165)
    lbl.TextSize = 10
    lbl.Font = Enum.Font.GothamBlack
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = tab
end

local function addToggleComponent(tab, text, initialState, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.BackgroundColor3 = initialState and Color3.fromRGB(0, 100, 180) or Color3.fromRGB(16, 22, 38)
    btn.Text = text .. ": " .. (initialState and "ACTIVE" or "DISABLED")
    btn.TextColor3 = Color3.fromRGB(240, 245, 255)
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 11
    btn.Parent = tab
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    local state = initialState
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = text .. ": " .. (state and "ACTIVE" or "DISABLED")
        btn.BackgroundColor3 = state and Color3.fromRGB(0, 110, 200) or Color3.fromRGB(16, 22, 38)
        callback(state)
    end)
end

local function addSliderComponent(tab, name, minVal, maxVal, defaultVal, callback)
    local wrapper = Instance.new("Frame")
    wrapper.Size = UDim2.new(1, 0, 0, 46)
    wrapper.BackgroundTransparency = 1
    wrapper.Parent = tab

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 0, 18)
    lbl.BackgroundTransparency = 1
    lbl.Text = name .. ": " .. defaultVal
    lbl.TextColor3 = Color3.fromRGB(210, 225, 245)
    lbl.TextSize = 11
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = wrapper

    local track = Instance.new("Frame")
    track.Size = UDim2.new(1, 0, 0, 8)
    track.Position = UDim2.new(0, 0, 0, 24)
    track.BackgroundColor3 = Color3.fromRGB(18, 24, 40)
    track.BorderSizePixel = 0
    track.Parent = wrapper
    Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0)

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((defaultVal - minVal) / (maxVal - minVal), 0, 1, 0)
    fill.BackgroundColor3 = ApexConfig.AccentColor
    fill.BorderSizePixel = 0
    fill.Parent = track
    Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)

    local handle = Instance.new("Frame")
    handle.Size = UDim2.new(0, 14, 0, 14)
    handle.AnchorPoint = Vector2.new(0.5, 0.5)
    handle.Position = UDim2.new(fill.Size.X.Scale, 0, 0.5, 0)
    handle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    handle.Parent = track
    Instance.new("UICorner", handle).CornerRadius = UDim.new(1, 0)

    RunService.RenderStepped:Connect(function()
        local hue = (tick() * 0.18) % 1
        local rainbowColor = Color3.fromHSV(hue, 0.85, 1)
        fill.BackgroundColor3 = rainbowColor
        handle.BackgroundColor3 = rainbowColor
    end)

    local dragging = false
    local function updateSliderInput(input)
        local pos = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
        fill.Size = UDim2.new(pos, 0, 1, 0)
        handle.Position = UDim2.new(pos, 0, 0.5, 0)
        local computedVal = math.floor(minVal + ((maxVal - minVal) * pos))
        lbl.Text = name .. ": " .. computedVal
        callback(computedVal)
    end

    track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            updateSliderInput(input)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateSliderInput(input)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

-- ======================================================================================
-- 8. BUILDING THE TABS AND MODULE FEATURES
-- ======================================================================================

-- --- TAB 1: CATCHING TAB ---
local catchingTab = createNavigationTab("Catching")
addSectionHeader(catchingTab, "Spatial Hitbox & Magnetics")
addSliderComponent(catchingTab, "Mag Reach (Studs)", 5, ApexConfig.MaxRadius, ApexConfig.CurrentRadius, function(val)
    ApexConfig.CurrentRadius = val
end)
addToggleComponent(catchingTab, "Hitbox Visualizer (V)", ApexConfig.VisualEnabled, function(state)
    ApexConfig.VisualEnabled = state
end)
addToggleComponent(catchingTab, "Auto-Catch Assist", ApexConfig.ReachAssistEnabled, function(state)
    ApexConfig.ReachAssistEnabled = state
end)
addToggleComponent(catchingTab, "Multi-Limb FTI Barrage", ApexConfig.AutoCatchEnabled, function(state)
    ApexConfig.AutoCatchEnabled = state
end)

-- --- TAB 2: PLAYER TAB ---
local playerTab = createNavigationTab("Player")
addSectionHeader(playerTab, "Locomotion & Physics")
addSliderComponent(playerTab, "Speed Multiplier", 16, 1000, ApexConfig.CustomWalkSpeed, function(val)
    ApexConfig.CustomWalkSpeed = val
end)
addSliderComponent(playerTab, "Jump Power", 50, 550, ApexConfig.CustomJumpPower, function(val)
    ApexConfig.CustomJumpPower = val
end)
addSliderComponent(playerTab, "World Gravity", 0, 500, ApexConfig.GravityValue, function(val)
    ApexConfig.GravityValue = val
    Workspace.Gravity = val
end)
addToggleComponent(playerTab, "Enable Stat Boosts", ApexConfig.SpeedBoostEnabled, function(state)
    ApexConfig.SpeedBoostEnabled = state
end)

addSectionHeader(playerTab, "Character Modifications")
addToggleComponent(playerTab, "Big Head Modifier", ApexConfig.BigHeadEnabled, function(state)
    ApexConfig.BigHeadEnabled = state
    if character and character:FindFirstChild("Head") then
        character.Head.Size = state and Vector3.new(4, 4, 4) or Vector3.new(2, 1, 1)
    end
end)
addToggleComponent(playerTab, "Enlarged Arms Modifier", ApexConfig.EnlargedArmsEnabled, function(state)
    ApexConfig.EnlargedArmsEnabled = state
    if character then
        for _, partName in ipairs({"Right Arm", "Left Arm", "RightHand", "LeftHand", "RightLowerArm", "LeftLowerArm"}) do
            local limb = character:FindFirstChild(partName)
            if limb and limb:IsA("BasePart") then
                limb.Size = state and limb.Size * 1.5 or limb.Size / 1.5
            end
        end
    end
end)

addSectionHeader(playerTab, "Name Spoofer (Streamer Mode)")
local streamerInputBox = Instance.new("TextBox")
streamerInputBox.Size = UDim2.new(1, 0, 0, 34)
streamerInputBox.BackgroundColor3 = Color3.fromRGB(16, 22, 38)
streamerInputBox.Text = "StreamerUser"
streamerInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
streamerInputBox.Font = Enum.Font.GothamMedium
streamerInputBox.TextSize = 11
streamerInputBox.Parent = playerTab
Instance.new("UICorner", streamerInputBox).CornerRadius = UDim.new(0, 6)

streamerInputBox.FocusLost:Connect(function()
    if streamerInputBox.Text ~= "" then
        ApexConfig.SpoofedNameTarget = streamerInputBox.Text
    end
end)

addToggleComponent(playerTab, "Streamer Mode (Client Spoof)", ApexConfig.StreamerModeEnabled, function(state)
    ApexConfig.StreamerModeEnabled = state
end)

-- --- TAB 3: UI SETTINGS TAB ---
local uiTab = createNavigationTab("UI Settings")
addSectionHeader(uiTab, "Accent Color Engine")

local function registerThemeButton(themeName, themeColor)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.BackgroundColor3 = themeColor
    btn.Text = "Theme: " .. themeName
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 11
    btn.Parent = uiTab
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    btn.MouseButton1Click:Connect(function()
        ApexConfig.CurrentThemeName = themeName
        ApexConfig.AccentColor = themeColor
        mainStroke.Color = themeColor
    end)
end

registerThemeButton("Cyan Cyber", Color3.fromRGB(0, 162, 255))
registerThemeButton("Emerald Neon", Color3.fromRGB(0, 255, 120))
registerThemeButton("Sunset Crimson", Color3.fromRGB(255, 50, 50))
registerThemeButton("Royal Purple", Color3.fromRGB(150, 40, 255))
registerThemeButton("Amber Gold", Color3.fromRGB(255, 180, 0))

-- --- TAB 4: CONFIGS TAB ---
local configsTab = createNavigationTab("Configs")
addSectionHeader(configsTab, "Configuration Persistence Engine")

local configNameBox = Instance.new("TextBox")
configNameBox.Size = UDim2.new(1, 0, 0, 34)
configNameBox.BackgroundColor3 = Color3.fromRGB(16, 22, 38)
configNameBox.Text = "MyCustomConfig"
configNameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
configNameBox.Font = Enum.Font.GothamMedium
configNameBox.TextSize = 11
configNameBox.Parent = configsTab
Instance.new("UICorner", configNameBox).CornerRadius = UDim.new(0, 6)

local saveConfigBtn = Instance.new("TextButton")
saveConfigBtn.Size = UDim2.new(1, 0, 0, 32)
saveConfigBtn.BackgroundColor3 = Color3.fromRGB(0, 110, 200)
saveConfigBtn.Text = "Save Configuration State"
saveConfigBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
saveConfigBtn.Font = Enum.Font.GothamBold
saveConfigBtn.TextSize = 11
saveConfigBtn.Parent = configsTab
Instance.new("UICorner", saveConfigBtn).CornerRadius = UDim.new(0, 6)

saveConfigBtn.MouseButton1Click:Connect(function()
    local name = configNameBox.Text
    if name and name ~= "" then
        ApexConfig.SavedConfigs[name] = {
            Radius = ApexConfig.CurrentRadius,
            Speed = ApexConfig.CustomWalkSpeed,
            Jump = ApexConfig.CustomJumpPower
        }
        print("[Spinosea Configs]: Successfully saved configuration profile -> " .. name)
    end
end)

-- --- TAB 5: EXTRA TAB ---
local extraTab = createNavigationTab("Extra")
addSectionHeader(extraTab, "Dynamic Environment & Skybox Engine")

local function registerSkyboxOption(skyName, assetId)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.BackgroundColor3 = Color3.fromRGB(16, 22, 38)
    btn.Text = "Skybox: " .. skyName
    btn.TextColor3 = Color3.fromRGB(220, 230, 245)
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 11
    btn.Parent = extraTab
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    btn.MouseButton1Click:Connect(function()
        Lighting:ClearAllChildren("Sky")
        local newSky = Instance.new("Sky")
        newSky.SkyboxBk = assetId
        newSky.SkyboxDn = assetId
        newSky.SkyboxFt = assetId
        newSky.SkyboxLf = assetId
        newSky.SkyboxRt = assetId
        newSky.SkyboxUp = assetId
        newSky.Parent = Lighting
    end)
end

registerSkyboxOption("Galaxy", "rbxassetid://159454296")
registerSkyboxOption("Night", "rbxassetid://135284488")
registerSkyboxOption("Red Storm", "rbxassetid://264906666")
registerSkyboxOption("Day", "rbxassetid://701864875")

addSectionHeader(extraTab, "Stadium Turf Color Shifter")

local function registerTurfColorOption(turfName, turfColor)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.BackgroundColor3 = Color3.fromRGB(16, 22, 38)
    btn.Text = "Field Turf: " .. turfName
    btn.TextColor3 = Color3.fromRGB(220, 230, 245)
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 11
    btn.Parent = extraTab
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    btn.MouseButton1Click:Connect(function()
        for _, descendant in ipairs(Workspace:GetDescendants()) do
            if descendant:IsA("BasePart") then
                local lowerName = string.lower(descendant.Name)
                if string.find(lowerName, "field") or string.find(lowerName, "turf") or string.find(lowerName, "grass") then
                    descendant.Color = turfColor
                end
            end
        end
    end)
end

registerTurfColorOption("Classic Green", Color3.fromRGB(34, 139, 34))
registerTurfColorOption("Midnight Turf", Color3.fromRGB(15, 20, 35))
registerTurfColorOption("Crimson Turf", Color3.fromRGB(120, 20, 20))
registerTurfColorOption("Gold Turf", Color3.fromRGB(200, 160, 40))

-- ======================================================================================
-- 9. WINDOW DRAGGING & MINIMIZE CONTROLS
-- ======================================================================================
local isDraggingFrame, dragInputPointer, startMousePos, startFramePos
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isDraggingFrame = true
        startMousePos = input.Position
        startFramePos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                isDraggingFrame = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if isDraggingFrame and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - startMousePos
        mainFrame.Position = UDim2.new(startFramePos.X.Scale, startFramePos.X.Offset + delta.X, startFramePos.Y.Scale, startFramePos.Y.Offset + delta.Y)
    end
end)

local isMinimizedState = false
minButton.MouseButton1Click:Connect(function()
    isMinimizedState = not isMinimizedState
    contentPanel.Visible = not isMinimizedState
    sidebar.Visible = not isMinimizedState
    mainFrame.Size = isMinimizedState and UDim2.new(0, 520, 0, 42) or UDim2.new(0, 520, 0, 380)
    minButton.Text = isMinimizedState and "+" or "-"
end)

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

UserInputService.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode.LeftControl then
        mainFrame.Visible = not mainFrame.Visible
    end
end)

-- ======================================================================================
-- 10. ADVANCED LEAGUE SERVER BYPASS // PROXIMITY HOOK & REMOTE SPOOF ENGINE
-- ======================================================================================
local visualSpherePart = Instance.new("Part")
visualSpherePart.Name = "SpinoseaHitboxVisualizer"
visualSpherePart.Shape = Enum.PartType.Ball
visualSpherePart.Material = Enum.Material.ForceField
visualSpherePart.Color = Color3.fromRGB(0, 220, 255)
visualSpherePart.Transparency = 0.85
visualSpherePart.Anchored = true
visualSpherePart.CanCollide = false
visualSpherePart.CastShadow = false

local overlapParameters = OverlapParams.new()
overlapParameters.FilterType = Enum.RaycastFilterType.Exclude

-- Cache game remotes dynamically to hook into custom league server events
local cachedRemotes = {}
task.spawn(function()
    pcall(function()
        for _, descendant in ipairs(game:GetDescendants()) do
            if descendant:IsA("RemoteEvent") or descendant:IsA("RemoteFunction") then
                local lowerName = string.lower(descendant.Name)
                if string.find(lowerName, "catch") or string.find(lowerName, "touch") or string.find(lowerName, "football") or string.find(lowerName, "mag") then
                    table.insert(cachedRemotes, descendant)
                end
            end
        end
    end)
end)

local function verifyUnweldedBall(ballInstance)
    if ballInstance.Parent:FindFirstChildOfClass("Humanoid") then return false end
    for _, child in ipairs(ballInstance:GetChildren()) do
        if child:IsA("Weld") or child:IsA("WeldConstraint") or child:IsA("Motor6D") then
            return false
        end
    end
    return true
end

RunService.Heartbeat:Connect(function()
    if not character then return end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoidRootPart or not humanoid then return end

    if ApexConfig.SpeedBoostEnabled then
        humanoid.WalkSpeed = ApexConfig.CustomWalkSpeed
        humanoid.JumpPower = ApexConfig.CustomJumpPower
    end

    if ApexConfig.VisualEnabled then
        local computedDiameter = ApexConfig.CurrentRadius * 2
        visualSpherePart.Size = Vector3.new(computedDiameter, computedDiameter, computedDiameter)
        visualSpherePart.CFrame = humanoidRootPart.CFrame
        visualSpherePart.Parent = Workspace
    else
        visualSpherePart.Parent = nil
    end

    -- Streamer Mode / Name Spoofer Logic (Client-Side)
    if ApexConfig.StreamerModeEnabled then
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr.Character then
                local head = plr.Character:FindFirstChild("Head")
                if head then
                    for _, billboard in ipairs(head:GetDescendants()) do
                        if billboard:IsA("BillboardGui") then
                            for _, txtLabel in ipairs(billboard:GetDescendants()) do
                                if txtLabel:IsA("TextLabel") then
                                    if string.find(txtLabel.Text, plr.Name) or string.find(txtLabel.Text, plr.DisplayName) then
                                        txtLabel.Text = ApexConfig.SpoofedNameTarget
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    if ApexConfig.ReachAssistEnabled then
        overlapParameters.FilterDescendantsInstances = {character, visualSpherePart}
        local detectedParts = Workspace:GetPartBoundsInRadius(humanoidRootPart.Position, ApexConfig.CurrentRadius, overlapParameters)
        
        local rightHand = character:FindFirstChild("RightHand") or character:FindFirstChild("Right Arm")
        local leftHand = character:FindFirstChild("LeftHand") or character:FindFirstChild("Left Arm")

        for _, part in ipairs(detectedParts) do
            local nameLower = string.lower(part.Name)
            if (string.find(nameLower, "ball") or string.find(nameLower, "football")) and part:IsA("BasePart") then
                if verifyUnweldedBall(part) then
                    -- Multi-vector trigger for custom league servers
                    if ApexConfig.AutoCatchEnabled then
                        pcall(function()
                            if firetouchinterest and rightHand then
                                firetouchinterest(rightHand, part, 0)
                                firetouchinterest(rightHand, part, 1)
                            end
                            if firetouchinterest and leftHand then
                                firetouchinterest(leftHand, part, 0)
                                firetouchinterest(leftHand, part, 1)
                            end
                            
                            -- Remote Event Proxy Hook for servers blocking standard touches
                            for _, remote in ipairs(cachedRemotes) do
                                if remote:IsA("RemoteEvent") then
                                    pcall(function()
                                        remote:FireServer(part)
                                    end)
                                end
                            end
                        end)
                    end
                end
            end
        end
    end
end)

print("[Spinosea Project Core]: League Bypass Suite initialized successfully. Welcome back, spinosea.")
