# Nebula Front End Install

Install Nebula front end on the specified hosts.
http://docs.opennebula.org/5.2/deployment/opennebula_installation/frontend_installation.html

    module.exports = header: 'Nebula Install', handler: (options) ->
      nebula = @config.nebula

## Add Nebula repositories

      @call header: 'Repos', ->
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
          header: 'opennebula-ruby'
          name: 'opennebula-ruby'
        @service
          header: 'opennebula-gate'
          name: 'opennebula-gate'
        @service
          header: 'opennebula-flow'
          name: 'opennebula-flow'
        @service
          header: 'opennebula server'
          name: 'opennebula-server'
          srv_name: 'opennebula'
          startup: true
        @service
          header: 'opennebula sunstone'
          name: 'opennebula-sunstone'
          startup: true

## Ruby Runtime installation

        @call header: 'Packages', ->
          @service
            header: 'g++'
            name: 'gcc-c++'
          @service
            header: 'gcc'
            name: 'gcc'
          @service
            header: 'curl-devel'
            name: 'curl-devel'
          @service
            header: 'mysql-devell'
            name: 'mysql-devel'
          @service
            header: 'openssl-devel'
            name: 'openssl-devel'
          @service
            header: 'ruby-devel'
            name: 'ruby-devel'
          @service
            header: 'make'
            name: 'make'

TODO run /usr/share/one/install_gems
http://docs.opennebula.org/5.2/deployment/opennebula_installation/frontend_installation.html#step-4-ruby-runtime-installation


## Mysql

TODO
http://docs.opennebula.org/5.2/deployment/opennebula_installation/mysql_setup.html#mysql-setup

## Set password

      @call header: 'Password', ->
        @file
          content: "oneadmin:#{options.password}"
          target: "/var/lib/one/.one/one_auth"
          eof: true
