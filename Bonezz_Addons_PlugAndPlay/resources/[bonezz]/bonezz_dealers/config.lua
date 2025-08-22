Config = {}

-- Blips visible to ALL players for dealer clerks
Config.ShowDealerBlipsToAll = true
Config.HostileToLEO = true  -- dealers become hostile if LEO/UC tries to buy

-- Example clerk/dealer spots (24/7s). Replace with your real set later.
Config.Dealers = {
    {label="24/7 Grove St Clerk", coords=vector3(-48.42, -1757.91, 29.42), heading=52.0},
    {label="24/7 Mirror Park Clerk", coords=vector3(1164.70, -322.62, 69.21), heading=100.0},
    {label="24/7 Sandy Shores Clerk", coords=vector3(1961.13, 3740.52, 32.34), heading=30.0},
    {label="24/7 Paleto Clerk", coords=vector3(1730.01, 6415.82, 35.04), heading=155.0},
}

-- Relationship groups (used by client to flip to hostile vs LEO/UC)
Config.LEOJobs = {"police","sheriff","state"}
Config.UCJob = "uc"
