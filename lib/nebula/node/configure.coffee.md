
# Open Nebula Node Configure

    module.exports = ->
      service = migration.call @, service, './lib/nebula/node', ['nebula', 'node'], require('nikita/lib/misc').merge require('.').use, {}
      @config.ryba ?= {}
      options = @config.nebula.node = service.options
      
      throw Error "Required option: repo" unless options.repo
      throw Error "Required option: server_public_key" unless options.server_public_key
      options.source = options.repo
      options.target ?= 'opennebula.repo'
      options.target = path.posix.resolve '/etc/yum.repos.d', options.target
      options.replace ?= 'opennebula*'
      options.server_public_key = options.server_public_key
      options.server_host = options.server_host

## Dependencies

    path = require 'path'
    migration = require 'masson/lib/migration'
