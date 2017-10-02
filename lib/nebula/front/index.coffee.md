
# Nebula

OpenNebula is an open-source management platform to build IaaS private, public and hybrid clouds.

    module.exports =
      use:
        nebula_node: module: './lib/nebula/node'
      configure: './lib/nebula/front/configure'
      commands:
        'prepare': ->
          options = @config.nebula.front
          @call './lib/nebula/front/prepare', options
        'install': ->
          options = @config.nebula.front
          @call './lib/nebula/front/install', options
        'start': './lib/nebula/front/start'
        'stop': './lib/nebula/front/stop'
