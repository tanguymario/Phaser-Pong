Phaser = require 'Phaser'

Pong = require '../pong/pong.coffee'

FieldConfig = require '../pong/field/field-config.coffee'

Ball = require '../pong/ball/ball.coffee'

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

    @fieldConfig = FieldConfig.classic

    @skin1 = PlayerConfig.skins.classic
    @skin2 = PlayerConfig.skins.classic


  preload: ->
    debug 'Preload...', @, 'info', 30, debugThemes.Phaser
    @game.load.image @skin1.key, @skin1.src
    @game.load.image @skin1.key, @skin1.src

  create: ->
    debug 'Create...', @, 'info', 30, debugThemes.Phaser

    player1 = new PlayerHuman @game, @skin1, PlayerHumanConfig.player1
    player2 = new PlayerHuman @game, @skin2, PlayerHumanConfig.player2

    ball = new Ball @game

    @pong = new Pong @game, @fieldConfig, ball, player1, player2


  toggleFullscreen: ->
    if @game.scale.isFullScreen
      @game.scale.stopFullScreen()
    else
      @game.scale.startFullScreen()


module.exports = Game
