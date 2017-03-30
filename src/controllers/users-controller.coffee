User = require '../models/user'

exports.get = (req, res) ->
  User.find {}, (err, users) ->
    if err
      res.send({ error: err }) #TODO define a elegant way to handle errors across the API
    res.send(users);

exports.post = (req, res) ->
  { name, age, email } = req.body

  newUser = User(
    name: name,
    age: age,
    email: email
  )

  newUser.save (err) ->
    if err
      res.send({ error: err })
    res.send(201, "User #{name} created")
