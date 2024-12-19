local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local foundRed = Lighting:FindFirstChild("bald")
local Red
if foundRed and foundRed:IsA("ColorCorrectionEffect") then
    Red = foundRed
else
    Red = Instance.new("ColorCorrectionEffect", Lighting)
end

Red.Name = 'bald'
Red.Enabled = true
Red.Saturation = 0
Red.Contrast = 0
Red.Brightness = 0
Red.TintColor = Color3.fromRGB(255, 255, 255)

function fadeEffect(effect, targetSaturation, targetContrast, targetBrightness, duration)
    num = duration

    -- forgot to use -= instead of += but the effects are nice

    while num ~= 0 and _G.s == true do
        num += 1
        effect.Saturation += 1
        effect.Contrast += 1
        effect.Brightness += 1
        RunService.Heartbeat:Wait()
    end
end

_G.s = _G.s or false
_G.s = not _G.s

print(tostring(_G.s))

if _G.s then
    print("Fading in the effect...")
    fadeEffect(Red, -1, -25582, -1555, 5)
    print('Done!')
else
    print("Fading out the effect...")
    -- fadeEffect(Red, 0, 0, 0, 5)
    Red.Saturation = 0
    Red.Contrast = 0
    Red.Brightness = 0
    print('Done!')
end
