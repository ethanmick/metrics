'use strict'
#
# Ethan Mick
# 2015
#

require('./lib/models/log')

# connect to the database

# Start Hapi

Server = require './lib/server'
log = require 'winston'
config = require './config'

log.debug 'Start up', config

###
# ToDo: Move this when we have a global config object
###

s = new Server(config.http)

s.setup(config).then ->
  s.start()
.catch (err)->
  log.error 'Server Startup Error!', err



