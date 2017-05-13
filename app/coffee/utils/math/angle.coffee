class Angle
  constructor: (angle) ->
    @value = angle


  deg2Rad: ->
    return @value * (Math.PI / 180)


  rad2Deg: ->
    return @value * (180 / Math.PI)


module.exports = Angle
