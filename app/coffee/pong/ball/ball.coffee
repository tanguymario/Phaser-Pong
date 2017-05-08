assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

class Ball
  constructor: (game) ->
    assert game?, "Game missing"
    @game = game


module.exports = Ball
