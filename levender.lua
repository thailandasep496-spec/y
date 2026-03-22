local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "LEVENDER V2",
   LoadingTitle = "Ambatron Loading...",
   LoadingSubtitle = "by Tuan Nando",
   ConfigurationSaving = {Enabled = true, FolderName = "Levender", FileName = "Config"}
})
local MainTab = Window:CreateTab("Main Menu", 4483362458)
MainTab:CreateToggle({
   Name = "Auto Hatch Eggs",
   CurrentValue = false,
   Flag = "Hatch",
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
Rayfield:Notify({Title = "Loaded!", Content = "Ready, Tuan Nando!", Duration = 5})
