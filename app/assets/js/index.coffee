stage = new PIXI.Stage 0x661199

view = document.getElementById("mainView")
renderer = PIXI.autoDetectRenderer view.offsetWidth, view.offsetHeight, view: view

@grid = new window.HexGrid 10, 10
@grid.container.position = new PIXI.Point(50, 50)
stage.addChild @grid.container

animate = ()->
  renderer.render stage
  requestAnimFrame animate

requestAnimFrame animate
