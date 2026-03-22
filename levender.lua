local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "LEVENDER V2 | PET SIM 99",
   LoadingTitle = "Ambatron Executing...",
   LoadingSubtitle = "by Tuan Nando",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "LevenderData",
      FileName = "Config"
   }
})

local MainTab = Window:CreateTab("Main Menu", 4483362458) -- Main Icon

local Section = MainTab:CreateSection("Auto Features")

local HatchToggle = MainTab:CreateToggle({
   Name = "Auto Hatch Eggs",
   CurrentValue = false,
   Flag = "AutoHatch",
   Callback = function(Value)
      _G.AutoHatch = Value
      if Value then
          spawn(function()
              while _G.AutoHatch do
                  local args = {
                      [1] = "Spawn", -- Change this to your Egg Area
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
   Content = "Welcome back, Tuan Nando! Ready to hatch?",
   Duration = 5,
   Image = 4483362458,
   Actions = {
      Ignore = {
         Name = "Okay!",
         Callback = function()
            print("User Clicked Okay")
         end
      },
   },
})
