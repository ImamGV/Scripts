--// Create Box \\
local function Box(child, color, title)
local Adornment = Instance.new("BoxHandleAdornment")
Adornment.Size = child.Size
Adornment.CFrame = CFrame.new(0,0,0)
Adornment.Color3 = color
Adornment.Transparency = 0.75
Adornment.AlwaysOnTop = true
Adornment.ZIndex = 10
Adornment.Adornee = child
Adornment.Name = title
Adornment.Parent = child
end
--// Create ESP \\
local function SurvivorsESP()
for _,v in ipairs(workspace.Players.Survivors:GetDescendants()) do
if v.Parent.Name == "Survivors" then
Box(v.Head, Color3.new(0,1), "Survivors_ESP")
Box(v.Torso, Color3.new(0,1), "Survivors_ESP")
Box(v["Right Arm"], Color3.new(0,1), "Survivors_ESP")
Box(v["Left Arm"], Color3.new(0,1), "Survivors_ESP")
Box(v["Right Leg"], Color3.new(0,1), "Survivors_ESP")
Box(v["Left Leg"], Color3.new(0,1), "Survivors_ESP")
end
end
end
local function KillersESP()
for _,v in ipairs(workspace.Players.Killers:GetDescendants()) do
if v.Parent.Name == "Killers" then
Box(v.Head, Color3.new(1), "Killers_ESP")
Box(v.Torso, Color3.new(1), "Killers_ESP")
Box(v["Right Arm"], Color3.new(1), "Killers_ESP")
Box(v["Left Arm"], Color3.new(1), "Killers_ESP")
Box(v["Right Leg"], Color3.new(1), "Killers_ESP")
Box(v["Left Leg"], Color3.new(1), "Killers_ESP")
end
end
end
local function SubspaceTripmineESP()
for _,v in ipairs(workspace.Map.Ingame:GetDescendants()) do
if v.Name == "SubspaceTripmine" then
Box(v.SubspaceBox, Color3.new(1,0,1), "SubspaceTripmine_ESP")
end
end
end
local function ItemsESP()
for _,v in ipairs(workspace.Map.Ingame:GetDescendants()) do
if v.Name == "Medkit" then
Box(v.ItemRoot, Color3.new(1,0,1), "Medkit_ESP")
elseif v.Name == "BloxyCola" then
Box(v.ItemRoot, Color3.new(1,1), "BloxyCola_ESP")
end
end
end
--// Start ESP \\
SurvivorsESP()
KillersESP()
SubspaceTripmineESP()
ItemsESP()
--// Always ESP \\
SurvivorsESP = workspace.Players.Survivors.DescendantAdded:Connect(function(v)
wait(2.5)
if v.Parent.Name == "Survivors" then
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
if v.Parent.Name == "Killers" then
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
if v.Name == "SubspaceTripmine" then
Box(v.SubspaceBox, Color3.new(1,0,1), "SubspaceTripmine_ESP")
end
end)
ItemsESP = workspace.Map.Ingame.DescendantAdded:Connect(function(v)
wait(2.5)
if v.Name == "Medkit" then
Box(v.ItemRoot, Color3.new(1), "Medkit_ESP")
elseif v.Name == "BloxyCola" then
Box(v.ItemRoot, Color3.new(1,1), "BloxyCola_ESP")
end
end)
--// Players Setting \\
task.spawn(function()
while true do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame += game.Players.LocalPlayer.Character.Humanoid.MoveDirection * 0.25
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
