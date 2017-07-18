# Nebula

OpenNebula is an open-source management platform to build IaaS private, public and hybrid clouds.

    module.exports =
      use:
        db_admin: implicit: true, module: 'ryba/commons/db_admin'
      configure: './lib/nebula/configure'
      commands:
        'install': ->
          options = @config.nebula
          @call './lib/nebula/install', options
        'start': './lib/nebula/start'
        'stop': './lib/nebula/stop'
