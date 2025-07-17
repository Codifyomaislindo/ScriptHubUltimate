-- ========================================================
-- SCRIPT HUB ULTIMATE LIBRARY v3.0
-- Biblioteca completa para Roblox com ícones Lucide
-- GitHub: https://github.com/Codifyomaislindo/ScriptHubUltimate
-- Autor: Codifyomaislindo
-- ========================================================

local ScriptHubUltimate = {}
ScriptHubUltimate.__index = ScriptHubUltimate

-- Informações da biblioteca
ScriptHubUltimate.Version = "3.0.0"
ScriptHubUltimate.Author = "Codifyomaislindo"
ScriptHubUltimate.Repository = "https://github.com/Codifyomaislindo/ScriptHubUltimate"
ScriptHubUltimate.Documentation = "https://github.com/Codifyomaislindo/ScriptHubUltimate/wiki"
ScriptHubUltimate.RawURL = "https://raw.githubusercontent.com/Codifyomaislindo/ScriptHubUltimate/main/"

-- Função para carregar módulos externos
local function loadModule(path)
    local success, result = pcall(function()
        return loadstring(game:HttpGet(ScriptHubUltimate.RawURL .. path))()
    end)
    
    if success then
        return result
    else
        warn("Falha ao carregar módulo: " .. path)
        return nil
    end
end

-- Carregar ícones do Lucide
local Icons = loadModule("src/icons.lua")

-- Serviços essenciais
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local GuiService = game:GetService("GuiService")
local TextService = game:GetService("TextService")
local SoundService = game:GetService("SoundService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local MarketplaceService = game:GetService("MarketplaceService")

-- Variáveis globais
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Mouse = LocalPlayer:GetMouse()
local Camera = Workspace.CurrentCamera

-- Configurações da biblioteca
ScriptHubUltimate.Config = {
    UI = {
        Theme = "Dark",
        AccentColor = Color3.fromRGB(0, 162, 255),
        AnimationSpeed = 0.3,
        SoundEnabled = true,
        MobileOptimized = true,
        CornerRadius = 12,
        IconSize = 20,
        ButtonHeight = 35,
        Padding = 10,
        AcrylicBlur = true,
        DropShadows = true,
        GradientBackgrounds = true,
        GlowEffects = true,
        AnimatedIcons = true,
        CustomFont = Enum.Font.GothamBold,
        AutoScale = true,
        ResponsiveDesign = true,
        TouchFriendly = true
    },
    
    Security = {
        AntiDetection = true,
        EncryptedStorage = true,
        SafeMode = true,
        StealthMode = true,
        SecureConnections = true
    },
    
    Performance = {
        MaxFPS = 60,
        OptimizeMemory = true,
        CacheEnabled = true,
        PreloadAssets = true,
        CompressData = true,
        LazyLoading = true
    },
    
    Scripts = {
        FlyEnabled = false,
        ESPEnabled = false,
        AimbotEnabled = false,
        TeleportEnabled = false,
        SpeedHackEnabled = false,
        NoClipEnabled = false,
        InfiniteJumpEnabled = false,
        AutoFarmEnabled = false,
        GodModeEnabled = false
    }
}

-- Temas disponíveis
ScriptHubUltimate.Themes = {
    Dark = {
        Primary = Color3.fromRGB(20, 20, 20),
        Secondary = Color3.fromRGB(30, 30, 30),
        Tertiary = Color3.fromRGB(40, 40, 40),
        Accent = Color3.fromRGB(0, 162, 255),
        AccentHover = Color3.fromRGB(30, 182, 255),
        AccentPressed = Color3.fromRGB(0, 142, 235),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(180, 180, 180),
        TextTertiary = Color3.fromRGB(120, 120, 120),
        Success = Color3.fromRGB(40, 167, 69),
        Warning = Color3.fromRGB(255, 193, 7),
        Error = Color3.fromRGB(220, 53, 69),
        Info = Color3.fromRGB(23, 162, 184),
        Border = Color3.fromRGB(60, 60, 60),
        Shadow = Color3.fromRGB(0, 0, 0),
        Gradient = {
            Color3.fromRGB(20, 20, 20),
            Color3.fromRGB(30, 30, 30)
        }
    },
    
    Light = {
        Primary = Color3.fromRGB(255, 255, 255),
        Secondary = Color3.fromRGB(248, 249, 250),
        Tertiary = Color3.fromRGB(233, 236, 239),
        Accent = Color3.fromRGB(0, 123, 255),
        AccentHover = Color3.fromRGB(30, 143, 255),
        AccentPressed = Color3.fromRGB(0, 103, 235),
        Text = Color3.fromRGB(33, 37, 41),
        TextSecondary = Color3.fromRGB(108, 117, 125),
        TextTertiary = Color3.fromRGB(173, 181, 189),
        Success = Color3.fromRGB(40, 167, 69),
        Warning = Color3.fromRGB(255, 193, 7),
        Error = Color3.fromRGB(220, 53, 69),
        Info = Color3.fromRGB(23, 162, 184),
        Border = Color3.fromRGB(222, 226, 230),
        Shadow = Color3.fromRGB(0, 0, 0),
        Gradient = {
            Color3.fromRGB(255, 255, 255),
            Color3.fromRGB(248, 249, 250)
        }
    },
    
    Monet = {
        Primary = Color3.fromRGB(25, 25, 35),
        Secondary = Color3.fromRGB(35, 35, 45),
        Tertiary = Color3.fromRGB(45, 45, 55),
        Accent = Color3.fromRGB(138, 43, 226),
        AccentHover = Color3.fromRGB(158, 63, 246),
        AccentPressed = Color3.fromRGB(118, 23, 206),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(200, 200, 200),
        TextTertiary = Color3.fromRGB(150, 150, 150),
        Success = Color3.fromRGB(50, 205, 50),
        Warning = Color3.fromRGB(255, 140, 0),
        Error = Color3.fromRGB(220, 20, 60),
        Info = Color3.fromRGB(30, 144, 255),
        Border = Color3.fromRGB(75, 75, 85),
        Shadow = Color3.fromRGB(0, 0, 0),
        Gradient = {
            Color3.fromRGB(25, 25, 35),
            Color3.fromRGB(35, 35, 45)
        }
    },
    
    Cyberpunk = {
        Primary = Color3.fromRGB(10, 10, 20),
        Secondary = Color3.fromRGB(20, 20, 30),
        Tertiary = Color3.fromRGB(30, 30, 40),
        Accent = Color3.fromRGB(0, 255, 255),
        AccentHover = Color3.fromRGB(30, 255, 255),
        AccentPressed = Color3.fromRGB(0, 235, 235),
        Text = Color3.fromRGB(0, 255, 255),
        TextSecondary = Color3.fromRGB(0, 200, 200),
        TextTertiary = Color3.fromRGB(0, 150, 150),
        Success = Color3.fromRGB(0, 255, 0),
        Warning = Color3.fromRGB(255, 255, 0),
        Error = Color3.fromRGB(255, 0, 100),
        Info = Color3.fromRGB(0, 150, 255),
        Border = Color3.fromRGB(0, 100, 100),
        Shadow = Color3.fromRGB(0, 50, 50),
        Gradient = {
            Color3.fromRGB(10, 10, 20),
            Color3.fromRGB(20, 20, 30)
        }
    },
    
    Neon = {
        Primary = Color3.fromRGB(5, 5, 15),
        Secondary = Color3.fromRGB(15, 15, 25),
        Tertiary = Color3.fromRGB(25, 25, 35),
        Accent = Color3.fromRGB(255, 0, 255),
        AccentHover = Color3.fromRGB(255, 30, 255),
        AccentPressed = Color3.fromRGB(235, 0, 235),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(255, 200, 255),
        TextTertiary = Color3.fromRGB(200, 150, 200),
        Success = Color3.fromRGB(0, 255, 127),
        Warning = Color3.fromRGB(255, 215, 0),
        Error = Color3.fromRGB(255, 20, 147),
        Info = Color3.fromRGB(138, 43, 226),
        Border = Color3.fromRGB(100, 0, 100),
        Shadow = Color3.fromRGB(50, 0, 50),
        Gradient = {
            Color3.fromRGB(5, 5, 15),
            Color3.fromRGB(15, 15, 25)
        }
    }
}

-- Sistema de notificações avançado
ScriptHubUltimate.NotificationSystem = {
    Notifications = {},
    MaxNotifications = 5,
    DefaultDuration = 5,
    AnimationSpeed = 0.3,
    Position = "TopRight", -- TopRight, TopLeft, BottomRight, BottomLeft, Center
    Sounds = {
        Success = "rbxassetid://131961136",
        Warning = "rbxassetid://131961136", 
        Error = "rbxassetid://131961136",
        Info = "rbxassetid://131961136"
    }
}

function ScriptHubUltimate:CreateNotification(title, description, duration, type)
    local notification = {
        Title = title or "Notification",
        Description = description or "",
        Duration = duration or self.NotificationSystem.DefaultDuration,
        Type = type or "info",
        Id = HttpService:GenerateGUID(false),
        Timestamp = tick()
    }
    
    -- Verificar limite de notificações
    if #self.NotificationSystem.Notifications >= self.NotificationSystem.MaxNotifications then
        self:RemoveNotification(self.NotificationSystem.Notifications[1])
    end
    
    -- Criar GUI da notificação
    local gui = self:CreateNotificationGUI(notification)
    notification.GUI = gui
    
    -- Adicionar à lista
    table.insert(self.NotificationSystem.Notifications, notification)
    
    -- Tocar som
    if self.Config.UI.SoundEnabled then
        self:PlayNotificationSound(notification.Type)
    end
    
    -- Animar entrada
    self:AnimateNotificationIn(gui)
    
    -- Auto-remove após duração
    spawn(function()
        wait(notification.Duration)
        self:RemoveNotification(notification)
    end)
    
    -- Atualizar posições
    self:UpdateNotificationPositions()
    
    return notification
end

function ScriptHubUltimate:CreateNotificationGUI(notification)
    local theme = self.Themes[self.Config.UI.Theme]
    
    -- Container principal
    local container = Instance.new("Frame")
    container.Name = "NotificationContainer_" .. notification.Id
    container.Size = UDim2.new(0, 350, 0, 80)
    container.BackgroundColor3 = theme.Secondary
    container.BorderSizePixel = 0
    container.Parent = PlayerGui
    
    -- Cantos arredondados
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, self.Config.UI.CornerRadius)
    corner.Parent = container
    
    -- Sombra
    if self.Config.UI.DropShadows then
        local shadow = Instance.new("Frame")
        shadow.Name = "Shadow"
        shadow.Size = UDim2.new(1, 10, 1, 10)
        shadow.Position = UDim2.new(0, -5, 0, -5)
        shadow.BackgroundColor3 = theme.Shadow
        shadow.BackgroundTransparency = 0.8
        shadow.BorderSizePixel = 0
        shadow.ZIndex = container.ZIndex - 1
        shadow.Parent = container
        
        local shadowCorner = Instance.new("UICorner")
        shadowCorner.CornerRadius = UDim.new(0, self.Config.UI.CornerRadius + 5)
        shadowCorner.Parent = shadow
    end
    
    -- Gradiente
    if self.Config.UI.GradientBackgrounds then
        local gradient = Instance.new("UIGradient")
        gradient.Color = ColorSequence.new(theme.Gradient)
        gradient.Rotation = 45
        gradient.Parent = container
    end
    
    -- Borda colorida baseada no tipo
    local border = Instance.new("Frame")
    border.Name = "Border"
    border.Size = UDim2.new(0, 4, 1, 0)
    border.Position = UDim2.new(0, 0, 0, 0)
    border.BorderSizePixel = 0
    border.Parent = container
    
    local borderColor = theme.Info
    if notification.Type == "success" then
        borderColor = theme.Success
    elseif notification.Type == "warning" then
        borderColor = theme.Warning
    elseif notification.Type == "error" then
        borderColor = theme.Error
    end
    border.BackgroundColor3 = borderColor
    
    local borderCorner = Instance.new("UICorner")
    borderCorner.CornerRadius = UDim.new(0, self.Config.UI.CornerRadius)
    borderCorner.Parent = border
    
    -- Ícone
    local icon = Instance.new("ImageLabel")
    icon.Name = "Icon"
    icon.Size = UDim2.new(0, 24, 0, 24)
    icon.Position = UDim2.new(0, 15, 0, 15)
    icon.BackgroundTransparency = 1
    icon.ImageColor3 = theme.Text
    icon.Parent = container
    
    -- Definir ícone baseado no tipo
    if Icons and Icons.assets then
        if notification.Type == "success" then
            icon.Image = Icons.assets["lucide-check-circle"] or ""
            icon.ImageColor3 = theme.Success
        elseif notification.Type == "warning" then
            icon.Image = Icons.assets["lucide-alert-triangle"] or ""
            icon.ImageColor3 = theme.Warning
        elseif notification.Type == "error" then
            icon.Image = Icons.assets["lucide-x-circle"] or ""
            icon.ImageColor3 = theme.Error
        else
            icon.Image = Icons.assets["lucide-info"] or ""
            icon.ImageColor3 = theme.Info
        end
    end
    
    -- Título
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, -80, 0, 25)
    title.Position = UDim2.new(0, 50, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = notification.Title
    title.TextColor3 = theme.Text
    title.TextSize = 14
    title.Font = self.Config.UI.CustomFont
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.TextYAlignment = Enum.TextYAlignment.Top
    title.TextWrapped = true
    title.Parent = container
    
    -- Descrição
    local description = Instance.new("TextLabel")
    description.Name = "Description"
    description.Size = UDim2.new(1, -80, 0, 35)
    description.Position = UDim2.new(0, 50, 0, 35)
    description.BackgroundTransparency = 1
    description.Text = notification.Description
    description.TextColor3 = theme.TextSecondary
    description.TextSize = 12
    description.Font = Enum.Font.Gotham
    description.TextXAlignment = Enum.TextXAlignment.Left
    description.TextYAlignment = Enum.TextYAlignment.Top
    description.TextWrapped = true
    description.Parent = container
    
    -- Botão de fechar
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "CloseButton"
    closeButton.Size = UDim2.new(0, 20, 0, 20)
    closeButton.Position = UDim2.new(1, -25, 0, 5)
    closeButton.BackgroundTransparency = 1
    closeButton.Text = ""
    closeButton.Parent = container
    
    local closeIcon = Instance.new("ImageLabel")
    closeIcon.Size = UDim2.new(1, 0, 1, 0)
    closeIcon.BackgroundTransparency = 1
    closeIcon.ImageColor3 = theme.TextSecondary
    closeIcon.Parent = closeButton
    
    if Icons and Icons.assets then
        closeIcon.Image = Icons.assets["lucide-x"] or ""
    end
    
    -- Hover effects
    closeButton.MouseEnter:Connect(function()
        closeIcon.ImageColor3 = theme.Error
    end)
    
    closeButton.MouseLeave:Connect(function()
        closeIcon.ImageColor3 = theme.TextSecondary
    end)
    
    -- Click handler
    closeButton.MouseButton1Click:Connect(function()
        self:RemoveNotification(notification)
    end)
    
    -- Efeito de brilho
    if self.Config.UI.GlowEffects then
        local glow = Instance.new("Frame")
        glow.Name = "Glow"
        glow.Size = UDim2.new(1, 6, 1, 6)
        glow.Position = UDim2.new(0, -3, 0, -3)
        glow.BackgroundColor3 = borderColor
        glow.BackgroundTransparency = 0.9
        glow.BorderSizePixel = 0
        glow.ZIndex = container.ZIndex - 1
        glow.Parent = container
        
        local glowCorner = Instance.new("UICorner")
        glowCorner.CornerRadius = UDim.new(0, self.Config.UI.CornerRadius + 3)
        glowCorner.Parent = glow
    end
    
    return container
end

function ScriptHubUltimate:AnimateNotificationIn(gui)
    local targetPosition = gui.Position
    gui.Position = UDim2.new(1, 0, targetPosition.Y.Scale, targetPosition.Y.Offset)
    
    gui:TweenPosition(
        targetPosition,
        "Out",
        "Quad",
        self.NotificationSystem.AnimationSpeed,
        true
    )
end

function ScriptHubUltimate:AnimateNotificationOut(gui, callback)
    gui:TweenPosition(
        UDim2.new(1, 0, gui.Position.Y.Scale, gui.Position.Y.Offset),
        "Out",
        "Quad",
        self.NotificationSystem.AnimationSpeed,
        true,
        function()
            gui:Destroy()
            if callback then callback() end
        end
    )
end

function ScriptHubUltimate:RemoveNotification(notification)
    -- Encontrar e remover da lista
    for i, notif in ipairs(self.NotificationSystem.Notifications) do
        if notif.Id == notification.Id then
            table.remove(self.NotificationSystem.Notifications, i)
            break
        end
    end
    
    -- Animar saída
    if notification.GUI then
        self:AnimateNotificationOut(notification.GUI)
    end
    
    -- Atualizar posições
    self:UpdateNotificationPositions()
end

function ScriptHubUltimate:UpdateNotificationPositions()
    for i, notification in ipairs(self.NotificationSystem.Notifications) do
        if notification.GUI then
            local targetY = 20 + (i - 1) * 90
            notification.GUI:TweenPosition(
                UDim2.new(1, -370, 0, targetY),
                "Out",
                "Quad",
                0.3,
                true
            )
        end
    end
end

function ScriptHubUltimate:PlayNotificationSound(type)
    if self.NotificationSystem.Sounds[type] then
        local sound = Instance.new("Sound")
        sound.SoundId = self.NotificationSystem.Sounds[type]
        sound.Volume = 0.5
        sound.Parent = SoundService
        sound:Play()
        
        sound.Ended:Connect(function()
            sound:Destroy()
        end)
    end
end

-- Sistema de janelas principal
function ScriptHubUltimate:CreateWindow(config)
    local Window = {}
    Window.Tabs = {}
    Window.Title = config.Title or "Script Hub Ultimate"
    Window.Icon = config.Icon or (Icons and Icons.assets and Icons.assets["lucide-home"]) or ""
    Window.Size = config.Size or UDim2.new(0, 800, 0, 600)
    Window.Position = config.Position or UDim2.new(0.5, -400, 0.5, -300)
    Window.MinSize = config.MinSize or UDim2.new(0, 400, 0, 300)
    Window.Resizable = config.Resizable ~= false
    Window.Draggable = config.Draggable ~= false
    Window.CloseCallback = config.CloseCallback
    
    local theme = self.Themes[self.Config.UI.Theme]
    
    -- Criar ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ScriptHubUltimate_" .. HttpService:GenerateGUID(false)
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = PlayerGui
    
    -- Frame principal
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = Window.Size
    mainFrame.Position = Window.Position
    mainFrame.BackgroundColor3 = theme.Primary
    mainFrame.BorderSizePixel = 0
    mainFrame.ClipsDescendants = true
    mainFrame.Parent = screenGui
    
    -- Cantos arredondados
    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, self.Config.UI.CornerRadius)
    mainCorner.Parent = mainFrame
    
    -- Sombra
    if self.Config.UI.DropShadows then
        local shadow = Instance.new("Frame")
        shadow.Name = "Shadow"
        shadow.Size = UDim2.new(1, 20, 1, 20)
        shadow.Position = UDim2.new(0, -10, 0, -10)
        shadow.BackgroundColor3 = theme.Shadow
        shadow.BackgroundTransparency = 0.7
        shadow.BorderSizePixel = 0
        shadow.ZIndex = mainFrame.ZIndex - 1
        shadow.Parent = mainFrame
        
        local shadowCorner = Instance.new("UICorner")
        shadowCorner.CornerRadius = UDim.new(0, self.Config.UI.CornerRadius + 10)
        shadowCorner.Parent = shadow
    end
    
    -- Gradiente de fundo
    if self.Config.UI.GradientBackgrounds then
        local gradient = Instance.new("UIGradient")
        gradient.Color = ColorSequence.new(theme.Gradient)
        gradient.Rotation = 45
        gradient.Parent = mainFrame
    end
    
    -- Barra de título
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 50)
    titleBar.BackgroundColor3 = theme.Accent
    titleBar.BorderSizePixel = 0
    titleBar.Parent = mainFrame
    
    local titleBarCorner = Instance.new("UICorner")
    titleBarCorner.CornerRadius = UDim.new(0, self.Config.UI.CornerRadius)
    titleBarCorner.Parent = titleBar
    
    -- Ícone da janela
    local windowIcon = Instance.new("ImageLabel")
    windowIcon.Name = "WindowIcon"
    windowIcon.Size = UDim2.new(0, 24, 0, 24)
    windowIcon.Position = UDim2.new(0, 15, 0, 13)
    windowIcon.BackgroundTransparency = 1
    windowIcon.Image = Window.Icon
    windowIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
    windowIcon.Parent = titleBar
    
    -- Título da janela
    local windowTitle = Instance.new("TextLabel")
    windowTitle.Name = "WindowTitle"
    windowTitle.Size = UDim2.new(1, -200, 0, 25)
    windowTitle.Position = UDim2.new(0, 50, 0, 8)
    windowTitle.BackgroundTransparency = 1
    windowTitle.Text = Window.Title
    windowTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    windowTitle.TextSize = 16
    windowTitle.Font = self.Config.UI.CustomFont
    windowTitle.TextXAlignment = Enum.TextXAlignment.Left
    windowTitle.TextYAlignment = Enum.TextYAlignment.Center
    windowTitle.Parent = titleBar
    
    -- Subtítulo
    local windowSubtitle = Instance.new("TextLabel")
    windowSubtitle.Name = "WindowSubtitle"
    windowSubtitle.Size = UDim2.new(1, -200, 0, 15)
    windowSubtitle.Position = UDim2.new(0, 50, 0, 25)
    windowSubtitle.BackgroundTransparency = 1
    windowSubtitle.Text = "v" .. self.Version .. " - " .. self.Author
    windowSubtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
    windowSubtitle.TextSize = 12
    windowSubtitle.Font = Enum.Font.Gotham
    windowSubtitle.TextXAlignment = Enum.TextXAlignment.Left
    windowSubtitle.TextYAlignment = Enum.TextYAlignment.Center
    windowSubtitle.Parent = titleBar
    
    -- Botões da barra de título
    local buttonSize = UDim2.new(0, 30, 0, 30)
    
    -- Botão minimizar
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Name = "MinimizeButton"
    minimizeButton.Size = buttonSize
    minimizeButton.Position = UDim2.new(1, -100, 0, 10)
    minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 193, 7)
    minimizeButton.Text = ""
    minimizeButton.Parent = titleBar
    
    local minimizeIcon = Instance.new("ImageLabel")
    minimizeIcon.Size = UDim2.new(0, 16, 0, 16)
    minimizeIcon.Position = UDim2.new(0.5, -8, 0.5, -8)
    minimizeIcon.BackgroundTransparency = 1
    minimizeIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
    minimizeIcon.Parent = minimizeButton
    
    if Icons and Icons.assets then
        minimizeIcon.Image = Icons.assets["lucide-minus"] or ""
    end
    
    local minimizeCorner = Instance.new("UICorner")
    minimizeCorner.CornerRadius = UDim.new(0, 15)
    minimizeCorner.Parent = minimizeButton
    
    -- Botão fechar
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "CloseButton"
    closeButton.Size = buttonSize
    closeButton.Position = UDim2.new(1, -40, 0, 10)
    closeButton.BackgroundColor3 = Color3.fromRGB(220, 53, 69)
    closeButton.Text = ""
    closeButton.Parent = titleBar
    
    local closeIcon = Instance.new("ImageLabel")
    closeIcon.Size = UDim2.new(0, 16, 0, 16)
    closeIcon.Position = UDim2.new(0.5, -8, 0.5, -8)
    closeIcon.BackgroundTransparency = 1
    closeIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
    closeIcon.Parent = closeButton
    
    if Icons and Icons.assets then
        closeIcon.Image = Icons.assets["lucide-x"] or ""
    end
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 15)
    closeCorner.Parent = closeButton
    
    -- Container para abas (sidebar)
    local tabContainer = Instance.new("Frame")
    tabContainer.Name = "TabContainer"
    tabContainer.Size = UDim2.new(0, 200, 1, -60)
    tabContainer.Position = UDim2.new(0, 10, 0, 60)
    tabContainer.BackgroundColor3 = theme.Secondary
    tabContainer.BorderSizePixel = 0
    tabContainer.Parent = mainFrame
    
    local tabContainerCorner = Instance.new("UICorner")
    tabContainerCorner.CornerRadius = UDim.new(0, 8)
    tabContainerCorner.Parent = tabContainer
    
    -- ScrollingFrame para abas
    local tabScrolling = Instance.new("ScrollingFrame")
    tabScrolling.Name = "TabScrolling"
    tabScrolling.Size = UDim2.new(1, -10, 1, -10)
    tabScrolling.Position = UDim2.new(0, 5, 0, 5)
    tabScrolling.BackgroundTransparency = 1
    tabScrolling.BorderSizePixel = 0
    tabScrolling.ScrollBarThickness = 6
    tabScrolling.ScrollBarImageColor3 = theme.Accent
    tabScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabScrolling.Parent = tabContainer
    
    local tabLayout = Instance.new("UIListLayout")
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.Padding = UDim.new(0, 5)
    tabLayout.Parent = tabScrolling
    
    -- Atualizar canvas size automaticamente
    tabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        tabScrolling.CanvasSize = UDim2.new(0, 0, 0, tabLayout.AbsoluteContentSize.Y)
    end)
    
    -- Container para conteúdo das abas
    local contentContainer = Instance.new("Frame")
    contentContainer.Name = "ContentContainer"
    contentContainer.Size = UDim2.new(1, -230, 1, -60)
    contentContainer.Position = UDim2.new(0, 220, 0, 60)
    contentContainer.BackgroundColor3 = theme.Secondary
    contentContainer.BorderSizePixel = 0
    contentContainer.Parent = mainFrame
    
    local contentCorner = Instance.new("UICorner")
    contentCorner.CornerRadius = UDim.new(0, 8)
    contentCorner.Parent = contentContainer
    
    -- Armazenar referências
    Window.ScreenGui = screenGui
    Window.MainFrame = mainFrame
    Window.TitleBar = titleBar
    Window.TabContainer = tabContainer
    Window.TabScrolling = tabScrolling
    Window.ContentContainer = contentContainer
    
    -- Funcionalidades dos botões
    local minimized = false
    local originalSize = Window.Size
    
    minimizeButton.MouseButton1Click:Connect(function()
        minimized = not minimized
        
        if minimized then
            mainFrame:TweenSize(UDim2.new(originalSize.X.Scale, originalSize.X.Offset, 0, 50), "Out", "Quad", self.Config.UI.AnimationSpeed)
            if Icons and Icons.assets then
                minimizeIcon.Image = Icons.assets["lucide-maximize-2"] or ""
            end
        else
            mainFrame:TweenSize(originalSize, "Out", "Quad", self.Config.UI.AnimationSpeed)
            if Icons and Icons.assets then
                minimizeIcon.Image = Icons.assets["lucide-minus"] or ""
            end
        end
    end)
    
    closeButton.MouseButton1Click:Connect(function()
        if Window.CloseCallback then
            Window.CloseCallback()
        end
        screenGui:Destroy()
    end)
    
    -- Tornar draggable
    if Window.Draggable then
        local dragging = false
        local dragStart = nil
        local startPos = nil
        
        titleBar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = mainFrame.Position
                
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                if dragging and dragStart then
                    local delta = input.Position - dragStart
                    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
                end
            end
        end)
    end
    
    -- Função para adicionar abas
    function Window:AddTab(tabConfig)
        local Tab = {}
        Tab.Title = tabConfig.Title or "Tab"
        Tab.Icon = tabConfig.Icon or (Icons and Icons.assets and Icons.assets["lucide-folder"]) or ""
        Tab.Active = false
        
        -- Criar botão da aba
        local tabButton = Instance.new("TextButton")
        tabButton.Name = "TabButton_" .. Tab.Title
        tabButton.Size = UDim2.new(1, -10, 0, 40)
        tabButton.Position = UDim2.new(0, 5, 0, 0)
        tabButton.BackgroundColor3 = theme.Primary
        tabButton.Text = ""
        tabButton.Parent = tabScrolling
        
        local tabButtonCorner = Instance.new("UICorner")
        tabButtonCorner.CornerRadius = UDim.new(0, 6)
        tabButtonCorner.Parent = tabButton
        
        -- Ícone da aba
        local tabIcon = Instance.new("ImageLabel")
        tabIcon.Name = "TabIcon"
        tabIcon.Size = UDim2.new(0, ScriptHubUltimate.Config.UI.IconSize, 0, ScriptHubUltimate.Config.UI.IconSize)
        tabIcon.Position = UDim2.new(0, 10, 0, 10)
        tabIcon.BackgroundTransparency = 1
        tabIcon.Image = Tab.Icon
        tabIcon.ImageColor3 = theme.Text
        tabIcon.Parent = tabButton
        
        -- Título da aba
        local tabTitle = Instance.new("TextLabel")
        tabTitle.Name = "TabTitle"
        tabTitle.Size = UDim2.new(1, -40, 1, 0)
        tabTitle.Position = UDim2.new(0, 35, 0, 0)
        tabTitle.BackgroundTransparency = 1
        tabTitle.Text = Tab.Title
        tabTitle.TextColor3 = theme.Text
        tabTitle.TextSize = 14
        tabTitle.Font = Enum.Font.Gotham
        tabTitle.TextXAlignment = Enum.TextXAlignment.Left
        tabTitle.TextYAlignment = Enum.TextYAlignment.Center
        tabTitle.Parent = tabButton
        
        -- Conteúdo da aba
        local tabContent = Instance.new("ScrollingFrame")
        tabContent.Name = "TabContent_" .. Tab.Title
        tabContent.Size = UDim2.new(1, -20, 1, -20)
        tabContent.Position = UDim2.new(0, 10, 0, 10)
        tabContent.BackgroundTransparency = 1
        tabContent.BorderSizePixel = 0
        tabContent.ScrollBarThickness = 6
        tabContent.ScrollBarImageColor3 = theme.Accent
        tabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        tabContent.Visible = false
        tabContent.Parent = contentContainer
        
        local tabContentLayout = Instance.new("UIListLayout")
        tabContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        tabContentLayout.Padding = UDim.new(0, ScriptHubUltimate.Config.UI.Padding)
        tabContentLayout.Parent = tabContent
        
        -- Atualizar canvas size automaticamente
        tabContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            tabContent.CanvasSize = UDim2.new(0, 0, 0, tabContentLayout.AbsoluteContentSize.Y)
        end)
        
        -- Hover effects
        tabButton.MouseEnter:Connect(function()
            if not Tab.Active then
                tabButton.BackgroundColor3 = theme.Tertiary
            end
        end)
        
        tabButton.MouseLeave:Connect(function()
            if not Tab.Active then
                tabButton.BackgroundColor3 = theme.Primary
            end
        end)
        
        -- Funcionalidade do botão
        tabButton.MouseButton1Click:Connect(function()
            -- Desativar todas as abas
            for _, tab in pairs(self.Tabs) do
                tab.Active = false
                tab.Content.Visible = false
                tab.Button.BackgroundColor3 = theme.Primary
            end
            
            -- Ativar aba atual
            Tab.Active = true
            tabContent.Visible = true
            tabButton.BackgroundColor3 = theme.Accent
            
            -- Efeito de transição
            tabContent.Position = UDim2.new(0, 20, 0, 10)
            tabContent:TweenPosition(UDim2.new(0, 10, 0, 10), "Out", "Quad", 0.2)
        end)
        
        -- Adicionar à lista
        Tab.Button = tabButton
        Tab.Content = tabContent
        table.insert(self.Tabs, Tab)
        
        -- Se for a primeira aba, torná-la ativa
        if #self.Tabs == 1 then
            Tab.Active = true
            tabContent.Visible = true
            tabButton.BackgroundColor3 = theme.Accent
        end
        
        -- Função para adicionar elementos na aba
        function Tab:AddButton(buttonConfig)
            local button = Instance.new("TextButton")
            button.Name = "Button_" .. (buttonConfig.Title or "Button")
            button.Size = UDim2.new(1, 0, 0, ScriptHubUltimate.Config.UI.ButtonHeight)
            button.BackgroundColor3 = theme.Primary
            button.Text = ""
            button.Parent = tabContent
            
            local buttonCorner = Instance.new("UICorner")
            buttonCorner.CornerRadius = UDim.new(0, 6)
            buttonCorner.Parent = button
            
            -- Ícone do botão
            local buttonIcon = Instance.new("ImageLabel")
            buttonIcon.Name = "ButtonIcon"
            buttonIcon.Size = UDim2.new(0, ScriptHubUltimate.Config.UI.IconSize, 0, ScriptHubUltimate.Config.UI.IconSize)
            buttonIcon.Position = UDim2.new(0, 10, 0, (ScriptHubUltimate.Config.UI.ButtonHeight - ScriptHubUltimate.Config.UI.IconSize) / 2)
            buttonIcon.BackgroundTransparency = 1
            buttonIcon.Image = buttonConfig.Icon or (Icons and Icons.assets and Icons.assets["lucide-play"]) or ""
            buttonIcon.ImageColor3 = theme.Text
            buttonIcon.Parent = button
            
            -- Título do botão
            local buttonTitle = Instance.new("TextLabel")
            buttonTitle.Name = "ButtonTitle"
            buttonTitle.Size = UDim2.new(1, -40, 1, 0)
            buttonTitle.Position = UDim2.new(0, 35, 0, 0)
            buttonTitle.BackgroundTransparency = 1
            buttonTitle.Text = buttonConfig.Title or "Button"
            buttonTitle.TextColor3 = theme.Text
            buttonTitle.TextSize = 14
            buttonTitle.Font = Enum.Font.Gotham
            buttonTitle.TextXAlignment = Enum.TextXAlignment.Left
            buttonTitle.TextYAlignment = Enum.TextYAlignment.Center
            buttonTitle.Parent = button
            
            -- Descrição (opcional)
            if buttonConfig.Description then
                local buttonDescription = Instance.new("TextLabel")
                buttonDescription.Name = "ButtonDescription"
                buttonDescription.Size = UDim2.new(1, -40, 0, 15)
                buttonDescription.Position = UDim2.new(0, 35, 0, 20)
                buttonDescription.BackgroundTransparency = 1
                buttonDescription.Text = buttonConfig.Description
                buttonDescription.TextColor3 = theme.TextSecondary
                buttonDescription.TextSize = 12
                buttonDescription.Font = Enum.Font.Gotham
                buttonDescription.TextXAlignment = Enum.TextXAlignment.Left
                buttonDescription.TextYAlignment = Enum.TextYAlignment.Top
                buttonDescription.Parent = button
                
                -- Ajustar tamanho do botão
                button.Size = UDim2.new(1, 0, 0, ScriptHubUltimate.Config.UI.ButtonHeight + 15)
            end
            
            -- Hover effects
            button.MouseEnter:Connect(function()
                button:TweenSize(UDim2.new(1, 0, 0, button.Size.Y.Offset + 5), "Out", "Quad", 0.2)
                button.BackgroundColor3 = theme.Accent
                
                if ScriptHubUltimate.Config.UI.GlowEffects then
                    local glow = Instance.new("Frame")
                    glow.Name = "HoverGlow"
                    glow.Size = UDim2.new(1, 4, 1, 4)
                    glow.Position = UDim2.new(0, -2, 0, -2)
                    glow.BackgroundColor3 = theme.Accent
                    glow.BackgroundTransparency = 0.8
                    glow.BorderSizePixel = 0
                    glow.ZIndex = button.ZIndex - 1
                    glow.Parent = button
                    
                    local glowCorner = Instance.new("UICorner")
                    glowCorner.CornerRadius = UDim.new(0, 8)
                    glowCorner.Parent = glow
                end
            end)
            
            button.MouseLeave:Connect(function()
                button:TweenSize(UDim2.new(1, 0, 0, button.Size.Y.Offset - 5), "Out", "Quad", 0.2)
                button.BackgroundColor3 = theme.Primary
                
                local glow = button:FindFirstChild("HoverGlow")
                if glow then
                    glow:Destroy()
                end
            end)
            
            -- Click handler
            button.MouseButton1Click:Connect(function()
                -- Efeito de clique
                button:TweenSize(UDim2.new(1, 0, 0, button.Size.Y.Offset - 3), "Out", "Quad", 0.1)
                wait(0.1)
                button:TweenSize(UDim2.new(1, 0, 0, button.Size.Y.Offset + 3), "Out", "Quad", 0.1)
                
                if buttonConfig.Callback then
                    buttonConfig.Callback()
                end
            end)
            
            return button
        end
        
        function Tab:AddToggle(toggleConfig)
            local toggle = Instance.new("Frame")
            toggle.Name = "Toggle_" .. (toggleConfig.Title or "Toggle")
            toggle.Size = UDim2.new(1, 0, 0, ScriptHubUltimate.Config.UI.ButtonHeight)
            toggle.BackgroundColor3 = theme.Primary
            toggle.Parent = tabContent
            
            local toggleCorner = Instance.new("UICorner")
            toggleCorner.CornerRadius = UDim.new(0, 6)
            toggleCorner.Parent = toggle
            
            -- Ícone
            local toggleIcon = Instance.new("ImageLabel")
            toggleIcon.Name = "ToggleIcon"
            toggleIcon.Size = UDim2.new(0, ScriptHubUltimate.Config.UI.IconSize, 0, ScriptHubUltimate.Config.UI.IconSize)
            toggleIcon.Position = UDim2.new(0, 10, 0, (ScriptHubUltimate.Config.UI.ButtonHeight - ScriptHubUltimate.Config.UI.IconSize) / 2)
            toggleIcon.BackgroundTransparency = 1
            toggleIcon.Image = toggleConfig.Icon or (Icons and Icons.assets and Icons.assets["lucide-toggle-left"]) or ""
            toggleIcon.ImageColor3 = theme.Text
            toggleIcon.Parent = toggle
            
            -- Título
            local toggleTitle = Instance.new("TextLabel")
            toggleTitle.Name = "ToggleTitle"
            toggleTitle.Size = UDim2.new(1, -100, 1, 0)
            toggleTitle.Position = UDim2.new(0, 35, 0, 0)
            toggleTitle.BackgroundTransparency = 1
            toggleTitle.Text = toggleConfig.Title or "Toggle"
            toggleTitle.TextColor3 = theme.Text
            toggleTitle.TextSize = 14
            toggleTitle.Font = Enum.Font.Gotham
            toggleTitle.TextXAlignment = Enum.TextXAlignment.Left
            toggleTitle.TextYAlignment = Enum.TextYAlignment.Center
            toggleTitle.Parent = toggle
            
            -- Switch
            local switch = Instance.new("TextButton")
            switch.Name = "Switch"
            switch.Size = UDim2.new(0, 50, 0, 25)
            switch.Position = UDim2.new(1, -60, 0.5, -12.5)
            switch.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            switch.Text = ""
            switch.Parent = toggle
            
            local switchCorner = Instance.new("UICorner")
            switchCorner.CornerRadius = UDim.new(0, 12.5)
            switchCorner.Parent = switch
            
            local indicator = Instance.new("Frame")
            indicator.Name = "Indicator"
            indicator.Size = UDim2.new(0, 21, 0, 21)
            indicator.Position = UDim2.new(0, 2, 0, 2)
            indicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            indicator.Parent = switch
            
            local indicatorCorner = Instance.new("UICorner")
            indicatorCorner.CornerRadius = UDim.new(0, 10.5)
            indicatorCorner.Parent = indicator
            
            local isToggled = toggleConfig.Default or false
            
            -- Atualizar estado inicial
            if isToggled then
                switch.BackgroundColor3 = theme.Success
                indicator.Position = UDim2.new(1, -23, 0, 2)
                if Icons and Icons.assets then
                    toggleIcon.Image = Icons.assets["lucide-toggle-right"] or ""
                end
            end
            
            -- Função para atualizar toggle
            local function updateToggle(state)
                isToggled = state
                
                if isToggled then
                    switch.BackgroundColor3 = theme.Success
                    indicator:TweenPosition(UDim2.new(1, -23, 0, 2), "Out", "Quad", 0.2)
                    if Icons and Icons.assets then
                        toggleIcon.Image = Icons.assets["lucide-toggle-right"] or ""
                    end
                else
                    switch.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
                    indicator:TweenPosition(UDim2.new(0, 2, 0, 2), "Out", "Quad", 0.2)
                    if Icons and Icons.assets then
                        toggleIcon.Image = Icons.assets["lucide-toggle-left"] or ""
                    end
                end
                
                if toggleConfig.Callback then
                    toggleConfig.Callback(isToggled)
                end
            end
            
            -- Click handler
            switch.MouseButton1Click:Connect(function()
                updateToggle(not isToggled)
            end)
            
            -- Hover effects
            switch.MouseEnter:Connect(function()
                switch.BackgroundTransparency = 0.8
            end)
            
            switch.MouseLeave:Connect(function()
                switch.BackgroundTransparency = 0
            end)
            
            -- Retornar função para controle externo
            return {
                Element = toggle,
                SetValue = updateToggle,
                GetValue = function() return isToggled end
            }
        end
        
        function Tab:AddSlider(sliderConfig)
            local slider = Instance.new("Frame")
            slider.Name = "Slider_" .. (sliderConfig.Title or "Slider")
            slider.Size = UDim2.new(1, 0, 0, 60)
            slider.BackgroundColor3 = theme.Primary
            slider.Parent = tabContent
            
            local sliderCorner = Instance.new("UICorner")
            sliderCorner.CornerRadius = UDim.new(0, 6)
            sliderCorner.Parent = slider
            
            -- Ícone
            local sliderIcon = Instance.new("ImageLabel")
            sliderIcon.Name = "SliderIcon"
            sliderIcon.Size = UDim2.new(0, ScriptHubUltimate.Config.UI.IconSize, 0, ScriptHubUltimate.Config.UI.IconSize)
            sliderIcon.Position = UDim2.new(0, 10, 0, 10)
            sliderIcon.BackgroundTransparency = 1
            sliderIcon.Image = sliderConfig.Icon or (Icons and Icons.assets and Icons.assets["lucide-sliders"]) or ""
            sliderIcon.ImageColor3 = theme.Text
            sliderIcon.Parent = slider
            
            -- Título
            local sliderTitle = Instance.new("TextLabel")
            sliderTitle.Name = "SliderTitle"
            sliderTitle.Size = UDim2.new(1, -100, 0, 20)
            sliderTitle.Position = UDim2.new(0, 35, 0, 5)
            sliderTitle.BackgroundTransparency = 1
            sliderTitle.Text = sliderConfig.Title or "Slider"
            sliderTitle.TextColor3 = theme.Text
            sliderTitle.TextSize = 14
            sliderTitle.Font = Enum.Font.Gotham
            sliderTitle.TextXAlignment = Enum.TextXAlignment.Left
            sliderTitle.TextYAlignment = Enum.TextYAlignment.Center
            sliderTitle.Parent = slider
            
            -- Valor atual
            local sliderValue = Instance.new("TextLabel")
            sliderValue.Name = "SliderValue"
            sliderValue.Size = UDim2.new(0, 60, 0, 20)
            sliderValue.Position = UDim2.new(1, -70, 0, 5)
            sliderValue.BackgroundTransparency = 1
            sliderValue.Text = tostring(sliderConfig.Default or sliderConfig.Min or 0)
            sliderValue.TextColor3 = theme.Accent
            sliderValue.TextSize = 14
            sliderValue.Font = Enum.Font.GothamBold
            sliderValue.TextXAlignment = Enum.TextXAlignment.Right
            sliderValue.TextYAlignment = Enum.TextYAlignment.Center
            sliderValue.Parent = slider
            
            -- Track do slider
            local sliderTrack = Instance.new("Frame")
            sliderTrack.Name = "SliderTrack"
            sliderTrack.Size = UDim2.new(1, -20, 0, 6)
            sliderTrack.Position = UDim2.new(0, 10, 0, 35)
            sliderTrack.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            sliderTrack.Parent = slider
            
            local trackCorner = Instance.new("UICorner")
            trackCorner.CornerRadius = UDim.new(0, 3)
            trackCorner.Parent = sliderTrack
            
            -- Fill do slider
            local sliderFill = Instance.new("Frame")
            sliderFill.Name = "SliderFill"
            sliderFill.Size = UDim2.new(0, 0, 1, 0)
            sliderFill.BackgroundColor3 = theme.Accent
            sliderFill.Parent = sliderTrack
            
            local fillCorner = Instance.new("UICorner")
            fillCorner.CornerRadius = UDim.new(0, 3)
            fillCorner.Parent = sliderFill
            
            -- Handle do slider
            local sliderHandle = Instance.new("Frame")
            sliderHandle.Name = "SliderHandle"
            sliderHandle.Size = UDim2.new(0, 16, 0, 16)
            sliderHandle.Position = UDim2.new(0, -8, 0, -5)
            sliderHandle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            sliderHandle.Parent = sliderTrack
            
            local handleCorner = Instance.new("UICorner")
            handleCorner.CornerRadius = UDim.new(0, 8)
            handleCorner.Parent = sliderHandle
            
            -- Configurações do slider
            local minValue = sliderConfig.Min or 0
            local maxValue = sliderConfig.Max or 100
            local currentValue = sliderConfig.Default or minValue
            local dragging = false
            
            -- Função para atualizar slider
            local function updateSlider(value)
                currentValue = math.clamp(value, minValue, maxValue)
                local percentage = (currentValue - minValue) / (maxValue - minValue)
                
                sliderFill:TweenSize(UDim2.new(percentage, 0, 1, 0), "Out", "Quad", 0.1)
                sliderHandle:TweenPosition(UDim2.new(percentage, -8, 0, -5), "Out", "Quad", 0.1)
                
                if sliderConfig.Increment then
                    currentValue = math.floor(currentValue / sliderConfig.Increment) * sliderConfig.Increment
                end
                
                sliderValue.Text = tostring(math.floor(currentValue * 100) / 100)
                
                if sliderConfig.Callback then
                    sliderConfig.Callback(currentValue)
                end
            end
            
            -- Inicializar slider
            updateSlider(currentValue)
            
            -- Input handling
            sliderTrack.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                    
                    local function updateFromInput()
                        local mouse = LocalPlayer:GetMouse()
                        local relativePos = mouse.X - sliderTrack.AbsolutePosition.X
                        local percentage = math.clamp(relativePos / sliderTrack.AbsoluteSize.X, 0, 1)
                        local value = minValue + (percentage * (maxValue - minValue))
                        updateSlider(value)
                    end
                    
                    updateFromInput()
                    
                    local connection
                    connection = LocalPlayer:GetMouse().Move:Connect(function()
                        if dragging then
                            updateFromInput()
                        else
                            connection:Disconnect()
                        end
                    end)
                    
                    input.Changed:Connect(function()
                        if input.UserInputState == Enum.UserInputState.End then
                            dragging = false
                        end
                    end)
                end
            end)
            
            return {
                Element = slider,
                SetValue = updateSlider,
                GetValue = function() return currentValue end
            }
        end
        
        function Tab:AddDropdown(dropdownConfig)
            local dropdown = Instance.new("Frame")
            dropdown.Name = "Dropdown_" .. (dropdownConfig.Title or "Dropdown")
            dropdown.Size = UDim2.new(1, 0, 0, ScriptHubUltimate.Config.UI.ButtonHeight)
            dropdown.BackgroundColor3 = theme.Primary
            dropdown.Parent = tabContent
            
            local dropdownCorner = Instance.new("UICorner")
            dropdownCorner.CornerRadius = UDim.new(0, 6)
            dropdownCorner.Parent = dropdown
            
            -- Ícone
            local dropdownIcon = Instance.new("ImageLabel")
            dropdownIcon.Name = "DropdownIcon"
            dropdownIcon.Size = UDim2.new(0, ScriptHubUltimate.Config.UI.IconSize, 0, ScriptHubUltimate.Config.UI.IconSize)
            dropdownIcon.Position = UDim2.new(0, 10, 0, (ScriptHubUltimate.Config.UI.ButtonHeight - ScriptHubUltimate.Config.UI.IconSize) / 2)
            dropdownIcon.BackgroundTransparency = 1
            dropdownIcon.Image = dropdownConfig.Icon or (Icons and Icons.assets and Icons.assets["lucide-chevron-down"]) or ""
            dropdownIcon.ImageColor3 = theme.Text
            dropdownIcon.Parent = dropdown
            
            -- Botão principal
            local dropdownButton = Instance.new("TextButton")
            dropdownButton.Name = "DropdownButton"
            dropdownButton.Size = UDim2.new(1, 0, 1, 0)
            dropdownButton.BackgroundTransparency = 1
            dropdownButton.Text = (dropdownConfig.Title or "Dropdown") .. ": " .. (dropdownConfig.Default or "Selecionar")
            dropdownButton.TextColor3 = theme.Text
            dropdownButton.TextSize = 14
            dropdownButton.Font = Enum.Font.Gotham
            dropdownButton.TextXAlignment = Enum.TextXAlignment.Left
            dropdownButton.TextYAlignment = Enum.TextYAlignment.Center
            dropdownButton.Parent = dropdown
            
            -- Ajustar posição do texto
            local textPadding = Instance.new("UIPadding")
            textPadding.PaddingLeft = UDim.new(0, 35)
            textPadding.PaddingRight = UDim.new(0, 30)
            textPadding.Parent = dropdownButton
            
            -- Ícone de seta
            local arrowIcon = Instance.new("ImageLabel")
            arrowIcon.Name = "ArrowIcon"
            arrowIcon.Size = UDim2.new(0, 16, 0, 16)
            arrowIcon.Position = UDim2.new(1, -26, 0.5, -8)
            arrowIcon.BackgroundTransparency = 1
            arrowIcon.Image = (Icons and Icons.assets and Icons.assets["lucide-chevron-down"]) or ""
            arrowIcon.ImageColor3 = theme.Text
            arrowIcon.Parent = dropdown
            
            -- Lista de opções
            local optionsList = Instance.new("Frame")
            optionsList.Name = "OptionsList"
            optionsList.Size = UDim2.new(1, 0, 0, 0)
            optionsList.Position = UDim2.new(0, 0, 1, 5)
            optionsList.BackgroundColor3 = theme.Secondary
            optionsList.BorderSizePixel = 0
            optionsList.Visible = false
            optionsList.ZIndex = dropdown.ZIndex + 1
            optionsList.Parent = dropdown
            
            local optionsCorner = Instance.new("UICorner")
            optionsCorner.CornerRadius = UDim.new(0, 6)
            optionsCorner.Parent = optionsList
            
            local optionsLayout = Instance.new("UIListLayout")
            optionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
            optionsLayout.Parent = optionsList
            
            local isOpen = false
            local selectedValue = dropdownConfig.Default
            
            -- Função para toggle dropdown
            local function toggleDropdown()
                isOpen = not isOpen
                
                if isOpen then
                    optionsList.Visible = true
                    optionsList:TweenSize(UDim2.new(1, 0, 0, #dropdownConfig.Options * 30), "Out", "Quad", 0.3)
                    if Icons and Icons.assets then
                        arrowIcon.Image = Icons.assets["lucide-chevron-up"] or ""
                    end
                else
                    optionsList:TweenSize(UDim2.new(1, 0, 0, 0), "Out", "Quad", 0.3)
                    if Icons and Icons.assets then
                        arrowIcon.Image = Icons.assets["lucide-chevron-down"] or ""
                    end
                    spawn(function()
                        wait(0.3)
                        if not isOpen then
                            optionsList.Visible = false
                        end
                    end)
                end
            end
            
            dropdownButton.MouseButton1Click:Connect(toggleDropdown)
            
            -- Criar opções
            for i, option in ipairs(dropdownConfig.Options or {}) do
                local optionButton = Instance.new("TextButton")
                optionButton.Name = "Option_" .. option
                optionButton.Size = UDim2.new(1, 0, 0, 30)
                optionButton.BackgroundColor3 = theme.Primary
                optionButton.Text = option
                optionButton.TextColor3 = theme.Text
                optionButton.TextSize = 14
                optionButton.Font = Enum.Font.Gotham
                optionButton.TextXAlignment = Enum.TextXAlignment.Left
                optionButton.TextYAlignment = Enum.TextYAlignment.Center
                optionButton.Parent = optionsList
                
                local optionPadding = Instance.new("UIPadding")
                optionPadding.PaddingLeft = UDim.new(0, 10)
                optionPadding.Parent = optionButton
                
                local optionCorner = Instance.new("UICorner")
                optionCorner.CornerRadius = UDim.new(0, 4)
                optionCorner.Parent = optionButton
                
                -- Hover effects
                optionButton.MouseEnter:Connect(function()
                    optionButton.BackgroundColor3 = theme.Accent
                end)
                
                optionButton.MouseLeave:Connect(function()
                    optionButton.BackgroundColor3 = theme.Primary
                end)
                
                -- Click handler
                optionButton.MouseButton1Click:Connect(function()
                    selectedValue = option
                    dropdownButton.Text = (dropdownConfig.Title or "Dropdown") .. ": " .. option
                    
                    toggleDropdown()
                    
                    if dropdownConfig.Callback then
                        dropdownConfig.Callback(option)
                    end
                end)
            end
            
            return {
                Element = dropdown,
                SetValue = function(value)
                    selectedValue = value
                    dropdownButton.Text = (dropdownConfig.Title or "Dropdown") .. ": " .. value
                end,
                GetValue = function() return selectedValue end
            }
        end
        
        function Tab:AddTextbox(textboxConfig)
            local textbox = Instance.new("Frame")
            textbox.Name = "Textbox_" .. (textboxConfig.Title or "Textbox")
            textbox.Size = UDim2.new(1, 0, 0, ScriptHubUltimate.Config.UI.ButtonHeight)
            textbox.BackgroundColor3 = theme.Primary
            textbox.Parent = tabContent
            
            local textboxCorner = Instance.new("UICorner")
            textboxCorner.CornerRadius = UDim.new(0, 6)
            textboxCorner.Parent = textbox
            
            -- Ícone
            local textboxIcon = Instance.new("ImageLabel")
            textboxIcon.Name = "TextboxIcon"
            textboxIcon.Size = UDim2.new(0, ScriptHubUltimate.Config.UI.IconSize, 0, ScriptHubUltimate.Config.UI.IconSize)
            textboxIcon.Position = UDim2.new(0, 10, 0, (ScriptHubUltimate.Config.UI.ButtonHeight - ScriptHubUltimate.Config.UI.IconSize) / 2)
            textboxIcon.BackgroundTransparency = 1
            textboxIcon.Image = textboxConfig.Icon or (Icons and Icons.assets and Icons.assets["lucide-edit"]) or ""
            textboxIcon.ImageColor3 = theme.Text
            textboxIcon.Parent = textbox
            
            -- Input do textbox
            local textboxInput = Instance.new("TextBox")
            textboxInput.Name = "TextboxInput"
            textboxInput.Size = UDim2.new(1, -50, 1, -10)
            textboxInput.Position = UDim2.new(0, 40, 0, 5)
            textboxInput.BackgroundTransparency = 1
            textboxInput.Text = textboxConfig.Default or ""
            textboxInput.PlaceholderText = textboxConfig.Placeholder or "Digite aqui..."
            textboxInput.TextColor3 = theme.Text
            textboxInput.PlaceholderColor3 = theme.TextSecondary
            textboxInput.TextSize = 14
            textboxInput.Font = Enum.Font.Gotham
            textboxInput.TextXAlignment = Enum.TextXAlignment.Left
            textboxInput.TextYAlignment = Enum.TextYAlignment.Center
            textboxInput.ClearTextOnFocus = false
            textboxInput.Parent = textbox
            
            -- Eventos
            textboxInput.FocusLost:Connect(function(enterPressed)
                if enterPressed and textboxConfig.Callback then
                    textboxConfig.Callback(textboxInput.Text)
                end
            end)
            
            if textboxConfig.RealtimeCallback then
                textboxInput:GetPropertyChangedSignal("Text"):Connect(function()
                    textboxConfig.RealtimeCallback(textboxInput.Text)
                end)
            end
            
            return {
                Element = textbox,
                SetValue = function(value)
                    textboxInput.Text = value
                end,
                GetValue = function() return textboxInput.Text end
            }
        end
        
        function Tab:AddLabel(labelConfig)
            local label = Instance.new("TextLabel")
            label.Name = "Label_" .. (labelConfig.Text or "Label")
            label.Size = UDim2.new(1, 0, 0, 25)
            label.BackgroundTransparency = 1
            label.Text = labelConfig.Text or "Label"
            label.TextColor3 = theme.Text
            label.TextSize = 14
            label.Font = Enum.Font.Gotham
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.TextYAlignment = Enum.TextYAlignment.Center
            label.Parent = tabContent
            
            local labelPadding = Instance.new("UIPadding")
            labelPadding.PaddingLeft = UDim.new(0, 10)
            labelPadding.Parent = label
            
            return {
                Element = label,
                SetText = function(text)
                    label.Text = text
                end,
                GetText = function() return label.Text end
            }
        end
        
        function Tab:AddSection(sectionConfig)
            local section = Instance.new("Frame")
            section.Name = "Section_" .. (sectionConfig.Title or "Section")
            section.Size = UDim2.new(1, 0, 0, 30)
            section.BackgroundTransparency = 1
            section.Parent = tabContent
            
            local sectionLine = Instance.new("Frame")
            sectionLine.Name = "SectionLine"
            sectionLine.Size = UDim2.new(1, -20, 0, 1)
            sectionLine.Position = UDim2.new(0, 10, 0.5, 0)
            sectionLine.BackgroundColor3 = theme.Border
            sectionLine.Parent = section
            
            local sectionTitle = Instance.new("TextLabel")
            sectionTitle.Name = "SectionTitle"
            sectionTitle.Size = UDim2.new(0, 200, 1, 0)
            sectionTitle.Position = UDim2.new(0.5, -100, 0, 0)
            sectionTitle.BackgroundColor3 = theme.Primary
            sectionTitle.Text = " " .. (sectionConfig.Title or "Section") .. " "
            sectionTitle.TextColor3 = theme.TextSecondary
            sectionTitle.TextSize = 12
            sectionTitle.Font = Enum.Font.GothamBold
            sectionTitle.TextXAlignment = Enum.TextXAlignment.Center
            sectionTitle.TextYAlignment = Enum.TextYAlignment.Center
            sectionTitle.Parent = section
            
            return {
                Element = section,
                SetTitle = function(title)
                    sectionTitle.Text = " " .. title .. " "
                end
            }
        end
        
        return Tab
    end
    
    return Window
end

-- Carregar sistemas de scripts
function ScriptHubUltimate:LoadScripts()
    self.Scripts = {}
    
    -- Carregar scripts dos módulos
    spawn(function()
        self.Scripts.Fly = loadModule("src/modules/scripts/fly.lua")
        self.Scripts.ESP = loadModule("src/modules/scripts/esp.lua")
        self.Scripts.Aimbot = loadModule("src/modules/scripts/aimbot.lua")
        self.Scripts.Teleport = loadModule("src/modules/scripts/teleport.lua")
        self.Scripts.Speed = loadModule("src/modules/scripts/speed.lua")
        self.Scripts.NoClip = loadModule("src/modules/scripts/noclip.lua")
        self.Scripts.InfiniteJump = loadModule("src/modules/scripts/infinite-jump.lua")
        self.Scripts.AutoFarm = loadModule("src/modules/scripts/auto-farm.lua")
        self.Scripts.GodMode = loadModule("src/modules/scripts/god-mode.lua")
    end)
end

-- Funções utilitárias
function ScriptHubUltimate:GetTheme()
    return self.Themes[self.Config.UI.Theme]
end

function ScriptHubUltimate:SetTheme(themeName)
    if self.Themes[themeName] then
        self.Config.UI.Theme = themeName
        self:CreateNotification("Tema", "Tema alterado para " .. themeName, 3, "success")
    end
end

function ScriptHubUltimate:GetIcon(iconName)
    return (Icons and Icons.assets and Icons.assets[iconName]) or ""
end

function ScriptHubUltimate:IsSupported()
    return true -- Sempre true para Roblox
end

function ScriptHubUltimate:GetVersion()
    return self.Version
end

function ScriptHubUltimate:GetRepository()
    return self.Repository
end

-- Inicializar biblioteca
function ScriptHubUltimate:Initialize()
    -- Verificar se já foi inicializada
    if self.Initialized then
        return self
    end
    
    -- Marcar como inicializada
    self.Initialized = true
    
    -- Carregar scripts
    self:LoadScripts()
    
    -- Verificar se os ícones foram carregados
    if not Icons then
        self:CreateNotification("Aviso", "Falha ao carregar ícones do Lucide", 5, "warning")
    end
    
    -- Notificação de sucesso
    self:CreateNotification("Script Hub Ultimate", "Biblioteca carregada com sucesso! v" .. self.Version, 5, "success")
    
    return self
end

-- Retornar biblioteca inicializada
return ScriptHubUltimate:Initialize()
