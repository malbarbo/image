import fill
import gleam/io
import image.{Point, place_polygon, square, to_svg}

pub fn main() {
  square(50.0, fill.lightblue)
  |> place_polygon(
    [
      Point(25.0, -10.0),
      Point(60.0, 25.0),
      Point(25.0, 60.0),
      Point(-10.0, 25.0),
    ],
    fill.pink,
  )
  |> to_svg
  |> io.println
}
