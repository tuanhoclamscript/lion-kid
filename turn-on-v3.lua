-- Chờ game load xong
repeat task.wait() until game:IsLoaded()

-- Chờ đến khi có nhân vật
repeat task.wait() until game.Players.LocalPlayer.Character

-- Chỉ chạy khi ở map Zou
if game.PlaceId ~= 7449423635 then
    warn("Không phải map Zou, auto activate sẽ không hoạt động")
    return
end

print("Bắt đầu auto activate ability...")

-- Tạo GUI thông báo
local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
TextLabel.Parent = ScreenGui
TextLabel.Text = "AUTO ACTIVATE ĐANG CHẠY"
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Position = UDim2.new(0.5, -100, 0, 10)
TextLabel.BackgroundTransparency = 0.5
TextLabel.TextColor3 = Color3.new(1, 1, 1)

-- Auto activate chính
while task.wait(3) do
    pcall(function()
        game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
    end)
end
