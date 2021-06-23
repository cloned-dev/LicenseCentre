RMenu.Add('LicenseCentre', 'main', RageUI.CreateMenu("", "License Center", 1350, 50, "licenses", "license"))


RageUI.CreateWhile(1.0, RMenu:Get('LicenseCentre', 'main'), nil, function()


    RageUI.IsVisible(RMenu:Get('LicenseCentre', 'main'), true, false, true, function()

        for i , p in pairs(cfg.licenses.jobs) do 
            RageUI.Button(p.name , nil, { RightLabel = cfg.currency .. tostring(p.price) }, true, function(Hovered, Active, Selected)
                if Selected then

                    TriggerServerEvent('LicenseCentre:BuyGroup', p.price, p.group, p.name)
                    
                end
            end)
        end

    end, function()

    end)
end)

isInMenu = false
Citizen.CreateThread(function() 
    while true do
            local v1 = cfg.coords

            if isInArea(v1, 100.0) then 
                DrawMarker(2, v1+1 - 0.98, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255, 255, 255, 150, 0, 0, 0, 0, 0, 0, 0)
            end

            if isInMenu == false then

                if isInArea(v1, 1.4) then 
                    alert('Press ~INPUT_VEH_HORN~ to access ~b~License Centre')
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
    
    if #(GetEntityCoords(PlayerPedId(-1)) - v) <= dis then  
        return true
    else 
        return false
    end
end

function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end




