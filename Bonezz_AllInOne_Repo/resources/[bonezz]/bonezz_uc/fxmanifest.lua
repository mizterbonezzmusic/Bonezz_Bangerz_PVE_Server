fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'config.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

dependencies {
    'qb-core',
    'qb-target',
    'qb-inventory',
    'PolyZone'
}
