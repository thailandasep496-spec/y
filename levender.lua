local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "LEVENDER V2 | PS99",
   LoadingTitle = "Ambatron Loading...",
   LoadingSubtitle = "by Tuan Nando",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "LevenderData",
      FileName = "Config"
   }
})

local MainTab = Window:CreateTab("Main Menu", 4483362458)
local Section = MainTab:CreateSection("Auto Features")

local HatchToggle = MainTab:CreateToggle({
   Name = "Auto Hatch Eggs",
   CurrentValue = false,
   Flag = "AutoHatch",
   Callback = function(Value)
      _G.AutoHatch = Value
      if Value then
          task.spawn(function()
              while _G.AutoHatch do
                  local args = {
                      [1] = "Spawn",
                      [2] = 1
                  }
                  game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Eggs_RequestPurchase"):InvokeServer(unpack(args))
                  task.wait(0.1)
              end
          end)
      end
   end,
})

Rayfield:Notify({
   Title = "Script Loaded!",
   Content = "Welcome back, Tuan Nando!",
   Duration = 5,
   Image = 4483362458,
})
