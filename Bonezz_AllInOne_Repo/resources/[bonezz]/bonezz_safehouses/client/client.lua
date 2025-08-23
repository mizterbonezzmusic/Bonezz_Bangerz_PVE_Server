local tgt = exports['qb-target']
local cfg = BonezzSafehouses
CreateThread(function()
    for i, sh in ipairs(cfg) do
        local blip = AddBlipForCoord(sh.outside.x, sh.outside.y, sh.outside.z)
        SetBlipSprite(blip, 40); SetBlipScale(blip, 0.7); SetBlipColour(blip, 29); SetBlipAsShortRange(blip, false)
        BeginTextCommandSetBlipName('STRING'); AddTextComponentString(sh.label); EndTextCommandSetBlipName(blip)
        tgt:AddBoxZone(('bonezz_safehouse_%s'):format(i), sh.outside, 1.5, 1.5, {name=('bonezz_safehouse_%s'):format(i), minZ=sh.outside.z-1, maxZ=sh.outside.z+2}, {
            options = { {icon='fas fa-door-open', label='Enter Safehouse', action=function() SetEntityCoords(PlayerPedId(), sh.inside.x, sh.inside.y, sh.inside.z) end } },
            distance = 2.0
        })
    end
end)
