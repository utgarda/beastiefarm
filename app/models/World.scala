package models

/**
 * Created by etsvigun on 06/02/15.
 */


sealed case class Terrain(id: Int,
                          name: String,
                          height: Int)


object Terrains {
  val Water = Terrain(0, "Water", 0)
  val Sand = Terrain(1, "Sand", 1)
  val Dirt = Terrain(2, "Dirt", 2)
  val Grass = Terrain(3, "Grass", 2)
  val Lava = Terrain(4, "Lava", 3)
  val Magic = Terrain(5, "Magic", 4)
  val Stone = Terrain(6, "Stone", 5)
  val Rock = Terrain(7, "Rock", 6)

  val All: Seq[Terrain] = Seq(Water, Sand, Dirt, Grass, Lava, Magic, Stone, Rock)

}


object Terrain extends Enumeration {
  type Terrain = Value
  val Water, Sand, Dirt, Grass, Lava, Magic, Stone, Rock = Value
}


class World {

}
