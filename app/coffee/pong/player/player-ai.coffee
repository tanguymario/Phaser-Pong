Player = require './player.coffee'

<<<<<<< Updated upstream
debug       = require '../utils/debug.coffee'
debugThemes = require '../utils/debug-themes.coffee'

class PlayerAi extends Player
  constructor: ->

=======
debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

class PlayerAi extends Player
  constructor: (gridTheme) ->
    super gridTheme
>>>>>>> Stashed changes

module.exports = PlayerAi
