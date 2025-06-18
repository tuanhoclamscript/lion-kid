local Player = game.Players.LocalPlayer
local V3Cooldown = 30 -- Thời gian chờ giữa các lần bật V3 (giây)

-- Hàm kích hoạt V3
local function ActivateV3()
    -- Kiểm tra nếu nhân vật tồn tại
    if not Player.Character or not Player.Character:FindFirstChild("Humanoid") then
        return
    end
    
    -- Giả lập nhấn phím T
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
    task.wait(0.1)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, "T", false, game)
    
    print("Đã kích hoạt V3 - " .. os.date("%X"))
end

-- Vòng lặp chính
while task.wait(V3Cooldown) do
    -- Kiểm tra nếu đang trong game và có V3
    if not Player or not Player:GetAttribute("V3Enabled") then
        continue
    end
    
    -- Chỉ kích hoạt nếu không ở trạng thái V3
    if not Player.Character:FindFirstChild("RaceTransformed") then
        ActivateV3()
    else
        print("V3 đang được duy trì, không cần kích hoạt - " .. os.date("%X"))
    end
end
