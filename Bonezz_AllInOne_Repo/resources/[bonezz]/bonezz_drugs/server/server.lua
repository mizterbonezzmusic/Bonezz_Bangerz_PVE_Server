local QBCore = exports['qb-core']:GetCoreObject()
local cfg = BonezzDrugs
CreateThread(function()
    for name, meta in pairs(cfg.Items) do
        if not QBCore.Shared.Items[name] then QBCore.Shared.Items[name] = meta end
    end
    print('[bonezz_drugs] Items patched.')
end)
RegisterNetEvent('bonezz:drugs:buy', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src); if not Player then return end
    amount = tonumber(amount) or 1; if amount < 1 then return end
    local price = (cfg.Prices[item] or 0) * amount; if price <= 0 then return end
    if Player.Functions.RemoveMoney('cash', price, 'bonezz-buy') then
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
        TriggerClientEvent('QBCore:Notify', src, ('Bought %sx %s for $%s'):format(amount,item,price), 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'Not enough cash','error')
    end
end)
RegisterNetEvent('bonezz:drugs:sellback', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src); if not Player then return end
    amount = tonumber(amount) or 1; if amount < 1 then return end
    local have = Player.Functions.GetItemByName(item); if not have or have.amount < amount then
        TriggerClientEvent('QBCore:Notify', src, 'Not enough items','error'); return
    end
    local base = (cfg.Prices[item] or 0) * amount
    local payout = math.floor(base * (cfg.SellbackMultiplier or 0.6))
    Player.Functions.RemoveItem(item, amount)
    Player.Functions.AddMoney('cash', payout, 'bonezz-sellback')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'remove')
    TriggerClientEvent('QBCore:Notify', src, ('Sold %sx %s for $%s'):format(amount,item,payout), 'success')
end)
