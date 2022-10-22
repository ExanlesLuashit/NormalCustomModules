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

InfiniteJump = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "Infinite Jump",
    ["Function"] = function(callback)
        local InfiniteJumpEnabled = true
        game:GetService("UserInputService").JumpRequest:connect(function()
            if InfiniteJumpEnabled then
                game:GetService "Players".LocalPlayer.Character:FindFirstChildOfClass 'Humanoid':ChangeState("Jumping")
            end
        end)
    end,
    ["HoverText"] = "Makes you infinite jump"
})




BetterAntiVoid = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
		["Name"] = "Betterantivoid",
		["HoverText"] = "A better Antivoid",
		["Function"] = function(callback)
			if callback then
				local Antivoid2 = Instance.new("Part",game.workspace)
				Antivoid2.Size = Vector3.new(3000,50,3000)
				Antivoid2.Anchored = true
				Antivoid2.CanCollide = true
				Antivoid2.Position = Vector3.new(0, ylevel, 0)
				Antivoid2.Name = "Antivoid2"
			else
				game:GetService("Workspace").Antivoid2:Destroy()
			end
		end
	})

    Up = BetterAntiVoid.CreateSlider({
		["Name"] = "Up",
		["Min"] = 1,
		["Max"] = 14,
		["HoverText"] = "cool",
		["Function"] = function(val)
			Up = val
		 end
	})
