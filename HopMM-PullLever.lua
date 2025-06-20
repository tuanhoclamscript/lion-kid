-- Chờ game load xong
repeat task.wait() until game:IsLoaded() 
    and game:GetService("Players") 
    and game.Players.LocalPlayer 
    and game.Players.LocalPlayer:FindFirstChild("PlayerGui")

-- Chọn team
repeat
    task.wait(0.2)
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("SetTeam", "Marines") -- Hoặc "Pirates"
until game.Players.LocalPlayer.Team

-- Hàm kiểm tra item trong inventory
function CheckItemInventory(itemName)
    for _,v in pairs(game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("getInventory")) do
        if v.Name == itemName then
            return true
        end
    end
    return false
end

-- Chờ nhân vật spawn
repeat task.wait() until game.Players.LocalPlayer.Character

-- Debug: In toàn bộ inventory
print("===== INVENTORY CHECK =====")
for _,v in pairs(game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("getInventory")) do
    print(v.Name)
end

-- Xác định vật phẩm
local hasValkyrieHelm = CheckItemInventory("Valkyrie Helm")
local hasMirrorFractal = CheckItemInventory("Mirror Fractal") -- Kiểm tra chính tả tên item

-- Debug: Kiểm tra vật phẩm
print("Valkyrie Helm:", hasValkyrieHelm)
print("Mirror Fractal:", hasMirrorFractal)

-- Logic chọn chế độ
if hasValkyrieHelm and hasMirrorFractal then
    getgenv().Mode = "Pull Lever"
    print("Đã chọn chế độ: Pull Lever (Có cả Valkyrie Helm và Mirror Fractal)")
elseif hasMirrorFractal then
    getgenv().Mode = "rip_indra"
    print("Đã chọn chế độ: rip_indra (Có Mirror Fractal)")
else
    getgenv().Mode = "Dough King"
    print("Đã chọn chế độ: Dough King (Thiếu vật phẩm)")
end

-- Khởi chạy script
getgenv().NKey = "sxionax_nSLWrsdJBux2jHywR"
getgenv().NScript = "LionHubHopBoss"
getgenv().Team = "Marines"
repeat task.wait() until game:GetService("Players") and game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("PlayerGui")
loadstring(game:HttpGet("https://raw.githubusercontent.com/Wraith1vs11/Rejoin/refs/heads/main/UGPhone's%20Scripts"))()
-- Tự động di chuyển tới Zou nếu chưa ở đó
while true do
    if game.PlaceId == 7449423635 then -- ID map Zou
        print("Đã ở Zou, bắt đầu farm!")
        break
    end
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    task.wait(5)
end
