-------------------------------------
-- Chat de Reports y Privado Staff --
--           por Jougito           --
-------------------------------------

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/' .. Config.rCommand,  'Manda un reporte al staff', { { name = 'Mensaje', help = 'Mensaje de explicación detallado del reporte' } })
    TriggerEvent('chat:addSuggestion', '/' .. Config.sCommand,  'Manda un mensaje en el chat de staff', { { name = 'Mensaje', help = 'Mensaje que quieres enviar al chat de staff (Solo uso para Staff)' } })
end)

local group = 'user'

RegisterNetEvent('es_admin:setGroup')
AddEventHandler('es_admin:setGroup', function(g)
    print('Grupo establecido: ' .. g)
    group = g
end)

RegisterNetEvent("kc_admin:get_group")
AddEventHandler("kc_admin:get_group", function (server_group)
    print('Grupo establecido: ' .. server_group)
    group = server_group
end)

-- Reportes

RegisterNetEvent('rc:Message')
AddEventHandler('rc:Message', function(uID, uName, args)

    local sId = PlayerId()
    local pId = GetPlayerFromServerId(uID)
    
    if pId == sId then
        TriggerEvent('chat:addMessage', { args = { "[".. Label.Report .."] ".. uName .." (".. uID ..")", "^7".. args .."" }, color = Color.Report })
    elseif group ~= 'user' and pId ~= sId then
        TriggerEvent('chat:addMessage', { args = { "[".. Label.Report .."] ".. uName .." (".. uID ..")", "^7".. args .."" }, color = Color.Report })
    end

end)

-- Radio Staff

RegisterNetEvent('rs:Message')
AddEventHandler('rs:Message', function(uID, uName, args)

    local sId = PlayerId()
    local pId = GetPlayerFromServerId(uID)
    
    if pId == sId then
        TriggerEvent('chat:addMessage', { args = { "[".. Label.Staff .."] ".. uName .." (".. uID ..")", "^7".. args .."" }, color = Color.Staff })
    elseif group ~= 'user' and pId ~= sId then
        TriggerEvent('chat:addMessage', { args = { "[".. Label.Staff .."] ".. uName .." (".. uID ..")", "^7".. args .."" }, color = Color.Staff })
    end

end)
