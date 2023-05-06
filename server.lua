local Workspace = game:GetService("Workspace")
local ServerStorage = game:GetService("ServerStorage")

local gpr = script.Parent
local parent_name = script.Parent.Parent.Parent.Name
local player_origin = Workspace:WaitForChild(parent_name)
local true_origin = player_origin.UpperTorso
local false_origin = gpr:WaitForChild("Handle")
local fire_remote = gpr:WaitForChild("OnShoot")

fire_remote.OnServerEvent:Connect(function(player, position)
	local origin = false_origin.Position
	local origin_true = true_origin.Position
	local direction = (position - origin_true).Unit*300
	local result = Workspace:Raycast(origin_true, direction*300)
	
	local intersection = result and result.Position or origin_true + direction
	local distance = (origin_true - intersection).Magnitude
	
	local ray = ServerStorage.ray:Clone()
	ray.Size = Vector3.new(0.1, 0.1, distance)
	ray.CFrame = CFrame.new(origin, intersection)*CFrame.new(0, 0, -distance/2)
	ray.Parent = Workspace
	
	if result then
		local part = result.Instance
		local humanoid = part.Parent:FindFirstChild("Humanoid") or part.Parent.Parent:FindFirstChild("Humanoid")
		
		if humanoid then
			humanoid:TakeDamage(10)
		end
	end
	
	wait(0.10)
	ray:Destroy()
end)