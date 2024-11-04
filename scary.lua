local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local isLegacyChat = TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService

local Red = Instance.new("ColorCorrectionEffect", Lighting)

function chatMessage(str)
    str = tostring(str)
    if not isLegacyChat then
        TextChatService.TextChannels.RBXGeneral:SendAsync(str)
    else
        ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(str, "All")
    end
end

function randstr(length)
    local a = ''
    for i = 1, length do
        a = a .. utf8.char(math.random(50,2000))
    end
    return a
end

Red.Name = randomString(10)
Red.Enabled = true
Red.Saturation = -1
Red.Contrast = -2558222
Red.Brightness = -1555

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
    while task.wait(0.01) do
        local Character = LocalPlayer.Character
        if Character then
            Character.Humanoid.WalkSpeed = 0
        end
    end
end)

task.spawn(function()
    while task.wait(0.01) do
        local Character = LocalPlayer.Character
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        if Character and Humanoid then
            if Humanoid.UseJumpPower then
                Humanoid.JumpPower = 0
            else
                Humanoid.JumpHeight = 0
            end
        end
    end
end)
