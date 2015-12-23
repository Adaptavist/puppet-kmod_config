# kmod_config Module

## Overview

The **kmod_config** is a wrapper over the puppet-kmod module, it allows all elements to be configured via hiera hashes and also allows gloal and host level confirutaion to be used.

##Configuration

###`blacklist`

Hash of kernel modules to be blacklisted **Default: empty hash** This value can be set at global or host level

###`load`

Hash of kernel modules to be loaded **Default: empty hash** This value can be set at global or host level

###`mod_alias`

Hash of kernel module name aliases **Default: empty hash** This value can be set at global or host level

###`install`

Hash of kernel modules to be installed  **Default: empty hash** This value can be set at global or host level

###`merge_config`

Flag to determine if global and host level values should be merged together.  If set to false host level values are used and globals ignored, if however there are no hosts level values then the globals are used. **Default: true** (this option can be overwritten by a host level entry)

##Hiera Examples:

* Global Settings

        #blacklist rpcsec_gss_krb5 module
        kmod_config::blacklist:
            'rpcsec_gss_krb5':
            ensure: 'present'
        
* Global and Host Settings

        #blacklist rpcsec_gss_krb5 module
        kmod_config::blacklist:
            'rpcsec_gss_krb5':
            ensure: 'present'
        hosts:
            'host1':
                knod_config::merge_config false
                #blacklist amd76x_edac module
                kmod_config::blacklist:
                    'amd76x_edac':
                    ensure: 'present'

## Dependencies

This module depends on the madkiss/puppet-kmod module.