# Nebula front configure

    module.exports = ->
      options = @config.nebula.front ?= {}
      throw Error "Required option: password" unless options.password
      throw Error "Required option: repo" unless options.repo
      throw Error "Required option: public_key" unless options.public_key
      throw Error "Required option: private_key" unless options.private_key
      throw Error "Required option: nebula_nodes" unless options.nebula_nodes

      options.source = options.repo
      options.target ?= 'opennebula.repo'
      options.target = path.resolve '/etc/yum.repos.d', options.target
      options.replace ?= 'opennebula*'
      options.public_key = options.public_key
      options.private_key = options.private_key
      options.nebula_nodes = options.nebula_nodes.join(" ")

## Dependencies

    path = require('path').posix
