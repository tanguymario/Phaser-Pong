Phaser = require 'Phaser'

Pong = require '../pong/pong.coffee'

FieldConfig = require '../pong/field/field-config.coffee'

Ball = require '../pong/ball/ball.coffee'
BallConfig = require '../pong/ball/ball-config.coffee'

PlayerConfig = require '../pong/player/player-config.coffee'
PlayerHuman = require '../pong/player/player-human.coffee'
PlayerHumanConfig = require '../pong/player/player-human-config.coffee'
PlayerAI = require '../pong/player/player-ai.coffee'

config      = require '../config/config.coffee'

debug       = require '../utils/debug.coffee'
debugThemes = require '../utils/debug-themes.coffee'

class Game extends Phaser.State
  constructor: ->
    debug 'Constructor...', @, 'info', 30, debugThemes.Phaser
    super

    @ballSkin = BallConfig.skins.basketball

    @fieldConfig = FieldConfig.classic

    @p1skin = PlayerConfig.skins.classic
    @p2skin = PlayerConfig.skins.classic


  preload: ->
    debug 'Preload...', @, 'info', 30, debugThemes.Phaser
    @game.load.image @p1skin.key, @p1skin.src
    @game.load.image @p2skin.key, @p2skin.src
    @game.load.image @ballSkin.key, @ballSkin.src

  create: ->
    debug 'Create...', @, 'info', 30, debugThemes.Phaser

    player1 = new PlayerHuman @game, @p1skin, PlayerHumanConfig.player1
    player2 = new PlayerHuman @game, @p2skin, PlayerHumanConfig.player2

    ball = new Ball @game, @ballSkin

    @pong = new Pong @game, @fieldConfig, ball, player1, player2


  update: ->
    @pong.update()


  toggleFullscreen: ->
    if @game.scale.isFullScreen
      @game.scale.stopFullScreen()
    else
      @game.scale.startFullScreen()


module.exports = Game
