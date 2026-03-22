local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({Name = "LEVENDER V3 | HUGE HUNTER", LoadingTitle = "Ambatron Hunting...", LoadingSubtitle = "by Tuan Nando", ConfigurationSaving = {Enabled = true, FolderName = "Levender"}})
local MainTab = Window:CreateTab("Huge Hunter", 4483362458)
_G.AutoFarm = false
_G.AutoHatch = false

MainTab:CreateToggle({Name = "Huge Hunter Mode (Auto Hatch)", CurrentValue = false, Flag = "Huge", Callback = function(V)
    _G.AutoHatch = V
    if V then task.spawn(function() while _G.AutoHatch do
        pcall(function()
            game:GetService("ReplicatedStorage").Network.Eggs_RequestPurchase:InvokeServer("Spawn", 1)
        end)
        task.wait(0.01)
    end end) end
end})

MainTab:CreateToggle({Name = "Auto Farm Coins", CurrentValue = false, Flag = "Farm", Callback = function(V)
    _G.AutoFarm = V
    if V then task.spawn(function() while _G.AutoFarm do
        pcall(function()
            local b = game:GetService("Workspace").__THINGS.Breakables:GetChildren()
            for _, v in pairs(b) do if _G.AutoFarm and v:FindFirstChild("Hitbox") then 
                game:GetService("ReplicatedStorage").Network.Breakables_PlayerAttackBreakable:FireServer(v.Name) 
            end end
        end)
        task.wait(0.1)
    end end) end
end})

MainTab:CreateButton({Name = "Equip Best Pets", Callback = function()
    game:GetService("ReplicatedStorage").Network.Pets_EquipBest:FireServer()
end})

Rayfield:Notify({Title = "HUNTING START!", Content = "Hoki Berlimpah, Tuan Nando!", Duration = 5})
