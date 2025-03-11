function firebutton(Button, method)
    if not Button then
        warn("firebutton: Botão inválido ou não encontrado.")
        return
    end

    local a = Button
    if getconnections and method == "getconnections" then
        if Button.Activated then
            for i, v in pairs(getconnections(Button.Activated)) do
                wait()
                v.Function()
            end
        else
            warn("firebutton: O botão não tem um evento 'Activated'.")
        end
    elseif firesignal and method == "firesignal" then
        local events = { 'MouseButton1Click', 'MouseButton1Down', 'Activated' }
        for _, v in pairs(events) do
            if Button[v] then
                firesignal(Button[v])
            end
        end
    elseif VirtualInputManager and method == "VirtualInputManager" then
        game:GetService("GuiService").SelectedObject = Button
        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Return, false, game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Return, false, game)
        game:GetService("GuiService").SelectedObject = nil
    else
        print("Unsupported method")
    end
end