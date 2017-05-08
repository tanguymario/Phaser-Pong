Direction = require '../../utils/direction.coffee'

assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

class Player
  constructor: (game, skin) ->
    assert game?, "Game missing"
    @game = game

    # Sprite
    @sprite = @game.add.sprite 0, 0, skin.key
    @sprite.anchor.setTo 0.5, 0.5


  moveUp: ->
    # TODO


  moveDown: ->
    # TODO


  move: ->
    # TODO
    

module.exports = Player
