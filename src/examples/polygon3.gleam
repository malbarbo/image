import fill
import gleam/io
import image.{Point, polygon, to_svg}

pub fn main() {
  polygon(
    [
      Point(0.0, 0.0),
      Point(0.0, 40.0),
      Point(20.0, 40.0),
      Point(20.0, 60.0),
      Point(40.0, 60.0),
      Point(40.0, 20.0),
      Point(20.0, 20.0),
      Point(20.0, 0.0),
    ],
    fill.plum,
  )
  |> to_svg
  |> io.println
}
