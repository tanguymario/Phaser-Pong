Direction = require '../../utils/direction.coffee'

assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

class Player
  @V_DEF_SPEED = 5

  constructor: (game, skin) ->
    assert game?, "Game missing"
    @game = game

    # Sprite
    @sprite = @game.add.sprite 0, 0, skin.key
    @sprite.anchor.setTo 0.5, 0.5
    @sprite.visible = false

    @game.physics.arcade.enable @sprite
    @sprite.body.collideWorldBounds = true


  update: ->
    # Nothing to do


  moveUp: ->
    @move -1


  moveDown: ->
    @move 1


  move: (value) ->
    @sprite.y += value * Player.V_DEF_SPEED


module.exports = Player
