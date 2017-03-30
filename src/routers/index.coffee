publicRoutes     = require './public'

module.exports.configureRoutes = (server) ->
  publicRoutes.init(server)
