
local color = {r = 37, g = 175, b = 134, alpha = 255} -- Color of the text 
local font = 0 -- Font of the text
local color = {r = 37, g = 175, b = 134, alpha = 255} -- Color of the text 
local font = 0 -- Font of the text
local time = 500 -- Duration of the display of the text : 500 ~= 13sec

RegisterCommand('admin2', function()
    DrawText3D(coords['x'], coords['y'], coords['z']+1, "ADMIN")
end)

RegisterNetEvent('isifrago:triggerDisplay')
AddEventHandler('isifrago:triggerDisplay', function()
    Display()
end)

function Display()
    DrawText3D(coords['x'], coords['y'], coords['z']+1, "ADMIN")

end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y = World3dToScreen2d(x,y,z)
    local px,py,pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextColour(color.r, color.g, color.b, color.alpha)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString("ADMIN")
        EndTextCommandDisplayText(_x, _y)
    end
end