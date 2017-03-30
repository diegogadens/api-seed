mongoose = require('mongoose');
Schema   = mongoose.Schema;

userSchema = new Schema(
  name: String
  age: Number
  email: String
)

User = mongoose.model('User', userSchema);

module.exports = User;