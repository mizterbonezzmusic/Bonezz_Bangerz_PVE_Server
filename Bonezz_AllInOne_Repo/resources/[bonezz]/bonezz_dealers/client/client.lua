local QBCore = exports['qb-core']:GetCoreObject()
local cfg = BonezzDealers
local tgt = exports['qb-target']

local function createBlip(data)
    local blip = AddBlipForCoord(data.coords.x, data.coords.y, data.coords.z)
    SetBlipSprite(blip, (data.blip and data.blip.sprite) or 140)
    SetBlipScale(blip, (data.blip and data.blip.scale) or 0.8)
    SetBlipColour(blip, (data.blip and data.blip.color) or 2)
    SetBlipDisplay(blip, (data.blip and data.blip.display) or 4)
    SetBlipAsShortRange(blip, (data.blip and data.blip.shortRange) == true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(data.label or 'Dealer')
    EndTextCommandSetBlipName(blip)
end

CreateThread(function()
    if cfg.SOTW then createBlip(cfg.SOTW) end
    for i, d in ipairs(cfg.Street or {}) do
        createBlip({label='Street Dealer', coords=d.coords, blip={sprite=501,color=1,scale=0.7,display=4,shortRange=false}})
        tgt:AddBoxZone(('bonezz_dealer_%s'):format(i), d.coords, 1.5, 1.5, {name=('bonezz_dealer_%s'):format(i), heading=0.0, debugPoly=false, minZ=d.coords.z-1, maxZ=d.coords.z+2}, {
            options = {
                {icon='fas fa-cannabis', label='Open Black Market', action=function() TriggerEvent('bonezz:dealers:open') end},
                {icon='fas fa-dollar-sign', label='Sell Drugs', action=function() TriggerEvent('bonezz:dealers:sellback') end},
            },
            distance = 2.0
        })
    end
end)

RegisterNetEvent('bonezz:dealers:open', function()
    QBCore.Functions.Notify('Use /buy [item] [amount] • /sellback [item] [amount]', 'primary', 6000)
end)
RegisterNetEvent('bonezz:dealers:sellback', function()
    QBCore.Functions.Notify('Sellback command ready: /sellback [item] [amount]', 'primary', 4000)
end)
