local eresinvisible = false
local tienesgodmode = false

RegisterNetEvent('isifrago:godmode')
AddEventHandler('isifrago:godmode',function()
	if tienesgodmode then
		SetEntityInvincible(GetPlayerPed(-1),false)
		SetNotificationTextEntry("STRING")
		AddTextComponentString("Ya no tienes GODMODE" )
		DrawNotification(false, true)
		tienesgodmode = false
	else
		SetEntityInvincible(GetPlayerPed(-1),true)
		SetNotificationTextEntry("STRING")
		AddTextComponentString("Ahora tienes GODMODE" )
		DrawNotification(false, true)
		tienesgodmode = true
	end
end)

RegisterNetEvent('isifrago:invisible')
AddEventHandler('isifrago:invisible',function()
	if eresinvisible == false then
		SetEntityVisible(GetPlayerPed(-1),false)
		eresinvisible = true
		SetNotificationTextEntry("STRING")
		AddTextComponentString("Ahora eres INVISIBLE" )
		DrawNotification(false, true)
	else
		SetEntityVisible(GetPlayerPed(-1),true)
		eresinvisible = false
		SetNotificationTextEntry("STRING")
		AddTextComponentString("Ahora no eres INVISIBLE" )
		DrawNotification(false, true)
	end

end)

RegisterNetEvent('inv:teleport')
AddEventHandler('inv:teleport',function()
	local player = GetPlayerPed(-1)
	local blip = GetFirstBlipInfoId(8)
	if DoesBlipExist(blip) then
		local coord = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
		SetEntityCoords(player,coord.x,coord.y,coord.z)
		SetNotificationTextEntry("STRING")
		AddTextComponentString("Has hecho teleport a tu posición del mapa" )
		DrawNotification(false, true)
	end
end)