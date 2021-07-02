AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/godmode" then
		local source = source
		TriggerEvent('es:getPlayerFromId', source, function(user)
			local nombre = user.getIdentifier()
			local esadmin =  MySQL.Sync.fetchScalar("SELECT `group` FROM `users` WHERE identifier = @identifier", { identifier = nombre })
			if esadmin == "superadmin" then 
				CancelEvent()
				TriggerClientEvent('isifrago:godmode',source)
			end
		end)
	end
end)

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/invisible" then
		local source = source
		TriggerEvent('es:getPlayerFromId', source, function(user)
			local player = user.getIdentifier()
			local esadmin = MySQL.Sync.fetchScalar("SELECT `group` FROM `users` WHERE identifier = @identifier", { identifier = player })
			if esadmin == "superadmin" then 
				CancelEvent()
				TriggerClientEvent('isifrago:invisible',source)
			end
		end)
	end
end)


AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/teleport" then
		local source = source
		TriggerEvent('es:getPlayerFromId', source, function(user)
			local nombre = user.getIdentifier()
			local esadmin2 =  MySQL.Sync.fetchScalar("SELECT `group` FROM `users` WHERE identifier = @identifier", { identifier = nombre })
			if esadmin2 == "admin" then 
				CancelEvent()
				TriggerClientEvent('inv:teleport',source)
			end
		end)
	end
end)
