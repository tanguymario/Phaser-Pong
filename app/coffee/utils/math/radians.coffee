assert = require 'assert'

random = require './random.coffee'

Angle = require './angle.coffee'

class Radians extends Angle
  @MIN_RADIANS = 0
  @MAX_RADIANS = Math.PI * 2

  @GetRandomRadians: ->
    return new Radians Radians.GetRandomAngle()


  @GetRandomAngle: ->
    return random.between Radians.MIN_RADIANS, Radians.MAX_RADIANS


  constructor: (radians) ->
    assert radians >= Radians.MIN_RADIANS, "Radians too low"
    assert radians <= Radians.MAX_RADIANS, "Radians too high"

    super radians


  toDegrees: ->
    return @rad2Deg()


module.exports = Radians
