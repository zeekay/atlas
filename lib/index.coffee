fs     = require 'fs'
fuzzy  = require 'fuzzy'
lookup = require './lookup'
map    = require './map'
utils  = require './utils'

exports.toCode = (name) ->
  matches = fuzzy.filter (utils.normalize name), lookup.names
  if matches? and matches.length > 0
    top = matches[0]
    for match in matches
      if match.score > top.score
        top = match
      else if match.score == top.score and match.string.length < top.string.length
        top = match

    lookup.toCode[top.string]
  else
    throw new Error('No match found for ' + name)

exports.toName = (code) ->
  lookup.toName[code]

exports.parse = (input) ->
  countries = []
  for line in fs.readFileSync(input, {encoding: 'utf8'}).split('\n')
    name = line.split(/\d+/)[0]
    name = name.trim()
    countries.push name if name != ''
  countries

exports.map = map
