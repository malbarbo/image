import fill
import gleam/io
import image.{regular_polygon, to_svg}

pub fn main() {
  regular_polygon(20.0, 8, fill.red)
  |> to_svg
  |> io.println
}
