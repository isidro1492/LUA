RegisterServerEvent('Vendedor:comprobardinero') 
AddEventHandler('Vendedor:comprobardinero',function(tecla)
	local source = source
	if tecla == "F" then
		local arma = "pistola"
		TriggerClientEvent('Vendedor:DaArmaPistola',source,arma)
		TriggerEvent('es:getPlayerFromId',source, function(user)
		local precio = 2
		if user.getMoney() > precio then
			user.removeMoney(precio)
			TriggerClientEvent('Vendedor:DaArmaPistola',source)
			TriggerClientEvent('chatMessage', source, "", {0, 0, 200}, "^1Toma tu maldita arma^0")
			elseif user.getMoney() == precio then
			user.removeMoney(precio)
      		TriggerClientEvent('Vendedor:DaArmaPistola',source)
      		TriggerClientEvent('chatMessage', source, "", {0, 0, 200}, "^1Has ganado un arma, pero te has quedado sin dinero^0")
      		else
			TriggerClientEvent('chatMessage', source, "", {0, 0, 200}, "^1Usted no tiene suficiente dinero^0")
		end
	end)

	elseif
		tecla == "E" then 
		local arma = "subfusil"
		TriggerClientEvent('Vendedor:DaArmaSubfusil',source,arma)
		TriggerEvent('es:getPlayerFromId',source, function(user)
		local precio = 1
		if user.getMoney() > precio then
			user.removeMoney(precio)
			TriggerClientEvent('Vendedor:DaArmaSubfusil',source)
			TriggerClientEvent('chatMessage', source, "", {0, 0, 200}, "^1Toma tu maldita arma^0")
			elseif user.getMoney() == precio then
			user.removeMoney(precio)
      		TriggerClientEvent('Vendedor:DaArmaSubfusil',source)
      		TriggerClientEvent('chatMessage', source, "", {0, 0, 200}, "^1Has ganado un arma, pero te has quedado sin dinero^0")
      		else
			TriggerClientEvent('chatMessage', source, "", {0, 0, 200}, "^1Usted no tiene suficiente dinero^0")
		end
	end	
end)