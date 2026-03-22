-- LEVENDER V2 Script

-- New ScreenGui Code
local ScreenGui = Instance.new('ScreenGui')
local Frame = Instance.new('Frame')

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 200, 0, 100)
Frame.Position = UDim2.new(0.5, -100, 0.5, -50)
Frame.BackgroundColor3 = Color3.new(1, 0, 0)  -- Red

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild('PlayerGui')

-- Script continues here...