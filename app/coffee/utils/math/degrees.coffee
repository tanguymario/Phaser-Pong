assert = require 'assert'

random = require './random.coffee'

Angle = require './angle.coffee'

class Degrees extends Angle
  @MIN_DEGREES = 0
  @MAX_DEGREES = 360

  @GetRandomDegrees: ->
    return new Degrees Degrees.GetRandomAngle()


  @GetRandomAngle: ->
    return random.between Degrees.MIN_DEGREES, Degrees.MAX_DEGREES


  constructor: (degrees) ->
    degrees %= Degrees.MAX_DEGREES
    super degrees


  getInverse: ->
    @value %= Degrees.MAX_DEGREES
    return @value - Degrees.MAX_DEGREES / 2


  toRadians: ->
    return @deg2Rad()

module.exports = Degrees
