
# Open Nebula Front Configure

    module.exports = ->
      service = migration.call @, service, './lib/nebula/front', ['nebula', 'front'], require('nikita/lib/misc').merge require('.').use,
        nebula_node: key: ['ryba', 'nebula', 'node']
      @config.ryba ?= {}
      options = @config.nebula.front = service.options

## Validation

      # throw Error "Required option: cache_dir" unless options.cache_dir
      throw Error "Required option: password" unless options.password
      throw Error "Required option: repo" unless options.repo
      throw Error "Required option: public_key" unless options.public_key
      throw Error "Required option: private_key" unless options.private_key

## Normalization

      # Where the gem are stored local after being downloaded in prepare
      options.gem_dir ?= path.resolve options.cache_dir, 'nebula', 'gems'
      options.source = options.repo
      options.target ?= 'opennebula.repo'
      options.target = path.posix.resolve '/etc/yum.repos.d', options.target
      options.replace ?= 'opennebula*'
      options.nebula_node_hosts = service.use.nebula_node.map (srv) -> srv.node.fqdn

## Dependencies

    path = require 'path'
    migration = require 'masson/lib/migration'
