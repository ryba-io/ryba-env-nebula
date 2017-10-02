
# Open Nebula Node Install

Install Nebula on nodes

    module.exports = header: 'Nebula Node Install', handler: (options) ->

## Add Nebula repositories

      @tools.repo
        if: options.source?
        header: 'Repository'
        source: options.source
        target: options.target
        replace: options.replace
        update: true

## Install

      @call header: 'Packages', ->
        @service
          header: 'opennebula-node-kvm'
          name: 'opennebula-node-kvm'

## Service libvirtd start

      @service.restart
        header: 'Start libvirtd'
        name: 'libvirtd'

## Set SSH key of the admin for password less login

      @file
        header: "Authorized Keys"
        content: options.server_public_key
        target: "/var/lib/one/.ssh/authorized_keys"
        mode: "0600"
        uid: "oneadmin"
        gid: "oneadmin"
        eof: true
