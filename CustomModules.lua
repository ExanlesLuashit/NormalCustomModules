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








runcode(function()
    local BedwarsSwords = require(game:GetService("ReplicatedStorage").TS.games.bedwars["bedwars-swords"]).BedwarsSwords
    function hashFunc(vec) 
        return {value = vec}
    end
    local function GetInventory(plr)
        if not plr then 
            return {items = {}, armor = {}}
        end

        local suc, ret = pcall(function() 
            return require(game:GetService("ReplicatedStorage").TS.inventory["inventory-util"]).InventoryUtil.getInventory(plr)
        end)

        if not suc then 
            return {items = {}, armor = {}}
        end

        if plr.Character and plr.Character:FindFirstChild("InventoryFolder") then 
            local invFolder = plr.Character:FindFirstChild("InventoryFolder").Value
            if not invFolder then return ret end
            for i,v in next, ret do 
                for i2, v2 in next, v do 
                    if typeof(v2) == 'table' and v2.itemType then
                        v2.instance = invFolder:FindFirstChild(v2.itemType)
                    end
                end
                if typeof(v) == 'table' and v.itemType then
                    v.instance = invFolder:FindFirstChild(v.itemType)
                end
            end
        end

        return ret
    end
    local function getSword()
        local highest, returning = -9e9, nil
        for i,v in next, GetInventory(lplr).items do 
            local power = table.find(BedwarsSwords, v.itemType)
            if not power then continue end
            if power > highest then 
                returning = v
                highest = power
            end
        end
        return returning
    end
mlaura = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "NewMutliAura",
    ["Function"] = function(callback)
        if callback then
           spawn(function()
            repeat
                task.wait(0.12)
                local nearest = getnearestplayer(Distance["Value"])
                if nearest ~= nil and nearest.Team ~= lplr.Team and isalive(nearest) and nearest.Character:FindFirstChild("Humanoid").Health > 0.1 and isalive(lplr) and lplr.Character:FindFirstChild("Humanoid").Health > 0.1 and not nearest.Character:FindFirstChild("ForceField") then
                    local sword = getSword()
                    spawn(function()
                        local anim = Instance.new("Animation")
                        anim.AnimationId = "rbxassetid://4947108314"
                        local animator = lplr.Character:FindFirstChild("Humanoid"):FindFirstChild("Animator")
                        animator:LoadAnimation(anim):Play()
                        anim:Destroy()
                        bedwars["ViewmodelController"]:playAnimation(15)
                    end)
                    if sword ~= nil then
                        bedwars["SwordController"].lastAttack = game:GetService("Workspace"):GetServerTimeNow() - 0.11
                        HitRemote:SendToServer({
                            ["weapon"] = sword.tool,
                            ["entityInstance"] = nearest.Character,
                            ["validate"] = {
                                ["raycast"] = {
                                    ["cameraPosition"] = hashFunc(cam.CFrame.Position),
                                    ["cursorDirection"] = hashFunc(Ray.new(cam.CFrame.Position, nearest.Character:FindFirstChild("HumanoidRootPart").Position).Unit.Direction)
                                },
                                ["targetPosition"] = hashFunc(nearest.Character:FindFirstChild("HumanoidRootPart").Position),
                                ["selfPosition"] = hashFunc(lplr.Character:FindFirstChild("HumanoidRootPart").Position + ((lplr.Character:FindFirstChild("HumanoidRootPart").Position - nearest.Character:FindFirstChild("HumanoidRootPart").Position).magnitude > 14 and (CFrame.lookAt(lplr.Character:FindFirstChild("HumanoidRootPart").Position, nearest.Character:FindFirstChild("HumanoidRootPart").Position).LookVector * 4) or Vector3.new(0, 0, 0)))
                            },
                            ["chargedAttack"] = {["chargeRatio"] = 0.8}
                        })
                    end
                end
            until not Enabled
        end)
    end
end
})
end)
    ["HoverText"] = "a OP multiaura."
})
