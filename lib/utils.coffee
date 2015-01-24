# strip non-alphanumeric characters and lowercase
exports.normalize = (name) ->
  (name.replace /\W/g, '').toLowerCase()
