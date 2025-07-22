import color
import gleam/io
import image.{Point, fill, polygon, to_svg}

pub fn main() {
  polygon(
    [Point(0.0, 0.0), Point(-10.0, 20.0), Point(60.0, 0.0), Point(-10.0, -20.0)],
    [fill(color.burlywood)],
  )
  |> to_svg
  |> io.println
}
