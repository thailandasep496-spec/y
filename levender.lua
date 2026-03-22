
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "LEVENDER V2 | AUTO FARM",
   LoadingTitle = "Ambatron Loading...",
   LoadingSubtitle = "by Tuan Nando",
   ConfigurationSaving = {Enabled = true, FolderName = "Levender", FileName = "Config"}
})

local MainTab = Window:CreateTab("Main Menu", 4483362458)
_G.AutoFarm = false
_G.AutoHatch = false

-- [[ AUTO FARM SECTION ]] --
MainTab:CreateToggle({
   Name = "Auto Farm Coins (Best Area)",
   CurrentValue = false,
   Flag = "FarmToggle",
   Callback = function(Value)
      _G.AutoFarm = Value
      if Value then
          task.spawn(function()
              while _G.AutoFarm do
                  -- Mencari koin/breakables terdekat
                  local breakables = game:GetService("Workspace").__THINGS.Breakables:GetChildren()
                  for _, v in pairs(breakables) do
                      if _G.AutoFarm and v:FindFirstChild("Hitbox") then
                          game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Breakables_PlayerAttackBreakable"):FireServer(v.Name)
                      end
                  end
                  task.wait(0.1)
              end
          end)
      end
   end,
})

-- [[ AUTO HATCH SECTION ]] --
MainTab:CreateToggle({
   Name = "Auto Hatch Eggs",
   CurrentValue = false,
   Flag = "HatchToggle",
   Callback = function(Value)
      _G.AutoHatch = Value
      if Value then
          task.spawn(function()
              while _G.AutoHatch do
                  local args = {"Spawn", 1}
                  game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Eggs_RequestPurchase"):InvokeServer(unpack(args))
                  task.wait(0.1)
              end
          end)
      end
   end,
})

Rayfield:Notify({Title = "Gacor Terus!", Content = "Auto Farm & Hatch Ready, Tuan Nando!", Duration = 5})
