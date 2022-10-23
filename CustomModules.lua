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

local function createwarning(title, text, delay)
    local suc, res = pcall(function()
        local frame = GuiLibrary["CreateNotification"](title, text, delay, "assets/WarningNotification.png")
        frame.Frame.Frame.ImageColor3 = Color3.fromRGB(236, 129, 44)
        return frame
    end)
    return (suc and res)
end

	Sape = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "Sape",
		["Function"] = function(callback)
			if callback then
                createwarning("Sape", "Loading...", 3)
   loadstring(game:HttpGet("https://raw.githubusercontent.com/vodxn/sape/main/Initiate.lua"))()
				
			end
		end,
    ["HoverText"] = "Loads da sape."
})
