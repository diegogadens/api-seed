restify       = require 'restify'
seppuku       = require 'seppuku'
config        = require '../config'
routers       = require './routers'
db_connection = require './utils/database-connector'

exports.createServer =  ->

  server = restify.createServer()

  server.use seppuku server,
    minDeferralTime: config.shutDownTimeout
    maxDeferralTime: config.shutDownTimeout
    trapExceptions: false

  server.on 'uncaughtException', (req, res, route, err) ->
    res.send(503, new restify.InternalError('Service not available'))

  server.use restify.bodyParser(mapParams: true)
  server.use restify.queryParser(mapParams: true)

  routers.configureRoutes(server)

  server
