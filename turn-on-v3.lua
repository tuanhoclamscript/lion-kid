while task.wait(30) do
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
    task.wait(0.1)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, "T", false, game)
    print("Đã bật V3 - "..os.date("%X"))
end
