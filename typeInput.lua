function safeTypeInput(input, text, delay)
    local length = #text
    local i = 1
    
    function typeLetter()
        if i <= length then
            input.Text = input.Text .. text:sub(i, i)
            i = i + 1

            wait(delay)
            typeLetter()
        end
    end
    typeLetter()
end

function typeInput(input, text)
    input.Text = text
end