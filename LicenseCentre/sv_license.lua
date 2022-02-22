local Tunnel = module('vrp', 'lib/Tunnel')
local Proxy = module('vrp', 'lib/Proxy')
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "LicenseCentre")

RegisterServerEvent("LicenseCentre:BuyGroup")
AddEventHandler('LicenseCentre:BuyGroup', function(price, job)
    local source = source
    local user_id = vRP.getUserId({source})
    local group = cfg.licenses.jobs[job]
    local group1 = group.group
    if group then 
        if group.price == price then 
            if vRP.hasGroup({user_id, group1}) then 
                vRPclient.notify(source, {"~r~You have already purchased this license!"})
            else
                if vRP.tryPayment({user_id, price}) then
                    vRP.addUserGroup({user_id,group1})
                    vRPclient.notify(source, {"~g~Purchased " .. group.name .. " License for "..cfg.currency..tostring(price) .. " ❤️"})
                else 
                    vRPclient.notify(source, {"~r~Insufficient funds"})
                end
            end
        else
            -- oh no cheater insert ban logic here.
        end
    end
end)





