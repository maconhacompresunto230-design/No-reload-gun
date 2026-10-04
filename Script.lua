local Players = game:GetService("Players")

local player = Players.LocalPlayer

local function monitorar(character)
    local humanoid = character:WaitForChild("Humanoid")
    local animator = humanoid:WaitForChild("Animator")

    animator.AnimationPlayed:Connect(function(track)
        task.defer(function()
            local nome = (track.Name or ""):lower()
            local id = ""

            if track.Animation then
                id = track.Animation.AnimationId:lower()
            end

            if nome:find("reload")
                or nome:find("recarga")
                or nome:find("reloading")
                or id:find("reload") then
                track:Stop(0)
            end
        end)
    end)
end

if player.Character then
    monitorar(player.Character)
end

player.CharacterAdded:Connect(monitorar)