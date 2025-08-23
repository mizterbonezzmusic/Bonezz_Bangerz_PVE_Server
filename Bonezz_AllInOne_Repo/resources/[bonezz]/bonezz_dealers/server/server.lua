local QBCore = exports['qb-core']:GetCoreObject()
QBCore.Commands.Add('buy','Buy from nearby dealer', {{name='item'},{name='amount'}}, false, function(src,args)
    local item = tostring(args[1] or '')
    local amt = tonumber(args[2] or 1)
    if item ~= '' and amt and amt > 0 then TriggerEvent('bonezz:drugs:buy', item, amt) end
end, false)
QBCore.Commands.Add('sellback','Sell to nearby dealer', {{name='item'},{name='amount'}}, false, function(src,args)
    local item = tostring(args[1] or '')
    local amt = tonumber(args[2] or 1)
    if item ~= '' and amt and amt > 0 then TriggerEvent('bonezz:drugs:sellback', item, amt) end
end, false)
