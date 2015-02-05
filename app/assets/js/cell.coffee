class window.Cell
  CENTER = new PIXI.Point(0.5, 0.5)

  @TEXTURES_BY_TYPE = {}

  @capitalise: (string) ->
    string[0].toUpperCase() + string.slice(1).toLowerCase()

  @textureFromType: (type) ->
    t = window.Cell.TEXTURES_BY_TYPE[type]
    if !t?
      file = "assets/bower_components/kenney-hexagon/PNG/tile#{window.Cell.capitalise(type)}.png"
      t = window.Cell.TEXTURES_BY_TYPE[type] = PIXI.Texture.fromImage file
    t


  constructor: (@x, @y, @center, @type, @grid) ->
    @bg = new PIXI.Sprite window.Cell.textureFromType(@type)
    @bg.anchor = CENTER
    @bg.position = @center

    @grid.addChild @bg

  add: (agent) ->
    @child = agent.graphics
    @bg.addChild @child

  clear: () ->
    @bg.removeChild @child

  tick: ()->
    Console.log("cell tick")
    Console.log(@x)
    @step += 1
    @graphics.position.y += Math.sin(@step * 0.1 + @x + @y) * 20
