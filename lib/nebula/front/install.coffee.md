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
          @service
            header: 'rubygems'
            name: 'rubygems'
        @call header: 'Gems install', ->
          @system.execute
            header: 'rack'
            cmd: '/usr/bin/gem install rack --version "< 2.0.0"'
          @system.execute
            header: 'sinatra'
            cmd: '/usr/bin/gem install sinatra --version "< 2.0.0"'
          @system.execute
            header: 'thin'
            cmd: '/usr/bin/gem install thin'
          @system.execute
            header: 'memcache-client'
            cmd: '/usr/bin/gem install memcache-client'
          @system.execute
            header: 'zendesk_api'
            cmd: '/usr/bin/gem install zendesk_api --version "< 1.14.0"'
          @execute
            header: 'builder'
            cmd: '/usr/bin/gem install builder'
## Mysql

TODO
http://docs.opennebula.org/5.2/deployment/opennebula_installation/mysql_setup.html#mysql-setup

## Set password

      @call header: 'Password', ->
        @file
          content: "oneadmin:#{options.password}"
          target: "/var/lib/one/.one/one_auth"
          eof: true
