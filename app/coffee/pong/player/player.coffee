<<<<<<< Updated upstream

debug       = require '../utils/debug.coffee'
debugThemes = require '../utils/debug-themes.coffee'

class Player
  constructor: ->


module.exports = PlayerHuman
=======
Direction = require '../../utils/direction.coffee'

assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

class Player
  constructor: (game, gridTheme) ->
    assert game?, "Game missing"
    @game = game


module.exports = Player
>>>>>>> Stashed changes
