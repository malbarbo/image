import fill
import gleam/io
import image.{Point, place_polygon, square, to_svg}

pub fn main() {
  square(65.0, fill.lightblue)
  |> place_polygon(
    [Point(30.0, -20.0), Point(50.0, 50.0), Point(-20.0, 30.0)],
    fill.forestgreen,
  )
  |> to_svg
  |> io.println
}
