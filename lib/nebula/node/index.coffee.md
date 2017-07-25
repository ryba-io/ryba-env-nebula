# Nebula

OpenNebula is an open-source management platform to build IaaS private, public and hybrid clouds.

    module.exports =
      configure: './lib/nebula/node/configure'
      commands:
        'install': ->
          options = @config.nebula.node
          @call './lib/nebula/node/install', options
