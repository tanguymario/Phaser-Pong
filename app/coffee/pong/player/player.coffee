Direction = require '../../utils/direction.coffee'

assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

class Player
  @V_SPEED = 50
  @V_DECELERATE_COEFF = 0.85

  constructor: (game, skin) ->
    assert game?, "Game missing"
    @game = game

    # Sprite
    @sprite = @game.add.sprite 0, 0, skin.key
    @sprite.anchor.setTo 0.5, 0.5
    @sprite.visible = false

    @game.physics.arcade.enable @sprite
    @sprite.body.collideWorldBounds = true
    @sprite.body.immovable = true


  update: =>
    @sprite.body.velocity.y *= Player.V_DECELERATE_COEFF


  moveUp: ->
    @move -1


  moveDown: ->
    @move 1


  move: (value) ->
    @sprite.body.velocity.y += value * Player.V_SPEED


module.exports = Player
