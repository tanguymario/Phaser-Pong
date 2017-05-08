<<<<<<< Updated upstream
=======
assert = require '../utils/assert.coffee'

>>>>>>> Stashed changes
debug       = require '../utils/debug.coffee'
debugThemes = require '../utils/debug-themes.coffee'

class Pong
<<<<<<< Updated upstream
  constructor: ->
=======

  @NB_MIN_PLAYERS = 2
  @NB_MAX_PLAYERS = Infinity

  constructor: (game, players...) ->
    assert game?, "Game missing"
    assert players.length >= Pong.NB_MIN_PLAYERS, "Not enough players"
    assert players.length <= Pong.NB_MAX_PLAYERS, "Too Much players"

    @game = game
    @players = players
>>>>>>> Stashed changes


module.exports = Pong
