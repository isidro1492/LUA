ESX = nil
    
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('isifrago_asdasda:doymother')
AddEventHandler('isifrago_asdasda_doymother', function()
	 local ConfigPrice = 5000
	 local total = 2500
	 local _source = source
     local xPlayer = ESX.GetPlayerFromId(_source)
           if xPlayer.get('money') > ConfigPrice then
     	         xPlayer.RemoveMoney('money' , Config.Price)
     	         xPlayer.addAccountMoney('black_money', total)
     	         TriggerClientEvent('Vendedor:dadineronegro',source)
            else
     	    TriggerEvent('chatMessage', 'SYSTEM', {255,0,0}, "No tienes dinero suficiente!")  
           end
end)

