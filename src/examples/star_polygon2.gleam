import color
import gleam/io
import image.{outline, star_polygon, to_svg}

pub fn main() {
  star_polygon(40.0, 7, 3, [outline(color.darkred)])
  |> to_svg
  |> io.println
}
