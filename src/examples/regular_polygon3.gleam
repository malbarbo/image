import color
import gleam/io
import image.{fill, regular_polygon, to_svg}

pub fn main() {
  regular_polygon(20.0, 8, [fill(color.red)])
  |> to_svg
  |> io.println
}
