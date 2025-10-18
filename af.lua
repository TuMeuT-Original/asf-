-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local onoff = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local Frame = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local flyfling = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local fly = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
local cheat = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

onoff.Name = "on off"
onoff.Parent = ScreenGui
onoff.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
onoff.BorderColor3 = Color3.fromRGB(0, 0, 0)
onoff.BorderSizePixel = 0
onoff.Position = UDim2.new(0.958459198, 0, 0.0709876567, 0)
onoff.Size = UDim2.new(0.0415407866, 0, 0.0771604925, 0)
onoff.Font = Enum.Font.SourceSans
onoff.Text = ""
onoff.TextColor3 = Color3.fromRGB(0, 0, 0)
onoff.TextSize = 14.000

UICorner.Parent = onoff

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(205, 7, 255)
Frame.BackgroundTransparency = 0.100
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.222054377, 0, 0.219135806, 0)
Frame.Size = UDim2.new(0.555891216, 0, 0.561728418, 0)

UICorner_2.Parent = Frame

flyfling.Name = "flyfling"
flyfling.Parent = Frame
flyfling.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
flyfling.BorderColor3 = Color3.fromRGB(0, 0, 0)
flyfling.BorderSizePixel = 0
flyfling.Position = UDim2.new(0.040760871, 0, 0.082417585, 0)
flyfling.Size = UDim2.new(0.918478251, 0, 0.346153855, 0)
flyfling.Font = Enum.Font.SourceSansBold
flyfling.Text = "Отправлять на гаити всех (включи флай)"
flyfling.TextColor3 = Color3.fromRGB(0, 0, 0)
flyfling.TextScaled = true
flyfling.TextSize = 14.000
flyfling.TextWrapped = true

UICorner_3.Parent = flyfling

UITextSizeConstraint.Parent = flyfling

fly.Name = "fly"
fly.Parent = Frame
fly.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
fly.BorderColor3 = Color3.fromRGB(0, 0, 0)
fly.BorderSizePixel = 0
fly.Position = UDim2.new(0.040760871, 0, 0.464285702, 0)
fly.Size = UDim2.new(0.918478251, 0, 0.346153855, 0)
fly.Font = Enum.Font.SourceSansBold
fly.Text = "Просто летать"
fly.TextColor3 = Color3.fromRGB(0, 0, 0)
fly.TextScaled = true
fly.TextSize = 14.000
fly.TextWrapped = true

UICorner_4.Parent = fly

UITextSizeConstraint_2.Parent = fly

cheat.Name = "cheat"
cheat.Parent = Frame
cheat.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
cheat.BorderColor3 = Color3.fromRGB(0, 0, 0)
cheat.BorderSizePixel = 0
cheat.Position = UDim2.new(0.040760871, 0, 0.835164845, 0)
cheat.Size = UDim2.new(0.918478251, 0, 0.129120886, 0)
cheat.Font = Enum.Font.SourceSansBold
cheat.Text = "Чит на 99 ночей"
cheat.TextColor3 = Color3.fromRGB(0, 0, 0)
cheat.TextScaled = true
cheat.TextSize = 14.000
cheat.TextWrapped = true

UICorner_5.Parent = cheat

UITextSizeConstraint_3.Parent = cheat
UITextSizeConstraint_3.MaxTextSize = 47

-- Fly functionality from script1
local nowe = false
local speeds = 1
local tpwalking = false

-- Fling variables
local flinging = false
local flingDied = nil

-- Flyfling variables
local flyflingEnabled = false
local flyflingDied = nil

-- Random string generator for fling
local function randomString()
    local length = math.random(10, 20)
    local array = {}
    for i = 1, length do
        array[i] = string.char(math.random(32, 126))
    end
    return table.concat(array)
end

-- Get root part function
local function getRoot(character)
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        return humanoid.RootPart or character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
    end
    return nil
end

-- Fly functionality
local function enableFly()
    nowe = true
    
    for i = 1, speeds do
        spawn(function()
            local hb = game:GetService("RunService").Heartbeat	
            tpwalking = true
            local chr = game.Players.LocalPlayer.Character
            local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
            while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                if hum.MoveDirection.Magnitude > 0 then
                    chr:TranslateBy(hum.MoveDirection)
                end
            end
        end)
    end
    
    game.Players.LocalPlayer.Character.Animate.Disabled = true
    local Char = game.Players.LocalPlayer.Character
    local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

    for i,v in next, Hum:GetPlayingAnimationTracks() do
        v:AdjustSpeed(0)
    end
    
    local speaker = game:GetService("Players").LocalPlayer
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
    speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
end

local function disableFly()
    nowe = false
    
    local speaker = game:GetService("Players").LocalPlayer
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
    speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
    speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
    
    game.Players.LocalPlayer.Character.Animate.Disabled = false
    tpwalking = false
end

-- Flyfling functionality
flyfling.MouseButton1Down:Connect(function()
    local speaker = game.Players.LocalPlayer
    
    if flyflingEnabled == false then
        flyflingEnabled = true
        flyfling.Text = "Прекратить"
        
        -- Enable fly
        enableFly()
        
        -- Fling code
        for _, child in pairs(speaker.Character:GetDescendants()) do
            if child:IsA("BasePart") then
                child.CustomPhysicalProperties = PhysicalProperties.new(100, 0.3, 0.5)
            end
        end
        
        wait(.1)
        local bambam = Instance.new("BodyAngularVelocity")
        bambam.Name = randomString()
        bambam.Parent = getRoot(speaker.Character)
        bambam.AngularVelocity = Vector3.new(0,99999,0)
        bambam.MaxTorque = Vector3.new(0,math.huge,0)
        bambam.P = math.huge
        
        local Char = speaker.Character:GetChildren()
        for i, v in next, Char do
            if v:IsA("BasePart") then
                v.CanCollide = false
                v.Massless = true
                v.Velocity = Vector3.new(0, 0, 0)
            end
        end
        
        local function flyflingDiedF()
            flyflingEnabled = false
            if bambam then
                bambam:Destroy()
            end
            if flyflingDied then
                flyflingDied:Disconnect()
            end
            disableFly()
            flyfling.Text = "Летать и отправлять на гаити всех"
        end
        
        flyflingDied = speaker.Character:FindFirstChildOfClass('Humanoid').Died:Connect(flyflingDiedF)
        
        -- Fling loop
        spawn(function()
            repeat
                if bambam and bambam.Parent then
                    bambam.AngularVelocity = Vector3.new(0,99999,0)
                    wait(.2)
                    bambam.AngularVelocity = Vector3.new(0,0,0)
                    wait(.1)
                end
            until flyflingEnabled == false
        end)
    else
        -- Stop flyfling
        flyflingEnabled = false
        flyfling.Text = "Летать и отправлять на гаити всех"
        
        -- Disable fly
        disableFly()
        
        -- Clean up fling
        local root = getRoot(speaker.Character)
        if root then
            for _, v in pairs(root:GetChildren()) do
                if v:IsA("BodyAngularVelocity") then
                    v:Destroy()
                end
            end
        end
        
        if flyflingDied then
            flyflingDied:Disconnect()
            flyflingDied = nil
        end
    end
end)

-- Fly functionality
fly.MouseButton1Down:Connect(function()
    if nowe == true then
        disableFly()
        fly.Text = "Просто летать"
    else 
        enableFly()
        fly.Text = "Прекратить"
    end

    if nowe == true then
        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
            local plr = game.Players.LocalPlayer
            local torso = plr.Character.Torso
            local flying = true
            local deb = true
            local ctrl = {f = 0, b = 0, l = 0, r = 0}
            local lastctrl = {f = 0, b = 0, l = 0, r = 0}
            local maxspeed = 50
            local speed = 0

            local bg = Instance.new("BodyGyro", torso)
            bg.P = 9e4
            bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.cframe = torso.CFrame
            local bv = Instance.new("BodyVelocity", torso)
            bv.velocity = Vector3.new(0,0.1,0)
            bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
            
            if nowe == true then
                plr.Character.Humanoid.PlatformStand = true
            end
            
            while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
                game:GetService("RunService").RenderStepped:Wait()

                if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                    speed = speed+.5+(speed/maxspeed)
                    if speed > maxspeed then
                        speed = maxspeed
                    end
                elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                    speed = speed-1
                    if speed < 0 then
                        speed = 0
                    end
                end
                
                if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                    lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
                elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                else
                    bv.velocity = Vector3.new(0,0,0)
                end
                
                bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
            end
            
            ctrl = {f = 0, b = 0, l = 0, r = 0}
            lastctrl = {f = 0, b = 0, l = 0, r = 0}
            speed = 0
            bg:Destroy()
            bv:Destroy()
            plr.Character.Humanoid.PlatformStand = false
            game.Players.LocalPlayer.Character.Animate.Disabled = false
            tpwalking = false
        else
            local plr = game.Players.LocalPlayer
            local UpperTorso = plr.Character.UpperTorso
            local flying = true
            local deb = true
            local ctrl = {f = 0, b = 0, l = 0, r = 0}
            local lastctrl = {f = 0, b = 0, l = 0, r = 0}
            local maxspeed = 50
            local speed = 0

            local bg = Instance.new("BodyGyro", UpperTorso)
            bg.P = 9e4
            bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.cframe = UpperTorso.CFrame
            local bv = Instance.new("BodyVelocity", UpperTorso)
            bv.velocity = Vector3.new(0,0.1,0)
            bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
            
            if nowe == true then
                plr.Character.Humanoid.PlatformStand = true
            end
            
            while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
                wait()

                if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                    speed = speed+.5+(speed/maxspeed)
                    if speed > maxspeed then
                        speed = maxspeed
                    end
                elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                    speed = speed-1
                    if speed < 0 then
                        speed = 0
                    end
                end
                
                if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                    lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
                elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                else
                    bv.velocity = Vector3.new(0,0,0)
                end

                bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
            end
            
            ctrl = {f = 0, b = 0, l = 0, r = 0}
            lastctrl = {f = 0, b = 0, l = 0, r = 0}
            speed = 0
            bg:Destroy()
            bv:Destroy()
            plr.Character.Humanoid.PlatformStand = false
            game.Players.LocalPlayer.Character.Animate.Disabled = false
            tpwalking = false
        end
    end
end)

cheat.MouseButton1Down:Connect(function()
    cheat:Destroy()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua", true))()
end)

-- Scripts:

local function NWPVRUG_fake_script() -- onoff.LocalScript 
	local script = Instance.new('LocalScript', onoff)

	script.Parent.Parent.Frame.Visible = false
	local en = false
	script.Parent.MouseButton1Down:Connect(function()
		en = not en
		if en then
			script.Parent.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
			script.Parent.Parent.Frame.Visible = true
		else
			script.Parent.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
			script.Parent.Parent.Frame.Visible = false
		end
	end)
end
coroutine.wrap(NWPVRUG_fake_script)()
