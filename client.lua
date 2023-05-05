local gpr = script.Parent

local Players = game:GetService("Players")
local client = Players.LocalPlayer
local mouse = client:GetMouse()

local fire_remote = gpr:WaitForChild("OnShoot")



gpr.Activated:Connect(function()
	fire_remote:FireServer(mouse.Hit.Position)
end)