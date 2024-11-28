local function giveItemToPlayer(eventName, itemName, itemCount)
    RegisterServerEvent(eventName)
    AddEventHandler(eventName, function()
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)  

        if xPlayer then
            local playerIdentifier = xPlayer.getIdentifier()
            local playerName = xPlayer.getName() or playerIdentifier 
            

            xPlayer.addInventoryItem(itemName, itemCount)
            print("Added " .. itemCount .. "x " .. itemName .. " to player " .. playerIdentifier)

            
            TriggerEvent('logs:server:MakeLog', itemName, playerName, "Item Given", 
                playerName .. " Received " .. itemCount .. "x " .. itemName .. " From Cheif Beefs Prostitute Script")
        else
            print("Error: Player not found!")
        end
    end)
end


giveItemToPlayer("giveplayer:packagediphone", "packagediphone", 1)
giveItemToPlayer("giveplayer:plasticwrap", "plasticwrap", 1)
giveItemToPlayer("giveplayer:iphone", "iphone", 1)
giveItemToPlayer("giveplayer:phoneearphones", "phoneearphones", 1)
giveItemToPlayer("giveplayer:phonecharger", "phonecharger", 1)
giveItemToPlayer("giveplayer:phoneboxtrash", "phoneboxtrash", 1)
local function removeItemFromPlayer(eventName, itemName, itemCount)
    RegisterServerEvent(eventName)
    AddEventHandler(eventName, function()
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)

        if xPlayer then
            local playerIdentifier = xPlayer.getIdentifier()
            local playerName = xPlayer.getName() or playerIdentifier

            local itemCountOnPlayer = xPlayer.getInventoryItem(itemName).count

            if itemCountOnPlayer >= itemCount then
                xPlayer.removeInventoryItem(itemName, itemCount)
                print("Removed " .. itemCount .. "x " .. itemName .. " from player " .. playerIdentifier)

                TriggerEvent('logs:server:MakeLog', itemName, playerName, "Item Removed", 
                    playerName .. " Removed " .. itemCount .. "x " .. itemName .. "Useing cheif beefs realistic unpackaged phone script.")
            else
                TriggerClientEvent('esx:showNotification', source, "You don't have enough " .. itemName)
                print("Error: Player does not have enough " .. itemName)
            end
        else
            print("Error: Player not found!")
        end
    end)
end
removeItemFromPlayer('removeitefromplayer:packagediphone', 'packagediphone', 1)
removeItemFromPlayer('removeitefromplayer:phoneboxtrash', 'phoneboxtrash', 1)
removeItemFromPlayer('removeitefromplayer:plasticwrap', 'plasticwrap', 1)