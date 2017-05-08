assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

Coordinates = require '../../utils/coordinates.coffee'

Pong = require '../pong.coffee'

FieldConfig = require './field-config.coffee'

Rectangle = require '../../utils/geometry/rectangle.coffee'

class Field
  constructor: (game, pong, fieldConfig, view) ->
    assert pong?, "Pong missing"
    assert fieldConfig?, "No field config"
    assert view instanceof Rectangle, "View not rect"

    @game = game
    @pong = pong
    @config = fieldConfig
    @view = view

    @initalizePlayers()
    @initializeBall()


  initalizePlayers: ->
    p1 = @pong.players[0]
    p2 = @pong.players[1]

    # p1 position
    p1.sprite.x = @view.getTopLeft().x + @config.players.marginX
    p1.sprite.y = @view.getTopLeft().y + @game.height / 2

    # p1 scale
    p1Scale = new Coordinates 0, 0
    p1Scale.x = @config.players.width / p1.sprite.width
    p1Scale.y = @config.players.height / p1.sprite.height
    p1.sprite.scale.setTo p1Scale.x, p1Scale.y

    # p2 position
    p2.sprite.x = @view.getTopRight().x - @config.players.marginX
    p2.sprite.y = @view.getTopRight().y + @game.height / 2

    # p2 scale
    p2Scale = new Coordinates 0, 0
    p2Scale.x = @config.players.width / p2.sprite.width
    p2Scale.y = @config.players.height / p2.sprite.height
    p2.sprite.scale.setTo p2Scale.x, p2Scale.y

    # Set sprites visible
    p1.sprite.visible = true
    p2.sprite.visible = true


  initializeBall: ->
    ballSprite = @pong.ball.sprite

    # Position
    viewMiddlePoint = @view.getMiddlePoint()
    ballSprite.x = viewMiddlePoint.x
    ballSprite.y = viewMiddlePoint.y
    @pong.ball.initialPoint = viewMiddlePoint

    # Scale
    widthScale = @config.ball.size / ballSprite.width
    heightScale = @config.ball.size / ballSprite.height
    mediumScale = (widthScale + heightScale) / 2
    ballSprite.scale.setTo mediumScale, mediumScale

    # Visible
    ballSprite.visible = true


module.exports = Field
