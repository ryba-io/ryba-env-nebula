# Nebula

OpenNebula is an open-source management platform to build IaaS private, public and hybrid clouds.

    module.exports =
      use:
        db_admin: implicit: true, module: 'ryba/commons/db_admin'
        front: './lib/nebula/front'
      configure: './lib/nebula/front/configure'
      commands:
        'install': ->
          options = @config.nebula.front
          @call './lib/nebula/front/install', options
        'start': './lib/nebula/front/start'
        'stop': './lib/nebula/front/stop'
