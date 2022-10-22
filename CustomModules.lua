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


        BetterMultiAura = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "BetterMultiAura",
        ["Function"] = function(callback)
            if callback then
                bedwars["PaintRemote"] = getremote(debug.getconstants(KnitClient.Controllers.PaintShotgunController.fire))
                repeat
                    task.wait(0.03)
                    local plrs = GetAllNearestHumanoidToPosition(18.8)
                    for i,plr in pairs(plrs) do
                        local selfpos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                        local newpos = plr.Character.HumanoidRootPart.Position
                        bedwars["ClientHandler"]:Get(bedwars["PaintRemote"]):SendToServer(selfpos, CFrame.lookAt(selfpos, newpos).lookVector)
                    end
                until BetterMultiaura["Enabled"] == false
            end
        end,
    })
end)
