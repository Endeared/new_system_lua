print("Hello world!")
local gpr = script.Parent
local parent_name = script.Parent.Parent.Parent.Name
local true_origin = workspace:WaitForChild(parent_name)
local false_origin = gpr:WaitForChild("Handle")
local fire_remote = gpr:WaitForChild("OnShoot")

local Workspace = game:GetService("Workspace")
local ServerStorage = game:GetService("ServerStorage")

fire_remote.OnServerEvent:Connect(function(player, position)
	local origin = true_origin.Position
	local direction = (position - origin).Unit
	local result = Workspace:Raycast(true_origin.Position, direction*300)
	
	local intersection = result and result.Position or true_origin + direction*300
end)