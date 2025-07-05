getgenv().NKey = "sxionax_nSLWrsdJBux2jHywR"
getgenv().NScript = "NexonHubKaitunV4"
getgenv().Setting = {
    Team = "Marines",
    LockTier = {true, 6}, -- true or false and the tier u wanna stop
    WeaponType = "Melee", -- Sword (Use for Training Race or Kill Aura (For Ghoul Race))
    FpsBooster = true,
    MainAccount = {
        "LoganLion41",
        "Epic_Prism24",
        "ISAAC_Panda57",
        "KayleeSlime2010",
        "AidenPlayzAce",
        "KingV0id15",
        "StealthToxic28",
        "Echo_Rock3t2014",
        "Xx_VICT0RIACIRCUITTI"
    },
    AltAccount = {
        "JacksonZachary600",
        "MauveChristie9460"
    },
    KeyAccount = "",   -- put account name in between "" to hop full moon server. Other accounts will hop server with this account
    HopServer = false, -- Hop Full Moon Server
    KickWhenEndFullMoon = false,
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Wraith1vs11/Rejoin/refs/heads/main/UGPhone's%20Scripts"))()
while true do
    if game.PlaceId == 7449423635 then
        break
    end
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    wait(5)
end
