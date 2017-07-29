
# Open Nebula Front Configure

    module.exports = ->
      options = @config.nebula.front ?= {}
      nodes_ctxs = @contexts './lib/nebula/node'

## Validation

      # throw Error "Required option: cache_dir" unless options.cache_dir
      throw Error "Required option: password" unless options.password
      throw Error "Required option: repo" unless options.repo
      throw Error "Required option: public_key" unless options.public_key
      throw Error "Required option: private_key" unless options.private_key

## Normalization

      options.cache_dir ?= null
      options.source = options.repo
      options.target ?= 'opennebula.repo'
      options.target = path.resolve '/etc/yum.repos.d', options.target
      options.replace ?= 'opennebula*'
      options.nebula_node_hosts = nodes_ctxs.map (ctx) -> ctx.config.host

## Dependencies

    path = require('path').posix
