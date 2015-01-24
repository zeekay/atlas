utils  = require './utils'
toName = require './map'

toCode = {}

for code, name of toName
  toCode[utils.normalize name] = code

module.exports =
  codes: Object.keys toName
  names: Object.keys toCode
  toName: toName
  toCode: toCode
