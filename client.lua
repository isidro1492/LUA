--[[ECHO POR ISIFRAGO , NO SE PERMITE SU USO SIN PERMISO DEL AUTOR]]--

local blips = {
{title="Traficante de Armas", colour=1, id=489,x = 1156.953125, y = -1546.8549804688, z = 33.843933105469}
}

local coordenate = {x = 1156.953125, y = -1546.8549804688, z = 33.843933105469}

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
  SetTextFont(font)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)--mira el ts y dime vago <3
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x , y)
  end

  RegisterNetEvent('Vendedor:DaArmaPistola')
  AddEventHandler ('Vendedor:DaArmaPistola' , function (arma)
    local ped = GetPlayerPed(-1)
    local Numeroaleatorioarma
    if arma == "pistola" then 
      Numeroaleatorioarma = math.random(1,5)
      if Numeroaleatorioarma == 1 then	
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_pistol"), 100, true)
        TriggerClientEvent('chatMessage', source, "", {0, 0, 200}, "^1Has ganado una weapon_pistol^0")
        elseif Numeroaleatorioarma == 2 then
          GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), 100, true)
          TriggerClientEvent('chatMessage', source, "", {0, 0, 200}, "^1Has ganado una WEAPON_COMBATPISTOL^0")
          elseif Numeroaleatorioarma == 3 then
            GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), 100, true)
            TriggerClientEvent('chatMessage', source, "", {0, 0, 200}, "^1Has ganado una WEAPON_APPISTOL^0")
            elseif Numeroaleatorioarma == 4 then	
              GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), 100, true)
              TriggerClientEvent('chatMessage', source, "", {0, 0, 200}, "^1Has ganado una WEAPON_PISTOL50^0")
              elseif Numeroaleatorioarma == 5 then 
                TriggerClientEvent('chatMessage', source, "", {0, 0, 200}, "^1No te ha tocado nada^0")
              end
            end
            end)

  RegisterNetEvent('Vendedor:DaArmaSubfusil')
  AddEventHandler ('Vendedor:DaArmaSubfusil' , function (arma)
   if arma == "subfusil" then
     local Numeroaleatorioarma
     Numeroaleatorioarma = math.random(1,10)
     if Numeroaleatorioarma == 1 then
      GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), 100, true)         
    end
  end
end   
end)


  Citizen.CreateThread(function()
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

  Citizen.CreateThread(function ()
    while true do
      Citizen.Wait(0)
      DrawMarker(1, coordenate.x,coordenate.y,coordenate.z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,252,255,0, 200, 0, 0, 0, 0)
      if GetDistanceBetweenCoords(coordenate.x,coordenate.y,coordenate.z, GetEntityCoords(GetPlayerPed(-1),true)) < 3 then
       drawTxt("Pulsa <F> para apostar a una pistola! Pulsa <E> para apostar a un subfusil ",2, 1, 0.45, 0.03, 0.80,255,51,255,255)
       if IsControlJustPressed(1,38) then
        local tecla = "E"
        TriggerServerEvent('Vendedor:comprobardinero',tecla)
      end
      if IsControlJustPressed(1,23) then
        local tecla = "F"
        TriggerServerEvent('Vendedor:comprobardinero',tecla)
      end
    end
  end
  end)



