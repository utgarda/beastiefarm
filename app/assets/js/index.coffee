stage = new PIXI.Stage 0x000000 #0x661199

view = document.getElementById("mainView")
width = view.offsetWidth
height = view.offsetHeight
renderer = PIXI.autoDetectRenderer width, height, view: view

@center = new PIXI.Point width / 2, height / 2

@grid = new window.HexGrid window.gridWidth, window.gridHeight
stage.addChild @grid.container
@grid.container.position = center

animate = ()->
  renderer.render stage
  @grid.tick()
  requestAnimFrame animate

requestAnimFrame animate
