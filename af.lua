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
flyfling.Text = "Летать и отправлять на гаити всех"
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
