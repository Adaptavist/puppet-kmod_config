class kmod_config (
    $blacklist       =       {},
    $load            =       {},
    $mod_alias       =       {},
    $install         =       {},
    $merge_config    =       'true',
    ) {

    #all config can be set at either global or host level, therefore check to see if the hosts hash exists
    if ($host != undef) {
        #if so validate the hash
        validate_hash($host)

        #if a host level "merge_config" flag has been set use it, otherwise use the global flag
        $real_merge_config = $host['kmod_config::merge_config']? {
            default => $host['kmod_config::merge_config'],
            undef => $merge_config,
        }

        #check if there is a host level blacklist is defined
        if ($host['kmod_config::blacklist']) {
            validate_hash($host['kmod_config::blacklist'])
            #if so and we have merging emabled merge global and host values
            if ($real_merge_config) {
                $real_blacklist=merge($blacklist,$host['kmod_config::blacklist'])
            }
            #if merging is disabled use the host values
            else {
                $real_blacklist=$host['kmod_config::blacklist']
            }
        }
        #if not use global values
        else {
            $real_blacklist=$blacklist
        }

        #check if there is a host level load list is defined
        if ($host['kmod_config::load']) {
            validate_hash($host['kmod_config::load'])
            #if so and we have merging emabled merge global and host values
            if ($real_merge_config) {
                $real_load=merge($load,$host['kmod_config::load'])
            }
            #if merging is disabled use the host values
            else {
                $real_load=$host['kmod_config::load']
            }
        }
        #if not use global values
        else {
            $real_load=$load
        }

        #check if there is a host level alias is defined
        if ($host['kmod_config::mod_alias']) {
            validate_hash($host['kmod_config::mod_alias'])
            #if so and we have merging emabled merge global and host values
            if ($real_merge_config) {
                $real_mod_alias=merge($mod_alias,$host['kmod_config::mod_alias'])
            }
            #if merging is disabled use the host values
            else {
                $real_mod_alias=$host['kmod_config::mod_alias']
            }
        }
        #if not use global values
        else {
            $real_mod_alias=$mod_alias
        }

        #check if there is a host level install list is defined
        if ($host['kmod_config::install']) {
            validate_hash($host['kmod_config::install'])
            #if so and we have merging emabled merge global and host values
            if ($real_merge_config) {
                $real_install=merge($install,$host['kmod_config::install'])
            }
            #if merging is disabled use the host values
            else {
                $real_install=$host['kmod_config::install']
            }
        }
        #if not use global values
        else {
            $real_install=$install
        }
    }
    #if there is no host has use global values
    else {
        $real_install=$install
        $real_mod_alias=$mod_alias
        $real_load=$load
        $real_blacklist=$blacklist
    }

    #if the blacklist is set create then
    if ($real_blacklist) {
        validate_hash($real_blacklist)
        create_resources(kmod::blacklist, $real_blacklist)
    }

    #if the load list is set create then
    if ($real_load) {
        validate_hash($real_load)
        create_resources(kmod::load, $real_load)
    }

    #if the alias list is set create then
    if ($real_mod_alias) {
        validate_hash($real_mod_alias)
        create_resources(kmod::alias, $real_mod_alias)
    }

    #if the install list is set create then
    if ($real_install) {
        validate_hash($real_install)
        create_resources(kmod::install, $real_install)
    }

}
