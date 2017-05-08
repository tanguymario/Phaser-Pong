Phaser = require 'Phaser'

<<<<<<< Updated upstream
=======
Pong = require '../pong/pong.coffee'

PlayerHuman = require '../pong/player/player-human.coffee'
PlayerHumanConfig = require '../pong/player/player-human-config.coffee'
PlayerAI = require '../pong/player/player-ai.coffee'

>>>>>>> Stashed changes
config      = require '../config/config.coffee'

debug       = require '../utils/debug.coffee'
debugThemes = require '../utils/debug-themes.coffee'

class Game extends Phaser.State
  constructor: ->
    debug 'Constructor...', @, 'info', 30, debugThemes.Phaser
    super


  preload: ->
    debug 'Preload...', @, 'info', 30, debugThemes.Phaser


  create: ->
    debug 'Create...', @, 'info', 30, debugThemes.Phaser

<<<<<<< Updated upstream
=======
    player1 = new PlayerHuman @game, PlayerHumanConfig.player1
    player2 = new PlayerHuman @game, PlayerHumanConfig.player2

    @pong = new Pong @game, player1, player2

>>>>>>> Stashed changes

  toggleFullscreen: ->
    if @game.scale.isFullScreen
      @game.scale.stopFullScreen()
    else
      @game.scale.startFullScreen()


module.exports = Game
