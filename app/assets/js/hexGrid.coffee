class window.HexGrid
  CELL_WIDTH = 65
  CELL_HEIGHT = 65
  ROW_STEP = 49

  CELL_TYPES = ['magic', 'dirt', 'rock', 'stone', 'sand', 'water']

  constructor: (@width, @height) ->
    @container = new PIXI.DisplayObjectContainer()
    @centerTileX = @width  // 2
    @centerTileY = @height // 2
    cells_yx = [-@centerTileY...(@height - @centerTileY)].map (y) =>
      [-@centerTileX...(@width - @centerTileX)].map (x)=>
        center = new PIXI.Point (x - y / 2) * CELL_WIDTH, y * ROW_STEP
        type = CELL_TYPES[Math.floor(Math.random() * CELL_TYPES.length)]
        cell = new window.Cell x, y, center, type, @container, false
        delay = Math.pow(center.x * center.x + center.y * center.y, 0.3) * 500 + Math.random() * 2000
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
