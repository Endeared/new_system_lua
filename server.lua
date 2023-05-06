print("Hello world!")
local gpr = script.Parent
local parent_name = script.Parent.Parent.Parent.Name
local true_origin = workspace:WaitForChild(parent_name)
local false_origin = gpr:WaitForChild("Handle")
local fire_remote = gpr:WaitForChild("OnShoot")

local Workspace = game:GetService("Workspace")

fire_remote.OnServerEvent:Connect(function(player, position)
	-- later
end)