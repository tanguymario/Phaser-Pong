assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

Coordinates = require '../../utils/coordinates.coffee'

Degrees = require '../../utils/math/degrees.coffee'

class Ball
  @V_DEF_SPEED = 150

  constructor: (game, skin) ->
    assert game?, "Game missing"
    assert skin?, "Skin missing"

    @game = game
    @skin = skin
    @speed = Ball.V_DEF_SPEED

    @initialPoint = new Coordinates 0, 0

    @sprite = @game.add.sprite @initialPoint.x, @initialPoint.y, @skin.key
    @sprite.anchor.setTo 0.5, 0.5
    @sprite.visible = false

    @game.physics.arcade.enable @sprite
    @sprite.checkWorldBounds = true
    @sprite.events.onOutOfBounds.add @triggerOutOfWorld, @
    @sprite.body.bounce.set 1
    # @sprite.body.setCircle


  triggerOutOfWorld: ->
    console.log "Outside!"
    @reset()


  reset: ->
    @sprite.angle = Degrees.GetRandomAngle()
    @sprite.reset @initialPoint.x, @initialPoint.y


  update: ->
    @game.physics.arcade.velocityFromAngle @sprite.angle, @speed, @sprite.body.velocity


module.exports = Ball
