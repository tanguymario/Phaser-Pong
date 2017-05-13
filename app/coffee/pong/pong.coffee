assert = require '../utils/assert.coffee'

debug       = require '../utils/debug.coffee'
debugThemes = require '../utils/debug-themes.coffee'

Coordinates = require '../utils/coordinates.coffee'

Field = require './field/field.coffee'

Rectangle = require '../utils/geometry/rectangle.coffee'

class Pong

  # Classic pong game with only two players
  @NB_MIN_PLAYERS = 2
  @NB_MAX_PLAYERS = 2

  constructor: (game, fieldConfig, ball, players...) ->
    assert game?, "Game missing"
    assert players.length >= Pong.NB_MIN_PLAYERS, "Not enough players"
    assert players.length <= Pong.NB_MAX_PLAYERS, "Too Much players"

    @game = game
    @ball = ball
    @players = players

    @game.physics.startSystem Phaser.Physics.ARCADE

    # Left and right game borders are disabled
    @game.physics.arcade.checkCollision.left = false
    @game.physics.arcade.checkCollision.right = false

    # For now, field takes all canvas dimensions
    gameView = new Rectangle new Coordinates(0, 0), @game.width, @game.height
    @field = new Field @game, @, fieldConfig, gameView


  update: ->
    @ball.update()

    for player in @players
      player.update()
      @game.physics.arcade.collide @ball.sprite, player.sprite, @ball.collideWithPaddle, null, @


module.exports = Pong
