nconf = require 'nconf'
path  = require 'path'

getConfigFileName = () ->
  (process.env.NODE_ENV || "development") + ".json"

file = path.join(__dirname, getConfigFileName());

module.exports = nconf.argv()
  .env()
  .file({ file: file })
  .get()

