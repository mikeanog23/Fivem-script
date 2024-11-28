local name = "packagediphone"

AddEventHandler('ox_inventory:usedItem', function(itemName, slotId, metadata)
    if itemName == name then 
        if lib.progressCircle({
            label = 'Removing the plastic wrap',
            duration = 2000,
            position = 'middle',
            useWhileDead = false,
            canCancel = true,
            disable = { car = true },
            anim = { dict = 'missmechanic', clip = 'work2_base' },
        }) then
            TriggerServerEvent("giveplayer:plasticwrap")

            if lib.progressCircle({
                label = 'Unpacking the phone...',
                duration = 2000,
                position = 'middle',
                useWhileDead = false,
                canCancel = true,
                disable = { car = true },
                anim = { dict = 'missmechanic', clip = 'work2_base' },
            }) then
                TriggerServerEvent("giveplayer:plasticwrap")
                TriggerServerEvent("giveplayer:iphone")
                TriggerServerEvent("giveplayer:phoneearphones")
                TriggerServerEvent("giveplayer:phonecharger")
                TriggerServerEvent("giveplayer:phoneboxtrash")
                TriggerServerEvent("removeitefromplayer:packagediphone")

                Citizen.CreateThread(function()
                    local dumpsterModels = { 'prop_dumpster_01a', 'prop_dumpster_02a' }

                    local dumpsters = GetGamePool('CObject')

                    for _, dumpster in ipairs(dumpsters) do
                        local model = GetEntityModel(dumpster)
                        if model == GetHashKey(dumpsterModels[1]) or model == GetHashKey(dumpsterModels[2]) then
                            local dumpsterCoords = GetEntityCoords(dumpster)
                            
                            
                            exports['ox_target']:addBoxZone({
                                coords = dumpsterCoords,
                                size = vector3(5, 5, 5),
                                options = {
                                    {
                                        name = 'dumpster_interact_phonebox',
                                        event = 'dumpster:openPhoneBox',
                                        icon = 'fas fa-trash',
                                        label = 'Throw away Phone Box',
                                    },
                                },
                                debugPoly = false,
                            })

                        
                            exports['ox_target']:addBoxZone({
                                coords = dumpsterCoords,
                                size = vector3(5, 5, 5),
                                options = {
                                    {
                                        name = 'dumpster_interact_plasticwrap',
                                        event = 'dumpster:openPlasticWrap',
                                        icon = 'fas fa-trash',
                                        label = 'Throw away Plastic Wrap',
                                    },
                                },
                                debugPoly = false,
                            })
                        end
                    end
                end)
            end
        end
    end
end)


RegisterNetEvent('dumpster:openPlasticWrap')
AddEventHandler('dumpster:openPlasticWrap', function()
    if lib.progressCircle({
        label = 'Throwing away the Plastic Wrap',
        duration = 2000,
        position = 'middle',
        useWhileDead = false,
        canCancel = true,
        disable = { car = true },
        anim = { dict = 'missmechanic', clip = 'work2_base' },
    }) then
        TriggerServerEvent("removeitefromplayer:plasticwrap")
        lib.notify({
            title = 'Disposal',
            description = 'You have successfully thrown away the Plastic Wrap',
            type = 'success'
        })
    end
end)
RegisterNetEvent('dumpster:openPhoneBox')
AddEventHandler('dumpster:openPhoneBox', function()
    if lib.progressCircle({
        label = 'Throwing away the Phone Box',
        duration = 2000,
        position = 'middle',
        useWhileDead = false,
        canCancel = true,
        disable = { car = true },
        anim = { dict = 'missmechanic', clip = 'work2_base' },
    }) then
        TriggerServerEvent("removeitefromplayer:phoneboxtrash")
        lib.notify({
            title = 'Disposal',
            description = 'You have successfully thrown away the Phone Box',
            type = 'success'
        })
    end
end)
