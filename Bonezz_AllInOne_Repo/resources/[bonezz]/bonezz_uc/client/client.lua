local QBCore = exports['qb-core']:GetCoreObject()
local cfg = BonezzUC
local function isLEOorUC()
    local p = QBCore.Functions.GetPlayerData()
    if not p or not p.job then return false end
    local j = p.job.name or ''
    return (j == cfg.JobName) or j == 'police' or j == 'sheriff' or j == 'state' or j == 'fib'
end
-- Add UC-only overlays if needed
