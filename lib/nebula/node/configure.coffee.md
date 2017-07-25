
# Open Nebula Node Configure

    module.exports = ->
      options = @config.nebula.node ?= {}
      throw Error "Required option: repo" unless options.repo
      throw Error "Required option: server_public_key" unless options.server_public_key
      options.source = options.repo
      options.target ?= 'opennebula.repo'
      options.target = path.resolve '/etc/yum.repos.d', options.target
      options.replace ?= 'opennebula*'
      options.server_public_key = options.server_public_key
      options.server_host = options.server_host

## Dependencies

    path = require('path').posix
