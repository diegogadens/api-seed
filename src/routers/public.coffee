statusController = require '../controllers/status-controller'
usersController  = require '../controllers/users-controller.coffee'

_server = null

module.exports.init = (server) ->
  _server = server

  router.get
    name: 'Status'
    path: '/status'
    handler: statusController.get

  router.get
    name: 'List users'
    path: '/users'
    handler: usersController.get

  router.post
    name: 'Create user'
    path: '/users'
    handler: usersController.post

router = {
  get: (opts) ->
    _server.get(opts.path, opts.handler)

  post: (opts) ->
    _server.post(opts.path, opts.handler)

  put: (opts) ->
    _server.put(opts.path, opts.handler)

  delete: (opts) ->
    _server.delete(opts.path, opts.handler)
}

