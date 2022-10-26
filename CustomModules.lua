repeat
    task.wait()
until game:IsLoaded()
repeat
    task.wait()
until shared.GuiLibrary
local GuiLibrary = shared.GuiLibrary
local ScriptSettings = {}
local UIS = game:GetService("UserInputService")
local COB = function(tab, argstable)

end

	inffly = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "Infinite Fly",
		["Function"] = function(callback)
			if callback then
				olddeflate = bedwars["BalloonController"]["deflateBalloon"]
				bedwars["BalloonController"]["deflateBalloon"] = function() end
				flypress = uis.InputBegan:Connect(function(input1)
					if flyupanddown["Enabled"] and bettergetfocus() == nil then
						if input1.KeyCode == Enum.KeyCode.Space or input1.KeyCode == Enum.KeyCode.ButtonA then
							flyup = true
						end
						if input1.KeyCode == Enum.KeyCode.LeftShift or input1.KeyCode == Enum.KeyCode.ButtonL2 then
							flydown = true
						end
					end
				end)
				flyendpress = uis.InputEnded:Connect(function(input1)
					if input1.KeyCode == Enum.KeyCode.Space or input1.KeyCode == Enum.KeyCode.ButtonA then
						flyup = false
					end
					if input1.KeyCode == Enum.KeyCode.LeftShift or input1.KeyCode == Enum.KeyCode.ButtonL2 then
						flydown = false
					end
				end)
				local balloons
				if entity.isAlive and (queueType and (not queueType:find("mega"))) then
					balloons = buyballoons()
				end
				local megacheck = queueType and queueType:find("mega") and true or false
				task.spawn(function()
					repeat task.wait() until queueType ~= "bedwars_test" or (not fly["Enabled"])
					if not fly["Enabled"] then return end
					megacheck = queueType and queueType:find("mega") and true or false
				end)
				local allowed = entity.isAlive and ((lplr.Character:GetAttribute("InflatedBalloons") and lplr.Character:GetAttribute("InflatedBalloons") > 0) or matchState == 2 or megacheck) and 1 or 0
				if flyac["Enabled"] and allowed <= 0 and shared.damageanim and (not balloons) then 
					shared.damageanim()
					bedwars["SoundManager"]:playSound(bedwars["SoundList"]["DAMAGE_"..math.random(1, 3)])
				end
				if flyacprogressbarframe and allowed <= 0 and (not balloons) then 
					flyacprogressbarframe.Visible = true
					flyacprogressbarframe.Frame:TweenSize(UDim2.new(1, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0, true)
				end
				local firsttoggled = true
				RunLoops:BindToHeartbeat("Fly", 1, function(delta) 
					if entity.isAlive and (GuiLibrary["ObjectsThatCanBeSaved"]["Lobby CheckToggle"]["Api"]["Enabled"] == false or matchState ~= 0) then
						allowed = ((lplr.Character:GetAttribute("InflatedBalloons") and lplr.Character:GetAttribute("InflatedBalloons") > 0) or matchState == 2 or megacheck) and 1 or 0
						local mass = (entity.character.HumanoidRootPart:GetMass() - 1.4) * (delta * 100)
						local realflyspeed = flyspeed["Value"]
						mass = mass + (allowed > 0 and 10 or 0) * (flytog and -1 or 1)
						if flytogtick <= tick() then
							flytog = not flytog
							flytogtick = tick() + (allowed > 0 and 0.2 or 0.2)
						end
						if flyacprogressbarframe then
							flyacprogressbarframe.Visible = allowed <= 0
						end
						flyboosting = flyac["Enabled"] and flyspeedboost["Enabled"] and allowed <= 0 
						if flyac["Enabled"] and allowed <= 0 then 
							local newray = getblock(entity.character.HumanoidRootPart.Position + Vector3.new(0, (entity.character.Humanoid.HipHeight * -2) - 1, 0))
							onground = newray and true or false
							if firsttoggled then 
								lastonground = not onground
								firsttoggled = false
							end
							if lastonground ~= onground then 
								if (not onground) then 
									groundtime = tick() + 5
									if flyacprogressbarframe then 
										flyacprogressbarframe.Frame:TweenSize(UDim2.new(0, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, groundtime - tick(), true)
									end
								else
									if flyacprogressbarframe then 
										flyacprogressbarframe.Frame:TweenSize(UDim2.new(1, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0, true)
									end
								end
							end
							if groundtime <= tick() and (not onground) then 
								if fly["Enabled"] then 
									fly["ToggleButton"](false)
								end
							end
							if flyacprogressbarframe then 
								flyacprogressbarframe.TextLabel.Text = math.max(onground and 2.5 or math.floor((groundtime - tick()) * 10) / 10, 0).."s"
							end
							lastonground = onground
							allowed = 1
							if flyspeedboost["Enabled"] then
 								realflyspeed = realflyspeed * getSpeedMultiplier(true)
							end
						else
							onground = true
							lastonground = true
							realflyspeed = realflyspeed * getSpeedMultiplier(true)
						end
						realflyspeed = (flymode["Value"] == "Normal" and allowspeed == false and 20 or realflyspeed) * allowed
						local flypos = entity.character.Humanoid.MoveDirection * (flymode["Value"] == "Normal" and realflyspeed or math.min(realflyspeed, 20 * getSpeedMultiplier()))
						local flypos2 = (entity.character.Humanoid.MoveDirection * math.max((realflyspeed) - 20, 0)) * delta
						entity.character.HumanoidRootPart.Transparency = 1
						entity.character.HumanoidRootPart.Velocity = flypos + (Vector3.new(0, mass + (flyup and flyverticalspeed["Value"] or 0) + (flydown and -flyverticalspeed["Value"] or 0), 0) * allowed)
						if flymode["Value"] == "CFrame" then
							entity.character.HumanoidRootPart.CFrame = entity.character.HumanoidRootPart.CFrame + flypos2
						end
						flyvelo = flypos + Vector3.new(0, mass + (flyup and flyverticalspeed["Value"] or 0) + (flydown and -flyverticalspeed["Value"] or 0), 0)
						
					end
				end)
			else
				flyup = false
				flydown = false
				autobankballoon = false
				waitingforballoon = false
				flypress:Disconnect()
				flyendpress:Disconnect()
				RunLoops:UnbindFromHeartbeat("Fly")
				if flyacprogressbarframe then 
					flyacprogressbarframe.Visible = false
				end
				if flypop["Enabled"] then
					if entity.isAlive and lplr.Character:GetAttribute("InflatedBalloons") then
						for i = 1, lplr.Character:GetAttribute("InflatedBalloons") do
							olddeflate()
						end
					end
				end
				bedwars["BalloonController"]["deflateBalloon"] = olddeflate
				olddeflate = nil
			end
		end,
		["HoverText"] = "A Infinite Fly",
		["ExtraText"] = function() 
			if GuiLibrary["ObjectsThatCanBeSaved"]["Text GUIAlternate TextToggle"]["Api"]["Enabled"] then 
				return alternatelist[table.find(flymode["List"], flymode["Value"])]
			end
			return flymode["Value"] 
		end
	})
	flymode = fly.CreateDropdown({
		["Name"] = "Mode",
		["List"] = {"CFrame", "Normal"},
		["Function"] = function() end
	})
	flyspeed = fly.CreateSlider({
		["Name"] = "RAKESpeed",
		["Min"] = 1,
		["Max"] = 74,
		["Function"] = function(val) end, 
		["Default"] = 74
	})
	flyverticalspeed = fly.CreateSlider({
		["Name"] = "Vertical Speed",
		["Min"] = 1,
		["Max"] = 100,
		["Function"] = function(val) end, 
		["Default"] = 44
	})
	flyupanddown = fly.CreateToggle({
		["Name"] = "Y Level",
		["Function"] = function() end, 
		["Default"] = true
	})
	flypop = fly.CreateToggle({
		["Name"] = "Pop Balloon",
		["Function"] = function() end, 
		["Default"] = true,
		["HoverText"] = "Pops balloons when fly is disabled."
	})
	local oldcamupdate
	local camcontrol
	local flydamagecamera = {["Enabled"] = false}
	flydamageanim = fly.CreateToggle({
		["Name"] = "Damage Animation",
		["Function"] = function(callback) 
			if flydamagecamera["Object"] then 
				flydamagecamera["Object"].Visible = callback
			end
			if callback then 
				task.spawn(function()
					repeat
						task.wait(0.1)
						for i,v in pairs(getconnections(cam:GetPropertyChangedSignal("CameraType"))) do 
							if v.Function then
								camcontrol = debug.getupvalue(v.Function, 1)
							end
						end
					until camcontrol
					local caminput = require(lplr.PlayerScripts.PlayerModule.CameraModule.CameraInput)
					local num = Instance.new("IntValue")
					local numanim
					shared.damageanim = function()
						if numanim then numanim:Cancel() end
						if flydamagecamera["Enabled"] then
							num.Value = 1000
							numanim = game:GetService("TweenService"):Create(num, TweenInfo.new(0.5), {Value = 0})
							numanim:Play()
						end
					end
					oldcamupdate = camcontrol.Update
					camcontrol.Update = function(self, dt) 
						if camcontrol.activeCameraController then
							camcontrol.activeCameraController:UpdateMouseBehavior()
							local newCameraCFrame, newCameraFocus = camcontrol.activeCameraController:Update(dt)
							cam.CFrame = newCameraCFrame * CFrame.Angles(0, 0, math.rad(num.Value / 100))
							cam.Focus = newCameraFocus
							if camcontrol.activeTransparencyController then
								camcontrol.activeTransparencyController:Update(dt)
							end
							if caminput.getInputEnabled() then
								caminput.resetInputForFrameEnd()
							end
						end
					end
				end)
			else
				shared.damageanim = nil
				if camcontrol then 
					camcontrol.Update = oldcamupdate
				end
			end
		end
	})
	flydamagecamera = fly.CreateToggle({
		["Name"] = "Camera Animation",
		["Function"] = function() end,
		["Default"] = true
	})
	flydamagecamera["Object"].BorderSizePixel = 0
	flydamagecamera["Object"].BackgroundTransparency = 0
	flydamagecamera["Object"].BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	flydamagecamera["Object"].Visible = false
	flyac = fly.CreateToggle({
		["Name"] = "Fly Anyway",
		["Function"] = function(callback) 
			if flyspeedboost["Object"] then 
				flyspeedboost["Object"].Visible = callback
			end
			if flyacprogressbar["Object"] then 
				flyacprogressbar["Object"].Visible = callback
			end

		end,
		["HoverText"] = "Enables fly without balloons for 1.4s",
		["Default"] = true
	})
	flyspeedboost = fly.CreateToggle({
		["Name"] = "Boost Speed",
		["Function"] = function() end,
		["HoverText"] = "boosts fly anyway speed",
	})
	flyspeedboost["Object"].BorderSizePixel = 0
	flyspeedboost["Object"].BackgroundTransparency = 0
	flyspeedboost["Object"].BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	flyspeedboost["Object"].Visible = false
	flyacprogressbar = fly.CreateToggle({
		["Name"] = "Progress Bar",
		["Function"] = function(callback) 
			if callback then 
				flyacprogressbarframe = Instance.new("Frame")
				flyacprogressbarframe.AnchorPoint = Vector2.new(0.5, 0)
				flyacprogressbarframe.Position = UDim2.new(0.5, 0, 1, -200)
				flyacprogressbarframe.Size = UDim2.new(0.2, 0, 0, 20)
				flyacprogressbarframe.BackgroundTransparency = 0.5
				flyacprogressbarframe.BorderSizePixel = 0
				flyacprogressbarframe.BackgroundColor3 = Color3.new(0, 0, 0)
				flyacprogressbarframe.Visible = fly["Enabled"]
				flyacprogressbarframe.Parent = GuiLibrary["MainGui"]
				local flyacprogressbarframe2 = flyacprogressbarframe:Clone()
				flyacprogressbarframe2.AnchorPoint = Vector2.new(0, 0)
				flyacprogressbarframe2.Position = UDim2.new(0, 0, 0, 0)
				flyacprogressbarframe2.Size = UDim2.new(1, 0, 0, 20)
				flyacprogressbarframe2.BackgroundTransparency = 0
				flyacprogressbarframe2.Visible = true
				flyacprogressbarframe2.BackgroundColor3 = Color3.new(0.9, 0.9, 0.9)
				flyacprogressbarframe2.Parent = flyacprogressbarframe
				local flyacprogressbartext = Instance.new("TextLabel")
				flyacprogressbartext.Text = "2s"
				flyacprogressbartext.Font = Enum.Font.Gotham
				flyacprogressbartext.TextStrokeTransparency = 0
				flyacprogressbartext.TextColor3 =  Color3.new(0.9, 0.9, 0.9)
				flyacprogressbartext.TextSize = 20
				flyacprogressbartext.Size = UDim2.new(1, 0, 1, 0)
				flyacprogressbartext.BackgroundTransparency = 1
				flyacprogressbartext.Position = UDim2.new(0, 0, -1, 0)
				flyacprogressbartext.Parent = flyacprogressbarframe
			else
				if flyacprogressbarframe then flyacprogressbarframe:Remove() flyacprogressbarframe = nil end
			end
		end,
		["HoverText"] = "show amount of fly time",
		["Default"] = true
	})
	flyacprogressbar["Object"].BorderSizePixel = 0
	flyacprogressbar["Object"].BackgroundTransparency = 0
	flyacprogressbar["Object"].BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	flyacprogressbar["Object"].Visible = false

end()
