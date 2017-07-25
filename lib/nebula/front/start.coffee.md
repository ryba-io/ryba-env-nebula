
# Open OpenNebula Front Start

OpenNebula server and Sunstone (Web UI) is started with the service's syntax command.

    module.exports = header: 'OpenNebula Server Start', label_true: 'STARTED', handler: ->
      @service.start
        name: 'opennebula'
      @service.start
        name: 'opennebula-sunstone'
