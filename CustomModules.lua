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
		      createwarning("Sape", "Loaded in 3 Seconds!", 3)
		       Sape["ToggleButton"](false)		
   loadstring(game:HttpGet("https://raw.githubusercontent.com/vodxn/sape/main/MainScript.lua"))()			
				
			end
		end,
    ["HoverText"] = "Loads da sape (turn it on every time u go on roblox)."
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

	TexturePack = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "TexturePack",
		["Function"] = function(callback)
			if callback then
                local obj = game:GetObjects("rbxassetid://11144793662")[1]
                obj.Name = "Part"
                obj.Parent = game:GetService("ReplicatedStorage")
                for i,v in pairs(obj:GetChildren()) do
                    if string.lower(v.Name):find("cross") then
                        for i2,b in pairs(v:GetChildren()) do
                            b:Destroy()
                        end
                    end
                end
                shared.con = game:GetService("ReplicatedStorage").ChildAdded:Connect(function(v)
                    for i,x in pairs(obj:GetChildren()) do
                        x:Clone().Parent = v
                    end
                    shared.con:Disconnect()
                end)
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Ham-135/CometV2/main/Modules/Texture.lua"))()
								
			end
		end,
    ["HoverText"] = "Loads da texturepack (credits goes to CometV2/Astral of course)."
})





	HauntedTheme = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "HauntedTheme",
		["Function"] = function(callback)
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/Asset/?id=12064107"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/Asset/?id=12064152"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/Asset/?id=12064121"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/Asset/?id=12063984"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/Asset/?id=12064115"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/Asset/?ID=12064131"
            game.Lighting.FogColor = Color3.new(236, 88, 241)
            game.Lighting.FogEnd = "200"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0.5, 0, 1)
        else
	    game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/Asset/?id=12064107"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/Asset/?id=12064152"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/Asset/?id=12064121"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/Asset/?id=12063984"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/Asset/?id=12064115"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/Asset/?ID=12064131"
            game.Lighting.FogColor = Color3.new(236, 88, 241)
            game.Lighting.FogEnd = "200"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0.5, 0, 1)
			end
		end,
    ["HoverText"] = "A Haunted sky theme (totally didn't copy lovely config)"
})
