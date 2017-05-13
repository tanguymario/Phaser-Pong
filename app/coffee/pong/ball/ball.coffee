assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

clamp = require '../../utils/math/clamp.coffee'
lerpUnclamped = require '../../utils/math/lerp-unclamped.coffee'

Coordinates = require '../../utils/coordinates.coffee'

random = require '../../utils/math/random.coffee'

Degrees = require '../../utils/math/degrees.coffee'

class Ball
  @V_SPEED = 300
  @V_ANGLE_LIMIT = 45

  constructor: (game, skin) ->
    assert game?, "Game missing"
    assert skin?, "Skin missing"

    @game = game
    @skin = skin
    @speed = Ball.V_SPEED

    @initialPoint = new Coordinates 0, 0

    @sprite = @game.add.sprite @initialPoint.x, @initialPoint.y, @skin.key
    @sprite.anchor.setTo 0.5, 0.5
    @sprite.visible = false

    @game.physics.arcade.enable @sprite
    @sprite.checkWorldBounds = true
    @sprite.body.collideWorldBounds = true
    @sprite.body.immovable = true
    @sprite.body.bounce.setTo 1, 1
    @sprite.events.onOutOfBounds.add @triggerOutOfWorld, @


  collideWithPaddle: (ball, player) =>
    # If player.anchor = 0.5, 0.5
    diffBallTop = @sprite.y - (player.y - player.height / 2)

    hitPoint = diffBallTop / player.height
    hitPoint = clamp hitPoint, 0, 1

    if @sprite.x < @game.width / 2
      # Right direction
      minAngle = -90 + Ball.V_ANGLE_LIMIT
      maxAngle = 90 - Ball.V_ANGLE_LIMIT
      @sprite.angle = lerpUnclamped minAngle, maxAngle, hitPoint
    else
      # Left direction
      minAngle = -90 - Ball.V_ANGLE_LIMIT
      maxAngle = -270 + Ball.V_ANGLE_LIMIT
      @sprite.angle = lerpUnclamped minAngle, maxAngle, hitPoint

    @launch()


  triggerOutOfWorld: =>
    @reset()


  reset: ->
    directionLeft = Math.random() > 0.5
    if directionLeft
      rndAngle = random.between -90 - Ball.V_ANGLE_LIMIT, -270 + Ball.V_ANGLE_LIMIT
    else
      rndAngle = random.between -90 - Ball.V_ANGLE_LIMIT, -270 + Ball.V_ANGLE_LIMIT

    @sprite.angle = rndAngle
    @sprite.reset @initialPoint.x, @initialPoint.y
    @launch()


  launch: ->
    @game.physics.arcade.velocityFromAngle @sprite.angle, @speed, @sprite.body.velocity


  update: ->
    # @game.physics.arcade.velocityFromAngle @sprite.angle, @speed, @sprite.body.velocity




module.exports = Ball
