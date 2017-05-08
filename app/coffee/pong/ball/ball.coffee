assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

Coordinates = require '../../utils/coordinates.coffee'

Degrees = require '../../utils/math/degrees.coffee'

class Ball
  constructor: (game, skin) ->
    assert game?, "Game missing"
    assert skin?, "Skin missing"

    @game = game
    @skin = skin

    @initialPoint = new Coordinates 0, 0

    @sprite = @game.add.sprite @initialPoint.x, @initialPoint.y, @skin.key
    @sprite.anchor.setTo 0.5, 0.5
    @sprite.visible = false

    @game.physics.arcade.enable @sprite
    @sprite.checkWorldBounds = true
    @sprite.events.onOutOfBounds.add @triggerOutOfWorld, @


  triggerOutOfWorld: ->
    console.log "Outside!"
    @reset()


  reset: ->
    @startAngle = Degrees.GetRandomAngle()
    @sprite.reset @initialPoint.x, @initialPoint.y


  update: ->
    # TODO


module.exports = Ball
