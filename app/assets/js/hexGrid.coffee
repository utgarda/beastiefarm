class window.HexGrid
  CELL_WIDTH = 65
  CELL_HEIGHT = 65
  ROW_STEP = 49

  constructor: (@width, @height) ->
    @container = new PIXI.DisplayObjectContainer()
    @centerTileX = @width  // 2
    @centerTileY = @height // 2
    cells_yx = [0...@height].map (y) =>
      [0...@width].map (x)=>
        xx = x - @centerTileX
        yy = y - @centerTileY
        center = new PIXI.Point (xx - yy / 2) * CELL_WIDTH, yy * ROW_STEP
        typeId = window.worldMap[x + y * @width]
        type = window.CELL_TYPES[typeId]
        cell = new window.Cell x, y, center, type.name, type.height, @container, false
        delay = Math.pow(center.x * center.x + center.y * center.y, 0.25) * 600 + Math.random() * 2000
        callback = () => cell.appear()
        setTimeout callback, delay
        cell

    @cells = [0...@width].map (x) =>
      [0...@height].map (y) ->
        cells_yx[y][x]

  tick: () ->
    for x in [0...@width]
      for y in [0...@height]
        @cells[x][y].tick()
