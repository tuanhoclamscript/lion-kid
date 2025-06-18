-- Wait for game to load
repeat task.wait() until game:IsLoaded() 
    and game:GetService("Players") 
    and game.Players.LocalPlayer 
    and game.Players.LocalPlayer:FindFirstChild("PlayerGui")

-- Join Marines team
repeat
    task.wait(0.2)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
until game.Players.LocalPlayer.Team

-- Wait for character
repeat task.wait() until game.Players.LocalPlayer.Character

-- Hàm kiểm tra vật phẩm
function HasItem(itemName)
    for _, item in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
        if item.Name == itemName then
            return true
        end
    end
    return false
end

-- Check vật phẩm
local hasValkyrie = HasItem("Valkyrie Helm")
local hasMirror = HasItem("Mirror Fractal")

-- Tự chọn chế độ
if hasValkyrie and hasMirror then
    print("⚔️ Đã phát hiện Valkyrie Helm + Mirror Fractal → Chế độ: Kéo đòn bẩy")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tuanhoclamscript/bnn-kaitun/main/kaitun-sech"))() -- Script farm Pull Lever
elseif hasMirror then
    print("🌀 Đã phát hiện Mirror Fractal → Chế độ: Farm Indra")
    script_key = "fDOSXIPkaemWPpYClKXgKaZvePJhzQQa";
    getgenv().Mode = "rip_indra" -- rip_indra, Dough King, Pull Lever, TOTS, Darkbeard
    getgenv().Team = "Marines"
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/7a64456af124338fdb396f5f677b19d9.lua"))()
else
    print("👑 Không đủ vật phẩm → Chế độ: Farm Dough King")
    script_key = "fDOSXIPkaemWPpYClKXgKaZvePJhzQQa";
    getgenv().Mode = "Dough King" -- rip_indra, Dough King, Pull Lever, TOTS, Darkbeard
    getgenv().Team = "Marines"
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/7a64456af124338fdb396f5f677b19d9.lua"))()
end

while true do
    if game.PlaceId == 7449423635 then -- Zou map ID
        print("Already in Zou, starting farm!")
        break
    end
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    task.wait(5)
end
