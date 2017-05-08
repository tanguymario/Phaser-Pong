Player = require './player.coffee'

PlayerHumanConfig = require './player-human-config.coffee'

assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

class PlayerHuman extends Player
  constructor: (game, skin, humanConfig) ->
    super game, skin

    @humanConfig = humanConfig

    # Keys
    @keys =
      up: @game.input.keyboard.addKey @humanConfig.keys.up, @
      down: @game.input.keyboard.addKey @humanConfig.keys.down, @


  update: ->
    if @keys.up.isDown
      @moveUp()
    else if @keys.down.isDown
      @moveDown()


module.exports = PlayerHuman
