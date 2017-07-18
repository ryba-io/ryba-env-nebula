
# OpenNebula server stop

OpenNebula server and Sunstone (Web UI) is stopped with the service's syntax command.

    module.exports = header: 'OpenNebula Server Stop', label_true: 'STOPPED', handler: ->
      @service.stop
        name: 'opennebula'
      @service.stop
        name: 'opennebula-sunstone'
