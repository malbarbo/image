import fill
import gleam/io
import image.{regular_polygon, to_svg}

pub fn main() {
  regular_polygon(40.0, 4, fill.blue)
  |> to_svg
  |> io.println
}
