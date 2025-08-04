import fill
import gleam/io
import image.{Point, polygon, to_svg}

pub fn main() {
  polygon(
    [Point(0.0, 0.0), Point(-10.0, 20.0), Point(60.0, 0.0), Point(-10.0, -20.0)],
    fill.burlywood,
  )
  |> to_svg
  |> io.println
}
