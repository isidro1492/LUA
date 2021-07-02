local blips = {
    {title= "Banco Central", colour=75, id=431, x = 255.22, y = 228.13, z = 106.29},
}

local zona = {x = 219, y = 245, z = 106}

function get3DDistance(x1, y1, z1, x2, y2, z2)
    local a = (x1 - x2) * (x1 - x2)
    local b = (y1 - y2) * (y1 - y2)
    local c = (z1 - z2) * (z1 - z2)
    return math.sqrt(a + b + c)
end

function showMessageInformation(message, duree)
    duree = duree or 500
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(message)
    DrawSubtitleTimed(duree, 1)
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	--DisplayHelpTextFromStringLabel(1, 0, 1, -1)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(0)
        local posped = GetEntityCoords(GetPlayerPed(-1))
        if get3DDistance(zona.x,zona.y,zona.z, posped.x, posped.y, posped.z) < 15 then
          DrawMarker(27, zona.x,zona.y,zona.z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,252,255,0, 200, 0, 0, 0, 0)
            if get3DDistance(zona.x,zona.y,zona.z, posped.x, posped.y, posped.z) < 3 then
            	drawTxt(" Pulsa <E> para transformar dinero a dinero negro (5000 a 2500) ",1, 1, 0.45, 0.03, 0.80,255,51,255,255)
            	 if IsControlJustPressed(1,38) then
            	 	TriggerServerEvent('isifrago_comprobar:dinero')
            	 end
            end
        end
    end
end)

            		




RegisterNetEvent('Vendedor:dadineronegro')
AddEventHandler ('Vendedor:dadineronegro',function()
	local ped = GetPlayerPed(-1)
	TriggerEvent('chatMessage', 'SYSTEM', {255,0,0}, "Dinero transformado , vete antes de que te cojan!")  
end)



Citizen.CreateThread(function()
  Citizen.Wait(0)
    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)