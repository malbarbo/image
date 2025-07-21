import color
import gleam/io
import image.{fill, star_polygon, to_svg}

pub fn main() {
  star_polygon(40.0, 5, 2, [fill(color.seagreen)])
  |> to_svg
  |> io.println
}
