--// Create Box \\
local function Box(child, color, title)
local Adornment = Instance.new("BoxHandleAdornment")
Adornment.Size = child.Size
Adornment.CFrame = CFrame.new(0,0,0)
Adornment.Color3 = color
Adornment.Transparency = 0.6
Adornment.AlwaysOnTop = true
Adornment.ZIndex = 10
Adornment.Adornee = child
Adornment.Name = title
Adornment.Parent = child
end
--// Always ESP \\
SurvivorsESP = workspace.Players.Survivors.DescendantAdded:Connect(function(v)
wait(2.5)
if v:IsA("Model") and v.Parent.Name == "Survivors" then
Box(v.Head, Color3.new(0,1), "Survivors_ESP")
Box(v.Torso, Color3.new(0,1), "Survivors_ESP")
Box(v["Right Arm"], Color3.new(0,1), "Survivors_ESP")
Box(v["Left Arm"], Color3.new(0,1), "Survivors_ESP")
Box(v["Right Leg"], Color3.new(0,1), "Survivors_ESP")
Box(v["Left Leg"], Color3.new(0,1), "Survivors_ESP")
end
end)
KillersESP = workspace.Players.Killers.DescendantAdded:Connect(function(v)
wait(2.5)
if v:IsA("Model") and v.Parent.Name == "Killers" then
Box(v.Head, Color3.new(1), "Killers_ESP")
Box(v.Torso, Color3.new(1), "Killers_ESP")
Box(v["Right Arm"], Color3.new(1), "Killers_ESP")
Box(v["Left Arm"], Color3.new(1), "Killers_ESP")
Box(v["Right Leg"], Color3.new(1), "Killers_ESP")
Box(v["Left Leg"], Color3.new(1), "Killers_ESP")
end
end)
SubspaceTripmineESP = workspace.Map.Ingame.DescendantAdded:Connect(function(v)
wait(2.5)
if v.Name == "SubspaceTripmine" and v then
Box(v.SubspaceBox, Color3.new(1,0,1), "SubspaceTripmine_ESP")
end
end)
ItemsESP = workspace.Map.Ingame.DescendantAdded:Connect(function(v)
wait(2.5)
if v.Name == "Medkit" and v then
Box(v.ItemRoot, Color3.new(1), "Medkit_ESP")
elseif v.Name == "BloxyCola" and v then
Box(v.ItemRoot, Color3.new(1,1), "BloxyCola_ESP")
end
end)
--// Auto Generator \\
task.spawn(function()
while true do
for _,gen in ipairs(workspace.Map.Ingame.Map:GetChildren()) do
if gen.Name == "Generator" then
gen.Remotes.RE:FireServer()
end
end
wait(2)
end
end)
--// Players Setting \\
task.spawn(function()
while true do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame += game.Players.LocalPlayer.Character.Humanoid.MoveDirection * 0.425
game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = true
wait()
end
end)
_G.InfinityStamina = true
local StaminaScript = require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
InfStamina = game:GetService("RunService").RenderStepped:Connect(function()
if not _G.InfinityStamina then
InfStamina:Disconnect()
StaminaScript.StaminaLossDisabled = nil
return
end
StaminaScript.StaminaLossDisabled = function() 
end
end)
game:GetService("RunService").RenderStepped:Connect(function()
workspace.Camera.FieldOfView = 120
end)
--// Lighting \\
_G.Fullbright = true
game:GetService("RunService").RenderStepped:Connect(function()
if _G.Fullbright then
game.Lighting.OutdoorAmbient = Color3.fromRGB(255,255,255)
game.Lighting.Brightness = 1.5
game.Lighting.GlobalShadows = false
else
game.Lighting.OutdoorAmbient = Color3.fromRGB(55,55,55)
game.Lighting.Brightness = 1.5
game.Lighting.GlobalShadows = true
end
end)
_G.NoFog = true
game:GetService("RunService").RenderStepped:Connect(function()
if not game.Lighting:GetAttribute("FogStart") then game.Lighting:SetAttribute("FogStart", game.Lighting.FogStart) end
if not game.Lighting:GetAttribute("FogEnd") then game.Lighting:SetAttribute("FogEnd", game.Lighting.FogEnd) end
game.Lighting.FogStart = _G.NoFog and 0 or game.Lighting:GetAttribute("FogStart")
game.Lighting.FogEnd = _G.NoFog and math.huge or game.Lighting:GetAttribute("FogEnd")
local fog = game.Lighting:FindFirstChildOfClass("Atmosphere")
if fog then
if not fog:GetAttribute("Density") then fog:SetAttribute("Density", fog.Density) end
fog.Density = _G.NoFog and 0 or fog:GetAttribute("Density")
end
end)
