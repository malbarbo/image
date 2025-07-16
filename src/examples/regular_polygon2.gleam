import color
import gleam/io
import image.{fill, regular_polygon, to_svg}

pub fn main() {
  regular_polygon(40.0, 4, [fill(color.blue)])
  |> to_svg
  |> io.println
}
