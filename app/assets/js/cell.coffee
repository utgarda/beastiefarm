class window.Cell
  CENTER = new PIXI.Point(0.5, 0.5)
  APPEAR_TIMER_MAX = 200

  @TEXTURES_BY_TYPE = {}

  @capitalise: (string) ->
    string[0].toUpperCase() + string.slice(1).toLowerCase()

  @textureFromType: (type) ->
    t = window.Cell.TEXTURES_BY_TYPE[type]
    if !t?
      file = "assets/bower_components/kenney-hexagon/PNG/tile#{window.Cell.capitalise(type)}.png"
      t = window.Cell.TEXTURES_BY_TYPE[type] = PIXI.Texture.fromImage file
    t


  constructor: (@x, @y, @center, @type, @grid, visible = true) ->
    @bg = new PIXI.Sprite window.Cell.textureFromType(@type)
    @bg.anchor = CENTER
    @bg.position = @center.clone()
    @bg.visible = visible
    @grid.addChild @bg

  add: (agent) ->
    @child = agent.graphics
    @bg.addChild @child

  clear: () ->
    @bg.removeChild @child

  appear: () ->
    @appearTimer = APPEAR_TIMER_MAX
    @bg.visible = true
    @bg.alpha = 0

  tick: () ->
    if(@appearTimer > 0)
      @appearTimer -= 1
      m = (APPEAR_TIMER_MAX - @appearTimer) / APPEAR_TIMER_MAX
      @bg.alpha = m
      @bg.position.set(@center.x, @center.y + @appearTimer * 2)
      @bg.scale.x = @bg.scale.y = m
