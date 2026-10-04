local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

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

    RunService.RenderStepped:Connect(function()
        if character.Parent then
            humanoid.CameraOffset = Vector3.zero
        end
    end)
end

if player.Character then
    monitorar(player.Character)
end

player.CharacterAdded:Connect(monitorar)