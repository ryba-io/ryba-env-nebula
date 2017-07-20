# Nebula front configure

    module.exports = ->
      options = @config.nebula.front ?= {}
      throw Error "Required option: password" unless options.password
      throw Error "Required option: repo" unless options.repo
      options.source = options.repo
      options.target ?= 'opennebula.repo'
      options.target = path.resolve '/etc/yum.repos.d', options.target
      options.replace ?= 'opennebula*'

## Dependencies

    path = require('path').posix
