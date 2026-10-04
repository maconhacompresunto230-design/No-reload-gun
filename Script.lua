local Players = game:GetService("Players")
local player = Players.LocalPlayer

local function monitorar(character)
    local humanoid = character:WaitForChild("Humanoid")
    local animator = humanoid:WaitForChild("Animator")

    animator.AnimationPlayed:Connect(function(track)
        local nome = track.Name:lower()

        if nome:find("reload") or nome:find("recarga") then
            track:Stop(0)
        end
    end)

    for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
        local nome = track.Name:lower()

        if nome:find("reload") or nome:find("recarga") then
            track:Stop(0)
        end
    end
end

if player.Character then
    monitorar(player.Character)
end

player.CharacterAdded:Connect(monitorar)
