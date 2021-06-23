local Tunnel = module('vrp', 'lib/Tunnel')
local Proxy = module('vrp', 'lib/Proxy')
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "LicenseCentre")

RegisterServerEvent("LicenseCentre:BuyGroup")
AddEventHandler('LicenseCentre:BuyGroup', function(price, job, name)
    local source = source
    userid = vRP.getUserId({source})
    if vRP.tryPayment({userid, price}) then
        
        vRP.addUserGroup({userid,job})

        vRPclient.notify(source, {"~g~Purchased " .. name .. " License for "..cfg.currency..tostring(price) .. " ❤️"})

        else 
        vRPclient.notify(source, {"~r~Insufficient funds"})
    end
end)





