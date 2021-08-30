RMenu.Add('LicenseCentre', 'main', RageUI.CreateMenu("License Centre", "~b~Cloned's License Center", 1350, 50))
RageUI.CreateWhile(1.0, RMenu:Get('LicenseCentre', 'main'), nil, function()
    RageUI.IsVisible(RMenu:Get('LicenseCentre', 'main'), true, false, true, function()
        for i , p in pairs(cfg.licenses.jobs) do 
            RageUI.Button(p.name , nil, { RightLabel = cfg.currency .. tostring(p.priceshow) }, true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent('LicenseCentre:BuyGroup', p.price, i)
                end
            end)
        end
    end, function() end)
end)

local isInMenu = false
Citizen.CreateThread(function() 
    while true do
            local v1 = cfg.coords
            if cfg.marker == true then
                if isInArea(v1, 100.0) then 
                    DrawMarker(2, v1+1 - 0.98, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255, 255, 255, 150, 0, 0, 0, 0, 0, 0, 0)
                end
            end
            if not isInMenu then
                if isInArea(v1, 1.4) then 
                    alert('Press ~INPUT_VEH_HORN~ to access License Centre')
                    if IsControlJustPressed(0, 51) then 
                        currentAmmunition = k
                        RageUI.Visible(RMenu:Get("LicenseCentre", "main"), true)
                        isInMenu = true
                    end
                end

            end
            if isInArea(v1, 1.4) == false and isInMenu and k == currentAmmunition then
                RageUI.Visible(RMenu:Get("LicenseCentre", "main"), false)
                isInMenu = false
            end
        Citizen.Wait(0)
    end
end)



function isInArea(v, dis) 
    return #(GetEntityCoords(PlayerPedId()) - v) <= dis 
end

function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end




