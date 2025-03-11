function tableContent(table)
    if type(table) == "table" then
        for key, value in pairs(table) do
            if type(value) == "table" then
                print("Table at key: " .. tostring(key))
                tableContent(value)
            else
                print("Key: " .. tostring(key) .. " | Value: " .. tostring(value))
            end
        end
    else
        print("Provided value is not a table.")
    end
end

function getRemoteInfo(remote)
    if remote then
        print("Remote Type: " .. remote.ClassName)
        if remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction") then
            print("Remote has no children. Check its properties or methods.")
        else
            for _, child in pairs(remote:GetChildren()) do
                print("Name: " .. child.Name)
                if child:IsA("StringValue") then
                    print("Type: StringValue\nValue: " .. child.Value)
                elseif child:IsA("NumberValue") then
                    print("Type: NumberValue\nValue: " .. child.Value)
                elseif child:IsA("BoolValue") then
                    print("Type: BoolValue\nValue: " .. tostring(child.Value))
                elseif child:IsA("ObjectValue") then
                    print("Type: ObjectValue\nValue: " .. tostring(child.Value))
                else
                    print("Unknown Type: " .. child.ClassName)
                end
            end
        end
    else
        print("Remote is invalid.")
    end
end

--put args of remote here and if dont have only put the path in retorno
            
local retorno = remotePathHere --remote here like game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetPlayerData"):InvokeServer(unpack(args))

if type(retorno) == "table" then
    print("Returned value is a table. Contents:")
    tableContent(retorno)
else
    print("Returned value is not a table.")
end