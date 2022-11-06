--credits to thatsnotmatt#2602
getgenv().keytoclick = "Q"
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = keytoclick
tool.Activated:connect(function()
    local vim = game:service("VirtualInputManager")
vim:SendKeyEvent(true, keytoclick, false, game)
end)
tool.Parent = game.Players.LocalPlayer.Backpack
local CC = game:GetService'Workspace'.CurrentCamera
local Plr
local enabled = true
getgenv().Prediction = 0.025
getgenv().AutoPrediction = true
getgenv().Aimpart = "HumanoidRootPart"
getgenv().Prediction = 0.157
-- auto prediction highly recommended...
if getgenv().AutoPrediction == true then
function h()
        while true do wait()
local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        local split = string.split(pingvalue,'(')
        local ping = tonumber(split[1])
        if ping < 140 then 
            getgenv().Predictio = 0.1223333
            elseif ping < 130 then 
            getgenv().Predictio = 0.156692
          elseif ping < 120 then 
            getgenv().Predictio = 0.14376
        elseif ping < 110 then 
            getgenv().Predictio = 0.1455
        elseif ping < 100 then
            getgenv().Predictio = 0.130340
        elseif ping < 90 then
            getgenv().Predictio = 0.136
        elseif ping < 80 then
            getgenv().Predictio = 0.1347
        elseif ping < 70 then
            getgenv().Predictio = 0.119
        elseif ping < 60 then
            getgenv().Predictio = 0.12731
        elseif ping < 50 then
            getgenv().Predictio = 0.127668
        elseif ping < 40 then
            getgenv().Predictio = 0.125
        end
getgenv().Prediction = getgenv().Predictio

end
end

spawn(h)
end
local mouse = game.Players.LocalPlayer:GetMouse()
local placemarker = Instance.new("Part", game.Workspace)
local guimain = Instance.new("Folder", game.CoreGui)

function makemarker(Parent, Adornee, Color, Size, Size2)
    local e = Instance.new("BillboardGui", Parent)
    e.Name = "PP"
    e.Adornee = Adornee
    e.Size = UDim2.new(Size, Size2, Size, Size2)
    e.AlwaysOnTop = true
    local a = Instance.new("Frame", e)
    a.Size = UDim2.new(1, 0, 1, 0)
    a.BackgroundTransparency = 0.4
    a.BackgroundColor3 = Color
    local g = Instance.new("UICorner", a)
    g.CornerRadius = UDim.new(30, 30)
    return(e)
end

local data = game.Players:GetPlayers()
function noob(player)
    local character
    repeat wait() until player.Character
    local handler = makemarker(guimain, player.Character:WaitForChild(Aimpart), Color3.fromRGB(0, 76, 153), 0.0, 0)
    handler.Name = player.Name
    player.CharacterAdded:connect(function(Char) handler.Adornee = Char:WaitForChild(Aimpart) end)
    
	local TextLabel = Instance.new("TextLabel", handler)
	TextLabel.BackgroundTransparency = 1
	TextLabel.Position = UDim2.new(0, 0, 0, -50)
	TextLabel.Size = UDim2.new(0, 100, 0, 100)
	TextLabel.Font = Enum.Font.SourceSansSemibold
	TextLabel.TextSize = 14
	TextLabel.TextColor3 = Color3.new(1, 1, 1)
	TextLabel.TextStrokeTransparency = 0
	TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
	TextLabel.Text = 'Name: '..player.Name
	TextLabel.ZIndex = 10
	
	spawn(function()
        while wait() do
            if player.Character then
                --TextLabel.Text = player.Name.." | Bounty: "..tostring(player:WaitForChild("leaderstats").Wanted.Value).." | "..tostring(math.floor(player.Character:WaitForChild("Humanoid").Health))
            end
        end
	end)
end

for i = 1, #data do
    if data[i] ~= game.Players.LocalPlayer then
        noob(data[i])
    end
end

game.Players.PlayerAdded:connect(function(Player)
    noob(Player)
end)

game.Players.PlayerRemoving:Connect(function(player)
    guimain[player.Name]:Destroy()
end)

spawn(function()
    placemarker.Anchored = true
    placemarker.CanCollide = false
    placemarker.Size = Vector3.new(0.1, 0.1, 0.1)
    placemarker.Transparency = 0
    makemarker(placemarker, placemarker, Color3.fromRGB(255, 255, 255), 0.55, 0)
end)    

mouse.KeyDown:Connect(function(k)
    if k ~= "q" then return end
    if enabled then
        enabled = false
       -- guimain[Plr.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    else
        enabled = true 
        Plr = getClosestPlayerToCursor()
        --guimain[Plr.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end    
end)

function getClosestPlayerToCursor()
    local closestPlayer
    local shortestDistance = math.huge

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("Head") then
            local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
            if magnitude < shortestDistance then
                closestPlayer = v
                shortestDistance = magnitude
            end
        end
    end
   return closestPlayer
end

	game:GetService"RunService".Stepped:connect(function()
		if enabled and Plr.Character and Plr.Character:FindFirstChild(Aimpart) then
			placemarker.CFrame = CFrame.new(Plr.Character[Aimpart].Position+(Plr.Character[Aimpart].Velocity*getgenv().Prediction))
		else
			placemarker.CFrame = CFrame.new(0, 9999, 0)
		end
	end)
if getgenv().Airshot == true then
            if Plr.Character.Humanoid.Jump == true and Player.Character.Humanoid.FloorMaterial == Enum.Material.Air then
                getgenv().Aimpart = "RightFoot"
            else
                Player.Character:WaitForChild("Humanoid").StateChanged:Connect(function(old,new)
                    if new == Enum.HumanoidStateType.Freefall then
                    gettenv().Aimpart = "RightFoot"
                    else
                        getgenv().Aimpart = "HumanoidRootPart"
                    end6
                end)
            end
end

	local mt = getrawmetatable(game)
	local old = mt.__namecall
	setreadonly(mt, false)
	mt.__namecall = newcclosure(function(...)
		local args = {...}
		if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
			args[3] = Plr.Character[Aimpart].Position+(Plr.Character[Aimpart].Velocity*getgenv().Prediction)
			return old(unpack(args))
		end
		return old(...)
	end) 
