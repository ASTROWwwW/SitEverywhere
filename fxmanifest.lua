fx_version 'cerulean'
game 'gta5'

author 'Astrxw Ledev'
description 'Sitting System'
version '1.0.0'

shared_script 'cfg_sit.lua'

client_scripts {
    'cl_sit.lua'
}

server_scripts {
    'sv_sit.lua'
}

dependencies {
    'ox_target'
}
