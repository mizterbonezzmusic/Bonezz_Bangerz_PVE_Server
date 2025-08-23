local QBCore = exports['qb-core']:GetCoreObject()
local cfg = BonezzDrugs
function exports.GetDrugList()
    local t = {}
    for k,v in pairs(cfg.Prices) do
        local label = (cfg.Items[k] and cfg.Items[k].label) or k
        t[#t+1] = string.format('%s - $%s', label, v)
    end
    return table.concat(t, '\n')
end
