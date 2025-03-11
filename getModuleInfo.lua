function printAllIn(tbl, indent)
    indent = indent or 0
    local padding = string.rep("  ", indent)

    for key, value in pairs(tbl) do
        if type(value) == "table" then
            print(padding .. tostring(key) .. " = {")
            printAllIn(value, indent + 1)
            print(padding .. "}")
        else
            print(padding .. tostring(key) .. " = " .. tostring(value))
        end
    end
end

function printModuleInfo(module, method)
    if method == "require" then
        moduleData = require(module)
        print("Info in Module:")
        printAllIn(moduleRequired)
    elseif method == "PackageLoaded" then
        moduleData = package.loaded[module]
        print("Info in Module:")
        printAllIn(moduleRequired)
    elseif method == "debuggetinfo" then
        local info = debug.getinfo(module)
        if info then
            moduleData = info.source
            print("Info in Module:")
            printAllIn(moduleRequired)
        end
    else
        print("method no specific")
    end
end

function getSpecificInfoOfModule(module, method, getinfo)
    local moduleData = nil

    if method == "require" then
        moduleData = require(module)
    elseif method == "PackageLoaded" then
        moduleData = package.loaded[module]
    elseif method == "debuggetinfo" then
        local info = debug.getinfo(module)
        if info then
            moduleData = info.source
        end
    else
        print("method no specific")
    end

    if not moduleData then
        print("Error: Could not retrieve module data!")
        return
    end

    print("Info (" .. getinfo .. ") in Module:")

    for key, value in pairs(moduleData) do
        if getinfo == "function" and type(value) == "function" then
            print(key .. " (function)")
        elseif getinfo == "table" and type(value) == "table" then
            print(key .. " (table)")
        elseif getinfo == "string" and type(value) == "string" then
            print(key .. " = \"" .. value .. "\"")
        elseif getinfo == "number" and type(value) == "number" then
            print(key .. " = " .. value)
        elseif getinfo == "boolean" and type(value) == "boolean" then
            print(key .. " = " .. tostring(value))
        elseif getinfo == "userdata" and type(value) == "userdata" then
            print(key .. " (userdata)")
        elseif getinfo == "thread" and type(value) == "thread" then
            print(key .. " (thread)")
        elseif getinfo == "all" then
            print(key .. " = " .. tostring(value) .. " (" .. type(value) .. ")")
        else
            print("GetInfo no specific")
        end
    end
end