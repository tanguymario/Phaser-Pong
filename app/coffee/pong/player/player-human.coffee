Player = require './player.coffee'
<<<<<<< Updated upstream

debug       = require '../utils/debug.coffee'
debugThemes = require '../utils/debug-themes.coffee'

class PlayerHuman extends Player
  constructor: ->

=======
PlayerHumanConfig = require './player-human-config.coffee'

assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

class PlayerHuman extends Player
  constructor: (game, playerConfig) ->
    super game

    @config = playerConfig
>>>>>>> Stashed changes

module.exports = PlayerHuman
