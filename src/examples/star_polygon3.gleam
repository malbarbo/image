import color
import gleam/io
import image.{fill, star_polygon, to_svg}

pub fn main() {
  star_polygon(20.0, 10, 3, [fill(color.cornflowerblue)])
  |> to_svg
  |> io.println
}
