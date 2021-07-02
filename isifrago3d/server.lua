local logEnabled = false

RegisterServerEvent('isifrago:mostraradmin')
AddEventHandler('isifrago:mostraradmin', function()
		TriggerClientEvent('isifrago:triggerDisplay')
end)


TriggerEvent('es:addCommand', 'admin2', function(source, args, user)
  		TriggerClientEvent('chatMessage', -1, "admin activado | ")
  		local source = source
  		local xPlayer = ESX.GetPlayerFromId(source)
		local xPlayers = ESX.GetPlayers()		
 	 end, {help = 'Send an out of character message to the whole server.'})

function setLog(text, source)
	local time = os.date("%d/%m/%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local data = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. text

	local content = LoadResourceFile(GetCurrentResourceName(), "log.txt")
	local newContent = content .. '\r\n' .. data
	SaveResourceFile(GetCurrentResourceName(), "log.txt", newContent, -1)
end